import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/notification/data/models/notification_model.dart';
import 'package:social_mate_app/features/notification/data/remote/notification_remote_datasource.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: NotificationRemoteDataSource)
class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final SupabaseClient _supabaseClient;

  NotificationRemoteDataSourceImpl(this._supabaseClient);

  @override
  Future<List<NotificationModel>> getNotifications() async {
    final userId = _supabaseClient.auth.currentUser?.id;
    if (userId == null) return [];

    try {
      final response = await _supabaseClient
          .from('notifications')
          .select('* , users:actor_id(*)')
          .eq('user_id', userId) 
          .order('created_at', ascending: false);

      return response.map((json) => NotificationModel.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> markAsRead(String notificationId) async {
    try {
      await _supabaseClient
          .from('notifications')
          .update({'is_read': true})
          .eq('id', notificationId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> markAllAsRead() async {
    final userId = _supabaseClient.auth.currentUser?.id;
    if (userId == null) return;

    try {
      await _supabaseClient
          .from('notifications')
          .update({'is_read': true})
          .eq('user_id', userId)
          .eq('is_read', false);
    } catch (e) {
      rethrow;
    }
  }
}
