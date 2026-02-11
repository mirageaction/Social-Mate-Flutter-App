import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/notification/domain/entities/notification_entity.dart';
import 'package:social_mate_app/features/notification/domain/repos/notification_repo.dart';

@lazySingleton
class GetNotificationsUseCase {
  final NotificationRepo _notificationRepo;

  GetNotificationsUseCase(this._notificationRepo);

  Future<List<NotificationEntity>> call() async {
    return await _notificationRepo.getNotifications();
  }
}
