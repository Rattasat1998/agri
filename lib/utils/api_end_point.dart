class ApiEndPoint {
  static const String getHome = "/home";
  static const String getDashboard = "/dashboard";
  static const String getDashboardAdmin = "/group/for-admin/get-groups";

  static const String getGroup = "/register-get-group";
  static const String sendOTP = "/register-get-otp/{phoneNumber}";
  static const String verifyOTP = "/register-verify-phone";
  static const String register = "/register-agri-app";
  static const String login = "/login-agri-app";
  static const String logout = "/logout-agri-app";


  // news
  static const String getCategory = "/news/category";
  static const String getNewsAll = "/news/all/?page={pageNumber}";
  static const String getNewsByCategory = "/news/category/{categoryId}/?page={pageNumber}";
  static const String getNewsDetailById = "/news/read/{newsId}";
  static const String addNews = "/news/for-admin/add-news";
  static const String updateNewsById = "/news/for-admin/edit/{newsId}";
  static const String deleteNewsById = "/news/for-admin/delete/{newsId}";

  // profile
  static const String getProfile = "/profile/get-profile";
  static const String editProfile = "/profile/edit-profile";
  static const String changeProfile = "/profile/chage-img-profile";

  // training
  static const String getTrainingByDate = "/train/current/{date}";
  static const String getTrainingById = "/train/content/{id}";
  static const String getTrainingUsersById = "/train/for-admin/get-users/register/{id}";
  static const String registerTraining = "/train/register";
  static const String deleteTrainingById = "/train/for-admin/delete/{id}";
  static const String getLogo = "/train/for-admin/get-logo";
  static const String addTraining = "/train/for-admin/add-train";
  static const String editTraining = "/train/for-admin/edit-train/{id}";

  // agricultural
  static const String getGroupInformation = "/group/information";
  static const String getGroupAddress = "/group/address";
  static const String getHeadGroupAddress = "/group/for-head/get-data/group";
  static const String updateHeadGroupAddress = "/group/for-head/edit-data/group";
  static const String getHeadGroupMachine = "/machine/for-head/get-machine";
  static const String getHeadGroupUsers = "/machine/for-head/get-users";
  static const String getMachineTypes = "/machine/for-head/get-machine-type";
  static const String addMachine = "/machine/for-head/add-machine";
  static const String getMachineById = "/machine/for-head/get-machine/{id}";
  static const String updateMachineById = "/machine/for-head/edit-machine/{id}";
  static const String deleteMachineById = "/machine/for-head/delete/{id}";


  static const String getGroupMember = "/group/member";
  static const String getGroupMachine = "/group/machines";
  // header



  // agricultural admin
  static const String getGroupInformationAdmin = "/group/for-admin/get-group/{id}";
  static const String getGroupAddressAdmin = "/group/for-admin/get-address/group/{id}";
  static const String getGroupMemberAdmin = "/group/for-admin/get-member/group/{id}";
  static const String getGroupMachineAdmin = "/group/for-admin/get-machine/group/{id}";
  static const String downloadDataForAdmin = "/api/group/for-admin/data-download/group/{id}";


  // admin List
  static const String getAdminList = "/admin/for-admin/get-users-admin";

  // machinery
  static const String getMachineryList = "/machine/get-all-machine";
  static const String getMachineryById = "/machine/get-machine-id/{id}";
  static const String getMachineryInformationById = "/machine/get-machine-information/{id}";
  static const String getMachineryHistoryById = "/machine/get-history-machine/{machineId}?page={pageId}";
  static const String getWorkCalendarByMachineryId = "/machine/get-work-calender/{machineId}";
  static const String getObjectivesList = "/machine/get-objective/all";
  static const String createBorrowMachinery = "/machine/borrow-machine";
  static const String receiveMachinery = "/machine/receive-machine/{id}";
  static const String returnMachinery = "/machine/return-machine/{id}";

  // statistics
  static const String getStatistics = "/statistics/get-detail";
  static const String getHistoryInGroup = "/statistics/get-borrow-history/in-group?page={pageNumber}";
  static const String getHistoryOutGroup = "/statistics/get-borrow-history/out-group?page={pageNumber}";
  static const String getBorrowDetailById = "/statistics/get-borrow-by-id/{id}";

// approve
 static const String getApproveInGroup = "/approval-request/get";
 static const String getDetailApproveInGroupById = "/approval-request/get-detail-by-id/{id}";
 static const String approveRequestInGroup = "/approval-request/head-confirm/{id}";
 static const String refuseRequestInGroup = "/approval-request/head-refuse/{id}";

 static const String getApproveOutGroup = "/approval-request/out-group/get";
  static const String getDetailApproveOutGroupById = "/approval-request/out-group/get-detail-by-id/{id}";
  static const String approveRequestOutGroup = "/approval-request/out-group/head-confirm/{id}";
  static const String refuseRequestOutGroup = "/approval-request/out-group/head-refuse/{id}";

  static const String getRequestHistoryInGroup = "/approval-request/get-history/?page={pageNumber}";
  static const String getRequestHistoryOutGroup = "/approval-request/get-history/out-group/?page={pageNumber}";


  static const String storeFcm = "/notification/store-token";

  // notification
  static const String getNotification = "/notification/get-noti/?page={pageNumber}";
  static const String getNotificationCount = "/notification/get-count-noti";
  static const String readedNotification = "/notification/set-readed/{id}";


  // change password
  static const String changePassword = "/profile/change-password";

  // forgot password
  static const String forgotPassword = "/forget-password-get-otp/{phoneNumber}";
  static const String verifyForgotPassword = "/forget-password-verify-phone";
  static const String changeForgotPassword = "/forget-password/change-password-new";


  static const String getMachineryMapList = "/machine/get-all-machine-in-maps";


  static const String infoIntro = "/summary/information-intro";
  static const String infoInSystemRice = "/summary/information";


  static const String closeAccount = "/profile/close-account";
  static const String restoreAccount = "/user-account/restore/{restore_token}";


}