import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/provider/doctor_provider/doctor_provider.dart';
import 'package:capstone_project/widgets/bottom_navigation_bar_widget.dart';
import 'package:capstone_project/widgets/doctor_card_widget.dart';
import 'package:capstone_project/widgets/menu_doctor_widget.dart';
import 'package:capstone_project/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({super.key});

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  late DoctorProvider doctorProvider;
  // Example in _DoctorScreenState

  final List<String> displayedSpecializations = [
    'Bedah Kardiovaskular',
    'Jantung',
    'Pulmonologis',
    'Imunologi',
    'Infeksiologis',
    'Oftalmologis',
    'Dokter Gigi',
  ];

  @override
  void initState() {
    super.initState();
    doctorProvider = Provider.of<DoctorProvider>(context, listen: false);
    doctorProvider.setMenuIndexChangedCallback(() {
      // Handle the callback, for example, update the UI
      setState(() {});
    });
    Provider.of<DoctorProvider>(context, listen: false).fetchDoctor();
  }

  TextEditingController searchController = TextEditingController();

  void _performSearch(String keyword) {
    Provider.of<DoctorProvider>(context, listen: false).searchDoctor(keyword);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          _buildSearchBar(),
          _buildMenuDoctor(),
          _buildDoctorGrid(),
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(
        currentIndex: 1,
      ),
    );
  }

  SliverAppBar _buildSliverAppBar() {
    return SliverAppBar(
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          'Dokter',
          style: ThemeTextStyle().titleMedium.copyWith(
                fontSize: 20,
                color: const Color(0xffFBFBFB),
              ),
        ),
        centerTitle: true,
        titlePadding: const EdgeInsets.only(bottom: 14.0),
        background: Container(
          color: ThemeColor().primaryFrame,
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildSearchBar() {
    return SliverToBoxAdapter(
      child: Container(
        color: ThemeColor().primaryButtonActive,
        child: SearchBarWidget(
          onSubmitted: _performSearch,
          title: 'Cari dokter populer, kulit & kelamin, nutrisi',
          controller: searchController,
        ),
      ),
    );
  }

  SliverAppBar _buildMenuDoctor() {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      toolbarHeight: 21,
      floating: false,
      pinned: true,
      expandedHeight: 0,
      flexibleSpace: Consumer<DoctorProvider>(
        builder: (context, doctorProvider, _) => MenuDoctor(
          selectedMenuIndex: doctorProvider.selectedMenuIndex,
          onMenuChanged: (index) {
            doctorProvider.setMenuIndex(index);
          },
          doctorItems: displayedSpecializations,
        ),
      ),
      bottom: const PreferredSize(preferredSize: Size.zero, child: Text('')),
    );
  }

  SliverPadding _buildDoctorGrid() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
      sliver: Consumer<DoctorProvider>(
        builder: (context, value, child) {
          final doctors = doctorProvider.filteredDoctors;

          if (doctors.isEmpty) {
            // Display a message when the doctor list is empty
            return const SliverToBoxAdapter(
              child: Center(
                child: Text(
                  'Dokter tidak tersedia',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            );
          }
          return SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              mainAxisExtent: 210,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (index < doctorProvider.filteredDoctors.length) {
                  final doctor = doctorProvider.filteredDoctors[index];
                  return DoctorCardWidget(
                    doctorName: doctor.fullname,
                    specialty: doctor.specialist,
                    imageUrl: doctor.profilePicture,
                    price: doctor.price.toString(),
                    isOnline: doctor.status,
                    onTap: () {
                      Navigator.pushNamed(context, '/detailDoctor',
                          arguments: doctor.id);
                    },
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
              childCount: doctorProvider.filteredDoctors.length,
            ),
          );
        },
      ),
    );
  }
}
