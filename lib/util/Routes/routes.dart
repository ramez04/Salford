import 'package:clean_archi/presentation/bindings/bookmarks_binding.dart';
import 'package:clean_archi/presentation/bindings/course_details_binding.dart';
import 'package:clean_archi/presentation/bindings/home_binding.dart';
import 'package:clean_archi/presentation/bindings/login_binding.dart';
import 'package:clean_archi/presentation/bindings/my_courses_binding.dart';
import 'package:clean_archi/presentation/bindings/new/history_binding.dart';
import 'package:clean_archi/presentation/bindings/new/payment_method_binding.dart';
import 'package:clean_archi/presentation/bindings/new/profile_binding.dart';
import 'package:clean_archi/presentation/bindings/new/settings_binding.dart';
import 'package:clean_archi/presentation/bindings/new/subscription_binding.dart';
import 'package:clean_archi/presentation/bindings/on_boarding_binding.dart';
import 'package:clean_archi/presentation/bindings/signup_binding.dart';
import 'package:clean_archi/presentation/bindings/splash_binding.dart';
import 'package:clean_archi/presentation/screens/bookmarks_screen.dart';
import 'package:clean_archi/presentation/screens/course_details_screen.dart';
import 'package:clean_archi/presentation/screens/home_screen.dart';
import 'package:clean_archi/presentation/screens/login_screen.dart';
import 'package:clean_archi/presentation/screens/my_courses_screen.dart';
import 'package:clean_archi/presentation/screens/new/history_screen.dart';
import 'package:clean_archi/presentation/screens/new/payment_method_screen.dart';
import 'package:clean_archi/presentation/screens/new/profile_screen.dart';
import 'package:clean_archi/presentation/screens/new/settings_screen.dart';
import 'package:clean_archi/presentation/screens/new/subscription_screen.dart';
import 'package:clean_archi/presentation/screens/on_boarding_screen.dart';
import 'package:clean_archi/presentation/screens/signup_screen.dart';
import 'package:clean_archi/presentation/screens/splash_screen.dart';
import 'package:clean_archi/presentation/screens/welcome_screen.dart';
import 'package:clean_archi/util/Routes/route_strings.dart';
import 'package:get/get.dart';

List<GetPage> getPages = [
  GetPage(
    name: RouteStrings.splash,
    page: () => SplashScreen(),
    binding: SplashBinding(),
  ),
  GetPage(name: RouteStrings.welcome, page: () => WelcomeScreen()),
  GetPage(
    name: RouteStrings.onBoarding,
    page: () => OnBoardingScreen(),
    binding: OnBoardingBinding(),
  ),
  GetPage(
    name: RouteStrings.login,
    page: () => LoginScreen(),
    binding: LoginBinding(),
  ),
  GetPage(
    name: RouteStrings.signup,
    page: () => SignupScreen(),
    binding: SignupBinding(),
  ),
  GetPage(
    name: RouteStrings.home,
    page: () => HomeScreen(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: RouteStrings.courseDetails,
    page: () => CourseDetailsScreen(),
    binding: CourseDetailsBinding(),
  ),
  GetPage(
    name: RouteStrings.bookmarks,
    page: () => BookmarksScreen(),
    binding: BookmarksBinding(),
  ),
  GetPage(
    name: RouteStrings.myCourses,
    page: () => MyCoursesScreen(),
    binding: MyCoursesBinding(),
  ),
  GetPage(
    name: RouteStrings.section,
    page: () => SettingsScreen(),
    binding: SettingsBinding(),
  ),
  GetPage(
    name: RouteStrings.profile,
    page: () => ProfileScreen(),
    binding: ProfileBinding(),
  ),
  GetPage(
    name: RouteStrings.paymentMethod,
    page: () => PaymentMethodScreen(),
    binding: PaymentMethodBinding(),
  ),
  GetPage(
    name: RouteStrings.subscriptions,
    page: () => SubscriptionScreen(),
    binding: SubscriptionBinding(),
  ),
  GetPage(
    name: RouteStrings.settings,
    page: () => SettingsScreen(),
    binding: SettingsBinding(),
  ),
  GetPage(
    name: RouteStrings.history,
    page: () => HistoryScreen(),
    binding: HistoryBinding(),
  ),
];
