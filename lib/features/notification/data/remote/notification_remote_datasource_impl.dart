import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:retry/retry.dart';
import 'package:social_mate_app/features/notification/data/models/notification_model.dart';
import 'package:social_mate_app/features/notification/data/remote/notification_remote_datasource.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: NotificationRemoteDataSource)
class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final SupabaseClient _supabaseClient;
  final RetryOptions _retryOptions;

  NotificationRemoteDataSourceImpl(this._supabaseClient, this._retryOptions);

  @override
  Future<List<NotificationModel>> getNotifications() async {
    final userId = _supabaseClient.auth.currentUser?.id;
    if (userId == null) return [];

    try {
      final response = await _retryOptions.retry(
        () => _supabaseClient
            .from('notifications')
            .select('* , users:actor_id(*)')
            .eq('user_id', userId)
            .order('created_at', ascending: false),
        //.timeout(Duration(seconds: 15)),
        retryIf: (e) => e is TimeoutException || e is SocketException,
        onRetry: (e) => debugPrint('Retrying getNotifications due to: $e'),
      );

      return response.map((json) => NotificationModel.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> markAsRead(String notificationId) async {
    try {
      await _retryOptions.retry(
        () => _supabaseClient
            .from('notifications')
            .update({'is_read': true})
            .eq('id', notificationId),
        //.timeout(Duration(seconds: 15)),
        retryIf: (e) => e is TimeoutException || e is SocketException,
        onRetry: (e) => debugPrint('Retrying markAsRead due to: $e'),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> markAllAsRead() async {
    final userId = _supabaseClient.auth.currentUser?.id;
    if (userId == null) return;

    try {
      await _retryOptions.retry(
        () => _supabaseClient
            .from('notifications')
            .update({'is_read': true})
            .eq('user_id', userId)
            .eq('is_read', false),
        //.timeout(Duration(seconds: 15)),
        retryIf: (e) => e is TimeoutException || e is SocketException,
        onRetry: (e) => debugPrint('Retrying markAllAsRead due to: $e'),
      );
    } catch (e) {
      rethrow;
    }
  }
}
