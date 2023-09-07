import 'package:get/get.dart';
import 'package:hotel_ci/presentation/aboutus/about_us_screen.dart';
import 'package:hotel_ci/presentation/addCreditcard/add_credit_card_screen.dart';
import 'package:hotel_ci/presentation/addReview/add_review_screen.dart';
import 'package:hotel_ci/presentation/auth/confirm_password/confirm_password.dart';
import 'package:hotel_ci/presentation/auth/forgot_password/forgot_password.dart';
import 'package:hotel_ci/presentation/auth/login/login_register.dart';
import 'package:hotel_ci/presentation/auth/otp_verify/otp_verify_screen.dart';
import 'package:hotel_ci/presentation/auth/splash/splash_screen.dart';
import 'package:hotel_ci/presentation/auth/welcome/welcome_screen.dart';
import 'package:hotel_ci/presentation/booking/booking_screen.dart';
import 'package:hotel_ci/presentation/bottomBar/bottombar_screen.dart';
import 'package:hotel_ci/presentation/chooseRoom/choose_room_screen.dart';
import 'package:hotel_ci/presentation/discover/discover_screen.dart';
import 'package:hotel_ci/presentation/editprofile/edit_profile_screen.dart';
import 'package:hotel_ci/presentation/filter/filter_screen.dart';
import 'package:hotel_ci/presentation/history/history_screen.dart';
import 'package:hotel_ci/presentation/home/home_screen.dart';
import 'package:hotel_ci/presentation/homedetails/room_details.dart';
import 'package:hotel_ci/presentation/language/language_screen.dart';
import 'package:hotel_ci/presentation/location/location_screen.dart';
import 'package:hotel_ci/presentation/myprofile/my_profile_screen.dart';
import 'package:hotel_ci/presentation/nearYou/near_you_map_screen.dart';
import 'package:hotel_ci/presentation/notification/notifications_screen.dart';
import 'package:hotel_ci/presentation/payment/payment_screen.dart';
import 'package:hotel_ci/presentation/review/review_screen.dart';
import 'package:hotel_ci/presentation/reviewDetails/review_details_screen.dart';
import 'package:hotel_ci/presentation/setting/setting_screen.dart';
import 'package:hotel_ci/presentation/support/support_screen.dart';
import 'package:hotel_ci/presentation/terms&condition/terms_condition_screen.dart';
import 'package:hotel_ci/presentation/thankyou/thank_you_screen.dart';

class AppRoutes {
  static String settingScreen = '/settingScreen';
  static String aboutusScreen = '/aboutusScreen';
  static String termsConditionScreen = '/termsConditionScreen';
  static String myProfileScreen = '/myProfileScreen';
  static String editProfileScreen = '/editProfileScreen';
  static String supportScreen = '/SupportScreen';
  static String bottomBarScreen = '/bottomBarScreen';
  static String paymentScreen = '/paymentScreen';
  static String addCreditCardScreen = '/addCreditCardScreen';
  static String bookingScreen = '/bookingScreen';
  static String languageListScreen = '/languageListScreen';
  static String thankYouScreen = '/thankYouScreen';
  static String splashScreen = '/splashScreen';
  static String welcomeScreen = '/welcomeScreen';
  static String loginRegisterScreen = '/loginRegisterScreen';
  static String otpVerifyScreen = '/otpVerifyScreen';
  static String forgotPasswordScreen = '/forgotPasswordScreen';
  static String confirmPasswordScreen = '/confirmPasswordScreen';
  static String homeScreen = '/homeScreen';
  static String homeDetailScreen = '/homeDetailScreen';
  static String discoverScreen = '/discoverScreen';
  static String filterScreen = '/filterScreen';
  static String notificationsScreen = '/notificationsScreen';
  static String historyScreen = '/historyScreen';
  static String reviewsScreen = '/reviewsScreen';
  static String addReviewScreen = '/addReviewScreen';
  static String locationScreen = '/locationScreen';
  static String nearYouMapScreen = '/nearYouMapScreen';
  static String chooseRoomScreen = '/chooseRoomScreen';
  static String reviewDetailsScreen = '/reviewDetailsScreen';

  static List<GetPage> pages = [
    GetPage(name: settingScreen, page: () => SettingScreen()),
    GetPage(name: aboutusScreen, page: () => const AboutusScreen()),
    GetPage(name: termsConditionScreen, page: () => TermsConditionScreen()),
    GetPage(name: myProfileScreen, page: () => MyProfileScreen()),
    GetPage(name: editProfileScreen, page: () => EditProfileScreen()),
    //GetPage(name: supportScreen, page: () => const SupportScreen()),
    GetPage(name: bottomBarScreen, page: () => BottomBarScreen()),
    GetPage(name: paymentScreen, page: () => PaymentScreen()),
    GetPage(name: addCreditCardScreen, page: () => AddCreditCardScreen()),
    GetPage(name: bookingScreen, page: () => BookingScreen()),
    GetPage(name: languageListScreen, page: () => LanguageListScreen()),
    GetPage(name: thankYouScreen, page: () => const ThankYouScreen()),
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: welcomeScreen, page: () => WelcomeScreen()),
    GetPage(name: loginRegisterScreen, page: () => LoginRegisterScreen()),
    GetPage(name: otpVerifyScreen, page: () => const OtpVerifyScreen()),
    GetPage(
        name: forgotPasswordScreen, page: () => const ForgotPasswordScreen()),
    GetPage(
        name: confirmPasswordScreen, page: () => const ConfirmPasswordScreen()),
    GetPage(name: homeScreen, page: () => HomeScreen()),
    GetPage(name: homeDetailScreen, page: () => const HomeDetailScreen()),
    GetPage(name: discoverScreen, page: () => const DiscoverScreen()),
    GetPage(name: filterScreen, page: () => FilterScreen()),
    GetPage(name: notificationsScreen, page: () => const NotificationsScreen()),
    GetPage(name: historyScreen, page: () => const HistoryScreen()),
    GetPage(name: reviewsScreen, page: () => const ReviewsScreen()),
    GetPage(name: addReviewScreen, page: () => AddReviewScreen()),
    GetPage(name: locationScreen, page: () => LocationScreen()),
    GetPage(name: nearYouMapScreen, page: () => NearYouMapScreen()),
    GetPage(name: chooseRoomScreen, page: () => ChooseRoomScreen()),
    GetPage(name: reviewDetailsScreen, page: () => const ReviewDetailsScreen()),
  ];
}
