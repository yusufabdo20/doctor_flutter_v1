import 'package:doctor_flutter_v1/config/routes/app_page.dart';
import 'package:doctor_flutter_v1/controller/doctor_home_layout/doctor_home_layout_cubit.dart';
import 'package:doctor_flutter_v1/controller/forget_password_cubit/forget_password_cubit.dart';
import 'package:doctor_flutter_v1/controller/login_cubit/login_cubit.dart';
import 'package:doctor_flutter_v1/controller/otp_password/otp_password_cubit.dart';
import 'package:doctor_flutter_v1/controller/patient_details_cubit/patient_details_cubit.dart';
import 'package:doctor_flutter_v1/controller/profile/profile_cubit.dart';
import 'package:doctor_flutter_v1/controller/register_cubit/register_cubit_cubit.dart';
import 'package:doctor_flutter_v1/model/otp_model.dart';
import 'package:doctor_flutter_v1/presentation/auth/reset_password/view/reset_password_view.dart';
import 'package:doctor_flutter_v1/presentation/roles/doctor/home_layout/view/doctor_home_layout_view.dart';
import 'package:doctor_flutter_v1/presentation/roles/doctor/patient_details/view/patient_details_view.dart';
import 'package:doctor_flutter_v1/repo/forget_password_repo.dart';
import 'package:doctor_flutter_v1/repo/login.dart';
import 'package:doctor_flutter_v1/repo/otp_repo.dart';
import 'package:doctor_flutter_v1/repo/patient_details_repo.dart';
import 'package:doctor_flutter_v1/repo/profile_repo.dart';
import 'package:doctor_flutter_v1/repo/register_repo.dart';
import 'package:doctor_flutter_v1/repo/sign_up.dart';
import 'package:doctor_flutter_v1/presentation/auth/forget_password/view/forget_passwod_view.dart';
import 'package:doctor_flutter_v1/presentation/auth/login/screens/login_screen.dart';
import 'package:doctor_flutter_v1/presentation/auth/otp/view/otp_view.dart';
import 'package:doctor_flutter_v1/presentation/auth/register/view/register_view.dart';
import 'package:doctor_flutter_v1/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case AppPage.splashScreen:
        return _pageRoute(
          const SplashScreen(),
        );
      case AppPage.loginScreen:
        return _pageRoute(BlocProvider(
          create: (context) => LoginCubit(
            LoginRepoImpl(),
          ),
          child: const LoginScreen(),
        ));
      case AppPage.forgotPasswordScreen:
        return _pageRoute(BlocProvider(
          create: (context) => ForgetPasswordCubit(
            forgetPasswordRepo: ForgetPasswordRepoImpl(),
          ),
          child: const ForgetPasswordView(),
        ));
      case AppPage.registerScreen:
        return _pageRoute(BlocProvider(
          create: (context) => RegisterCubit(
            RegisterRepoImpl(),
          ),
          child: const RegisterView(),
        ));
      case AppPage.otpScreen:
        return _pageRoute(BlocProvider(
          create: (context) => OtpPasswordCubit(otpRepo: OtpRepoImpl()),
          child: OtpView(
            otpModel: arguments as OtpModel,
          ),
        ));
      case AppPage.doctorHomeLayout:
        return _pageRoute(BlocProvider(
          create: (context) => DoctorHomeLayoutCubit(),
          child: const DoctorHomeLayout(),
        ));
      case AppPage.resetPassword:
        return _pageRoute(const ResetPasswordView());

      case AppPage.patientDetailsView:
        return _pageRoute(
          BlocProvider(
            create: (context) => PatientDetailsCubit(
              patientDetailsRepo: PatientDetailsRepoImpl(),
            )..getPatientDetails(arguments),
            child: PatientDetailsView(patientId: arguments as int),
          ),
        );

      // case AppPage.homeScreen:
      //   return _pageRoute(MultiBlocProvider(
      //     providers: [
      //       BlocProvider(
      //           create: (context) => AllCategoryBloc(
      //                 categoryRepo: CategoryRepoImpl(),
      //               )),
      //       BlocProvider(
      //         create: (context) => MyGamesCubit(
      //           myGameRepo: MyGameRepoImpl(),
      //         )..getMyGames(),
      //       ),
      //       BlocProvider(
      //         create: (context) => HomeLayoutCubit(),
      //       ),
      //     ],
      //     child: const HomeView(),
      //   ));

      default:
        return _pageRoute(
          Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  static MaterialPageRoute _pageRoute(Widget page) {
    return MaterialPageRoute(builder: (context) => page);
  }
}
