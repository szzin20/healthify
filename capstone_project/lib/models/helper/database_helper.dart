import 'package:capstone_project/models/cart_model.dart';
import 'package:capstone_project/models/order_med_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static late Database _database;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  final String _tableNameCart = 'cart';

  Future<Database> _initializeDb() async {
    var db = await openDatabase(
      join(await getDatabasesPath(), 'healthify_db.db'),
      onCreate: (db, version) async {
        await db.execute(
          '''
          CREATE TABLE $_tableNameCart(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            code TEXT,
            name TEXT,
            merk TEXT,
            category TEXT,
            type TEXT,
            price INTEGER,
            stock INTEGER,
            details TEXT,
            image TEXT,
            quantity INTEGER DEFAULT 1
          )''',
        );
      },
      version: 1,
    );
    return db;
  }

  Future<List<MedicineDetail>> getAllMedicineDetails() async {
    final Database db = await database;
    List<Map<String, dynamic>> result = await db
        .query(_tableNameCart, columns: ['id', 'quantity', 'total_price']);

    return result.map((map) {
      return MedicineDetail(
        medicineId: map['id'],
        quantity: map['quantity'],
        totalPriceMedicine: map['total_price'],
      );
    }).toList();
  }

  Future<void> insertToCart(Result medicine) async {
    final Database db = await database;
    final existingMedicine = await getCartItemById(medicine.id);

    if (existingMedicine != null) {
      // Medicine with the same id already exists, update its quantity
      final updatedMedicine = existingMedicine.copyWith(
        quantity: existingMedicine.quantity + 1,
      );
      await updateCartItem(updatedMedicine);
    } else {
      // Medicine with the id doesn't exist, insert a new record
      await db.insert(
        _tableNameCart,
        medicine.toJson()..remove('id'),
      );
    }
  }

  Future<Result?> getCartItemById(int id) async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      _tableNameCart,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return Result.fromJson(results.first);
    } else {
      return null;
    }
  }

  Future<List<Result>> getCartItems() async {
    final Database db = await database;
    List<Map<String, dynamic>> result = await db.query(_tableNameCart);
    return result.map((e) => Result.fromJson(e)).toList();
  }

  Future<void> updateCartItem(Result medicine) async {
    final db = await database;
    await db.update(
      _tableNameCart,
      medicine.toJson(),
      where: 'id = ?',
      whereArgs: [medicine.id],
    );
  }

  Future<void> removeFromCart(int id) async {
    final Database db = await database;
    await db.delete(
      _tableNameCart,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> addQuantity(int id) async {
    final db = await database;
    await db.rawUpdate('''
      UPDATE $_tableNameCart
      SET quantity = quantity + 1
      WHERE id = ?
    ''', [id]);
  }

  Future<void> removeQuantity(int id) async {
    final db = await database;
    await db.rawUpdate('''
      UPDATE $_tableNameCart
      SET quantity = GREATEST(quantity - 1, 1)
      WHERE id = ?
    ''', [id]);
  }

  Future<void> removeAllQuantity(int id) async {
    final db = await database;
    await db.rawUpdate('''
      UPDATE $_tableNameCart
      SET quantity = 1
      WHERE id = ?
    ''', [id]);
  }

  Future<void> clearCart() async {
    final db = await database;
    await db.delete(_tableNameCart);
  }
}
