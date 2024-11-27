import 'package:agri/screens/notification/models/notification_model.dart';

abstract class BaseNotificationRepository {

  Future<NotificationModel> getNotifications({required int pageNumber});

  Future getNotificationCount();

  Future readedNotification({required int id});

}