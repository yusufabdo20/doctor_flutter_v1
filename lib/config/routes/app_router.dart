import 'package:doctor_flutter_v1/config/routes/app_page.dart';
import 'package:doctor_flutter_v1/controller/login_cubit/login_cubit.dart';
import 'package:doctor_flutter_v1/repo/login.dart';
import 'package:doctor_flutter_v1/view/auth/login/screens/login_screen.dart';
import 'package:doctor_flutter_v1/view/splash/splash_screen.dart';
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
      // case AppPage.registerScreen:
      //   return _pageRoute(BlocProvider(
      //     create: (context) => RegisterCubit(
      //       RegisterRepoImpl(),
      //     ),
      //     child: const RegisterView(),
      //   ));
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
      // case AppPage.forgotPasswordScreen:
      //   return _pageRoute(BlocProvider(
      //     create: (context) => ForgetPasswordCubit(
      //       forgetPasswordRepo: ForgetPasswordRepoImpl(),
      //     ),
      //     child: const ForgetPasswordView(),
      //   ));
      // case AppPage.paymentScreen:
      // case AppPage.otpScreen:
      //   return _pageRoute(BlocProvider(
      //     create: (context) => OtpPasswordCubit(otpRepo: OtpRepoImpl()),
      //     child: OtpView(
      //       otpModel: arguments as OtpModel,
      //     ),
      //   ));
      //   //ResetPasswordView
      // case AppPage.resetPassword:
      //   return _pageRoute(const ResetPasswordView());

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
