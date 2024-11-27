import 'package:agri/app.dart';
import 'package:agri/models/news_model.dart';
import 'package:agri/screens/dashboard/dashboard_screen.dart';
import 'package:agri/screens/home/pages/admin/admin_page.dart';
import 'package:agri/screens/home/pages/agricultural_information/head/head_add_edit_machinery_page.dart';
import 'package:agri/screens/home/pages/agricultural_information/head/head_edit_address_page.dart';
import 'package:agri/screens/home/pages/agricultural_information/head/head_manage_machinery_page.dart';
import 'package:agri/screens/home/pages/agricultural_information/head/models/group_head_address_model.dart';
import 'package:agri/screens/home/pages/machinery/models/machinery_detail_model.dart';
import 'package:agri/screens/home/pages/machinery/models/machinery_info_model.dart';
import 'package:agri/screens/home/pages/machinery/models/machinery_model.dart';
import 'package:agri/screens/home/pages/machinery/models/objectives_model.dart';
import 'package:agri/screens/home/pages/machinery/pages/history_list_widget.dart';
import 'package:agri/screens/home/pages/machinery/pages/machinery_borrow/machinery_borrow_page.dart';
import 'package:agri/screens/home/pages/machinery/pages/machinery_detail_page.dart';
import 'package:agri/screens/home/pages/machinery/pages/machinery_information_page.dart';
import 'package:agri/screens/home/pages/statistics/pages/statistics_borrow_history_page.dart';
import 'package:agri/screens/home/pages/statistics/pages/statistics_history_detail_page.dart';
import 'package:agri/screens/home/pages/training_schedule/pages/add_edit_training_page/add_edit_training_page.dart';
import 'package:agri/screens/home/pages/training_schedule/pages/training_detail/training_detail_page.dart';
import 'package:agri/screens/login/login_screen.dart';
import 'package:agri/screens/login/pages/forget_password_page/forget_change_new_password_page.dart';
import 'package:agri/screens/login/pages/forget_password_page/forget_otp_verify_page.dart';
import 'package:agri/screens/login/pages/forget_password_page/forget_password_page.dart';
import 'package:agri/screens/machinery_map/machinery_map_screen.dart';
import 'package:agri/screens/navigation_bar.dart';
import 'package:agri/screens/news/pages/add_edit_news/add_edit_news_page.dart';
import 'package:agri/screens/notification/notification_screen.dart';
import 'package:agri/screens/profile/pages/agri_information/models/staff_info_data_model.dart';
import 'package:agri/screens/profile/pages/agri_information/pages/section_1_page.dart';
import 'package:agri/screens/profile/pages/agri_information/pages/section_2/section_2_page.dart';
import 'package:agri/screens/profile/pages/agri_information/pages/section_3/section_3_page.dart';
import 'package:agri/screens/profile/pages/edit_profile_page.dart';
import 'package:agri/screens/profile/profile_screen.dart';
import 'package:agri/screens/register/pages/otp_verify_page.dart';
import 'package:agri/screens/register/pages/set_password_page.dart';
import 'package:agri/screens/register/register_screen.dart';
import 'package:agri/screens/request_machine/pages/request_history_page/request_history_page.dart';
import 'package:agri/screens/request_machine/request_machine_screen.dart';
import 'package:agri/screens/screens.dart';
import 'package:agri/screens/setting/pages/change_password_page/change_password_page.dart';
import 'package:agri/screens/setting/setting_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/home/pages/training_schedule/pages/trianing_user_page/training_users_page.dart';
import '../screens/news/news_page.dart';
import '../screens/news/pages/news_detail_page.dart';
import '../screens/profile/pages/agri_information/agri_information_page.dart';
import '../screens/profile/pages/agri_information/models/staff_info_model.dart';
import '../screens/profile/pages/agri_information/pages/interview_staff_page.dart';
import '../screens/profile/pages/agri_information/pages/section_2/section_2_rice_field_page.dart';
import '../screens/request_machine/pages/request_approve_detail_Page.dart';

class AppRoutes {
  static const String homeScreen = '/home';
  static const String loginScreen = '/login';
  static const String settingScreen = '/setting';
  static const String registerScreen = '/register';
  static const String dashboardScreen = '/dashboard';
  static const String main = '/main';
  static const String profileScreen = '/profile-screen';
  static const String agriInformationScreen = '/agri-information-page';
  static const String machineryMaoScreen = '/machinery-map-screen';
  static const String editProfileScreen = '/edit-profile-page';
  static const String agriculturalInformationPage = '/agricultural-information-page';

  static const String requestMachineScreen = '/request-machine-page';

  static const String machineryPage = '/machinery-page';
  static const String machineryDetailPage = '/machinery-detail-page';
  static const String machineryBorrowPage = '/machinery-borrow-page';
  static const String machineryInfoPage = '/machinery-info-page';
  static const String historyListPage = '/history-list-page';
  static const String requestHistoryPage = '/request-history-page';

  static const String newsPage = '/news-page';
  static const String newsDetailPage = '/news-detail-page';
  static const String addEditNewsPage = '/news-add-edit-page';

  static const String addEditTrainingPage = '/training-add-edit-page';

  static const String statisticsPage = '/statistics-page';
  static const String statisticsBorrowHistoryPage = '/statistics-borrow-history-page';
  static const String statisticsHistoryDetailPage = '/statistics-history-detail-page';
  static const String requestApproveDetailPage = '/request-approve-detail-page';

  static const String trainingSchedulePage = '/training-schedule-page';
  static const String trainingDetailPage = '/training-detail-page';
  static const String registeredTrainingUsersPage = '/register-training-user-page';

  static const String optVerifyPage = '/otp-verify-page';
  static const String setPasswordPage = '/set-password-page';
  static const String adminPage = '/admin-page';

  // head
  static const String headEditAddressPage = '/head-edit-address-page';
  static const String headManageMachineryPage = '/head-manage-machinery-page';
  static const String headAddEditMachineryPage = '/head-add-edit-machinery-page';

  // notification
  static const String notificationScreen = '/notification-screen';
  static const String changePasswordPage = '/change-password-page';
  static const String forgetPasswordPage = '/forget-password-page';
  static const String forgetPasswordVerifyOTPPage = '/forget-password-verify-page';
  static const String forgetChangeNewPasswordPage = '/forget-change-password-page';

  // Interview form
  static const String interviewStaffPage = '/interview-staff-page';
  static const String section1Page = '/section-1-page';
  static const String section2Page = '/section-2-page';
  static const String section3Page = '/section-3-page';
  static const String section2RiceFieldPage = '/section-2-rice-filed-page';
}

class AppRouteGenerator {
  // You can inject your BLoCs here if needed

  static Route<dynamic> generateRoute(RouteSettings settings) {
    print('Go to => ${settings.name}');
    switch (settings.name) {
      // interview form
      case AppRoutes.interviewStaffPage:
        final args = settings.arguments as Map<String, dynamic>;
        final staffs = args['staffs'] as List<Interviewer>;
        final staffData = args['staffData'] as StaffInfoDataModel?;


        return CupertinoPageRoute(builder: (_) => InterviewStaffPage(staffs: staffs, staffData: staffData));

      case AppRoutes.section1Page:
        return CupertinoPageRoute(builder: (_) => const Section1Page());

      case AppRoutes.section2Page:
        return CupertinoPageRoute(builder: (_) => const Section2Page());

      case AppRoutes.section3Page:
        return CupertinoPageRoute(builder: (_) => const Section3Page());

      case AppRoutes.section2RiceFieldPage:
        return CupertinoPageRoute(builder: (_) => const Section2RiceFieldPage());

      case AppRoutes.homeScreen:
        return MaterialPageRoute(builder: (_) => const CustomNavigationBar());

      case AppRoutes.main:
        return CupertinoPageRoute(builder: (_) => const AgriApp());

      case AppRoutes.registerScreen:
        return CupertinoPageRoute(builder: (_) => const RegisterScreen());

      case AppRoutes.dashboardScreen:
        return MaterialPageRoute(builder: (_) => const DashBoardScreen());

      case AppRoutes.settingScreen:
        return CupertinoPageRoute(builder: (_) => const SettingScreen());

      case AppRoutes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case AppRoutes.agriculturalInformationPage:
        return CupertinoPageRoute(builder: (_) => const AgriculturalInformationPage());

      case AppRoutes.machineryPage:
        return CupertinoPageRoute(builder: (_) => const MachineryPage());

      case AppRoutes.machineryMaoScreen:
        return CupertinoPageRoute(builder: (_) => const MachineryMapScreen());

      case AppRoutes.requestHistoryPage:
        return CupertinoPageRoute(builder: (_) => const RequestHistoryPage());

      case AppRoutes.requestMachineScreen:
        return CupertinoPageRoute(builder: (_) => const RequestMachineScreen());

      case AppRoutes.registeredTrainingUsersPage:
        return CupertinoPageRoute(
            builder: (_) => TrainingUsersPage(id: settings.arguments as String));

      case AppRoutes.machineryBorrowPage:
        return CupertinoPageRoute(
            builder: (_) => MachineryBorrowPage(machineryId: settings.arguments as String));

      case AppRoutes.machineryInfoPage:
        return CupertinoPageRoute(builder: (_) => const MachineryInformationPage());

      case AppRoutes.machineryDetailPage:
        final args = settings.arguments;

        return CupertinoPageRoute(
            builder: (_) => MachineryDetailPage(
                  machine: args as MachineList,
                ));

      case AppRoutes.newsPage:
        return CupertinoPageRoute(builder: (_) => const NewsPage());

      case AppRoutes.forgetPasswordPage:
        return CupertinoPageRoute(builder: (_) => const ForgetPasswordPage());

      case AppRoutes.forgetPasswordVerifyOTPPage:
        return CupertinoPageRoute(
            builder: (_) => ForgetOtpVerifyPage(phoneNumber: settings.arguments as String));

      case AppRoutes.forgetChangeNewPasswordPage:
        return CupertinoPageRoute(
            builder: (_) => ForgetChangeNewPasswordPage(phoneNumber: settings.arguments as String));

      case AppRoutes.adminPage:
        return CupertinoPageRoute(builder: (_) => const AdminPage());

      case AppRoutes.profileScreen:
        return CupertinoPageRoute(builder: (_) => const ProfileScreen());

      case AppRoutes.agriInformationScreen:
        return CupertinoPageRoute(builder: (_) => const AgriInformationPage());

      case AppRoutes.editProfileScreen:
        return CupertinoPageRoute(builder: (_) => const EditProfilePage());

      case AppRoutes.historyListPage:
        final Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        final List<History> historyList = args['historyList'] as List<History>;
        final List<Objective> objectives = args['objectives'] as List<Objective>;
        return CupertinoPageRoute(
            builder: (_) => HistoryListWidget(
                  historyList: historyList,
                  objectives: objectives,
                ));

      case AppRoutes.newsDetailPage:
        return CupertinoPageRoute(builder: (_) => const NewsDetailPage());

      case AppRoutes.addEditNewsPage:
        final args = settings.arguments;
        return CupertinoPageRoute(builder: (_) => AddEditNewsPage(isEdit: args as bool));

      case AppRoutes.statisticsPage:
        return CupertinoPageRoute(builder: (_) => const StatisticsPage());

      case AppRoutes.statisticsBorrowHistoryPage:
        return CupertinoPageRoute(builder: (_) => const StatisticsBorrowHistoryPage());

      case AppRoutes.statisticsHistoryDetailPage:
        return CupertinoPageRoute(
            builder: (_) => StatisticsHistoryDetailPage(
                  isFromNotification: settings.arguments as bool,
                ));

      case AppRoutes.requestApproveDetailPage:
        final args = settings.arguments as Map<String, dynamic>;
        final isFromHistory = args['isFromHistory'] as bool;
        final inGroup = args['inGroup'] as int;

        return CupertinoPageRoute(
            builder: (_) => RequestApproveDetailPage(
                  isFromHistory: isFromHistory,
                  inGroup: inGroup,
                ));

      case AppRoutes.trainingSchedulePage:
        return CupertinoPageRoute(builder: (_) => const TrainingSchedulePage());

      case AppRoutes.notificationScreen:
        return CupertinoPageRoute(builder: (_) => const NotificationScreen());

      case AppRoutes.changePasswordPage:
        return CupertinoPageRoute(builder: (_) => const ChangePasswordPage());

      case AppRoutes.addEditTrainingPage:
        final args = settings.arguments;
        return CupertinoPageRoute(builder: (_) => AddEditTrainingPage(isEdit: args as bool));

      case AppRoutes.trainingDetailPage:
        return CupertinoPageRoute(builder: (_) => TrainingDetailPage());

      case AppRoutes.optVerifyPage:
        return CupertinoPageRoute(builder: (_) => const OTPVerifyPage());

      case AppRoutes.setPasswordPage:
        return CupertinoPageRoute(builder: (_) => const SetPasswordPage());
      // Add more cases for additional routes

      case AppRoutes.headManageMachineryPage:
        return CupertinoPageRoute(builder: (_) => const HeadManageMachineryPage());
      // Add more cases for additional routes

      case AppRoutes.headEditAddressPage:
        return CupertinoPageRoute(
            builder: (_) =>
                HeadEditAddressPage(headAddress: settings.arguments as GroupHeadAddressModelData));
      // Add more cases for additional routes

      default:
        // Handle unknown routes
        return CupertinoPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
