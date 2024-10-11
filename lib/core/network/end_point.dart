abstract class EndPoint {
  static const String baseUrl = "https://health-care-sys.smartleadtech.com/api";
  static const String login = "/login";
  static const String register = "/register";

  // verifyEmail
  static String verifyUser({required String email, required String otp}) =>
      "/auth/verifyToken/$otp/$email";
  static String resendVerifyEmail({required String email}) =>
      "/auth/resend-otp/$email";

  static String profile = "/profile";

  ///profile/update
  static String updateProfile = "/profile/update";
  //
  static String uploadAvatar = "/profile/upload-avatar";

  ///patients
  ///
  static String patients = "/patients";

  static String getFaqs = "/faqs";

  ///contact-us

  static String contactUs = "/contact-us";

  static String patientDetails({required String id}) => "/patients/$id";

  ///patients/:id/health-records

  static String patientHealthRecords({required String id}) =>
      "/patients/$id/health-records";

  static String patientMedicalHistory({required String id}) =>
      "/patients/$id/medical-history";

  ///patients/health-records
  static String submitHealthRecords = "/patients/health-records";

  ///appointments
  static String appointments = "/appointments";
}
