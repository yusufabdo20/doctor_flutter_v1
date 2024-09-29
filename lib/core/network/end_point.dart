abstract class EndPoint {
  static const String baseUrl = "https://game-wise.smartleadtech.com/api";
  static const String login = "/login";
  static const String register = "/register";

  // verifyEmail
  static String verifyUser({required String email, required String otp}) =>
      "/auth/verifyToken/$otp/$email";
  static String resendVerifyEmail({required String email}) =>
      "/auth/resend-otp/$email";
  static String getAllCategory({
    required int page,
  }) =>
      "/categories?page=$page";
  static String getAllGames = "/games";
  //faqs
  static String getFaqs = "/faqs";
  //contact-us
  static String contactUs = "/contact-us";
  //user-game
  static String userGame = "/user-game";
  //profile
  static String profile = "/profile";
  ///profile/update
  static String updateProfile = "/profile/update";
  //
  static String uploadAvatar = "/profile/upload-avatar";
  static String getPlans = "/plan";
  static String initPayment = "/availabel-payment-methods";
  static String paymentExecute = "/execute";
  ///game-category
  static String gameCategory = "/game-category";
}
