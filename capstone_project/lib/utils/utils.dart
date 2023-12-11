class Urls {
  static const String baseUrl = "https://www.healthify.my.id";
  static const String register = "/users/register";
  static const String signIn = "/users/login";
  static const String getotp = "/users/get-otp";
  static const String verifyotp = "/users/verify-otp";
  static const String changepassword = "/users/change-password";
  static const String profile = "/users/profile";
  static const String avilabledoctors =
      "/users/doctors/available?limit=5&offset=0";
  static const String alldoctorsspecialization =
      "/users/doctors?specialist=gigi&limit=5&offset=0";
  static const String byid = "/users/4";
  static const String allmedicines = "/users/medicines?offset=0&limit=5";
  static const String medicinebyname =
      "/users/medicines?offset=0&limit=5&name=ZZ";
  static const String medicinebyid = "/users/medicines/:medicine_id";
  static const String chatbots = "/customerservice";
  static const String articles = "/users/articles";
  static const String doctortransactions = "/users/doctor-payments/:doctor_id";
  static const String doctortransactionsbyid =
      "/users/doctor-payments/:transaction_id";
  static const String doctortransactionsbystatus =
      "/users/doctor-payments?payment_status=value&offset=value&limit=value";
  static const String alldoctortransactionshistory = "/users/doctor-payments";
  static const String createcheckout =
      "/users/medicines-payments/checkout?medicine_transaction_id=61";
  static const String allcheckout =
      "/users/medicines-payments/checkout?offset=0&limit=5";
  static const String checkoutbystatus =
      "/users/medicines-payments/checkout?offset=0&limit=5&payment_status=pending";
  static const String checkoutbyid = "/users/medicines-payments/checkout/33";
  static const String medicinetransaction = "/users/medicines-payments";
  static const String allmedicinetransactions =
      "/users/medicines-payments?offset=0&limit=5";
  static const String medicinetransactionbystatus =
      "/users/medicines-payments?offset=0&limit=5&status_transaction=sudah dibayar";
  static const String medicinetransactionbyid = "/users/medicines-payments/61";
  static const String deletemedicinetransaction = "/users/medicines-payments/4";
  static const String roomchat = "/users/chats/:transaction_id";
  static const String complaintmessage = "/users/chats/:roomchat_id/message";
  static const String roomchatbyid = "/users/chats/2";
}
