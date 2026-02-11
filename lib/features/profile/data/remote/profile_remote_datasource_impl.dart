import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:retry/retry.dart';
import 'package:social_mate_app/features/profile/data/models/profile_model.dart';
import 'package:social_mate_app/features/profile/data/remote/profile_remote_datasource.dart';
import 'package:social_mate_app/features/profile/domain/entities/profile_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: ProfileRemoteDatasource)
class ProfileRemoteDatasourceImpl implements ProfileRemoteDatasource {
  final SupabaseClient _supabaseClient;
  final RetryOptions _retryOptions;

  ProfileRemoteDatasourceImpl(this._supabaseClient, this._retryOptions);

  @override
  Future<ProfileEntity> getProfile() async {
    try {
      final userId = _supabaseClient.auth.currentUser?.id;
      if (userId == null) throw Exception("User not authenticated");

      final response = await _retryOptions.retry(
        () => _supabaseClient
            .from('users')
          .select('*, follows!following_id(follower_id), posts!author_id(*)')
          .eq('id', userId)
          .single(),
          retryIf: (e) => e is TimeoutException || e is SocketException,
        onRetry: (e) => debugPrint('Retrying getProfile due to: $e'),
      );

      return ProfileModel.fromJson(response, userId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ProfileEntity> getProfileById(String userId) async {
    try {
      final currentUserId = _supabaseClient.auth.currentUser?.id;
      if (currentUserId == null) {
        throw Exception('User is not authenticated');
      }

      final response = await _retryOptions.retry(
        () => _supabaseClient
            .from('users')
          .select('*, follows!following_id(follower_id), posts!author_id(*)')
          .eq('id', userId)
          .single(),
          retryIf: (e) => e is TimeoutException || e is SocketException,
        onRetry: (e) => debugPrint('Retrying getProfileById due to: $e'),
      );

      return ProfileModel.fromJson(response, currentUserId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> followUser(String userId) async {
    try {
      final currentUserId = _supabaseClient.auth.currentUser?.id;
      if (currentUserId == null) {
        throw Exception('User is not authenticated');
      }

      //await _supabaseClient.from('follows').insert({
      //  'follower_id': currentUserId,
      //  'following_id': userId,
      //});
      await _retryOptions.retry(
        () => _supabaseClient
          .from('follows')
          .upsert(
            {'follower_id': currentUserId, 'following_id': userId},
            onConflict: 'follower_id, following_id',
            ignoreDuplicates: true,
          ),
          retryIf: (e) => e is TimeoutException || e is SocketException,
        onRetry: (e) => debugPrint('Retrying followUser due to: $e'),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> unfollowUser(String userId) async {
    try {
      final currentUserId = _supabaseClient.auth.currentUser?.id;
      if (currentUserId == null) {
        throw Exception('User is not authenticated');
      }

      await _retryOptions.retry(
        () => _supabaseClient.from('follows').delete().match({
        'follower_id': currentUserId,
        'following_id': userId,
      }),
      retryIf: (e) => e is TimeoutException || e is SocketException,
        onRetry: (e) => debugPrint('Retrying unfollowUser due to: $e'),
      );
    } catch (e) {
      rethrow;
    }
  }
  
  @override
  Future<void> trackProfileView(String viewedUserId) async {
    try {
      final currentUserId = _supabaseClient.auth.currentUser?.id;
      if (currentUserId == null) {
        throw Exception('User is not authenticated');
      }

      await _retryOptions.retry(
        () => _supabaseClient.from('profile_views').insert({
        'viewer_id': currentUserId,
        'viewed_id': viewedUserId,
      }),
      retryIf: (e) => e is TimeoutException || e is SocketException,
        onRetry: (e) => debugPrint('Retrying trackProfileView due to: $e'),
      );
    } catch (e) {
      rethrow;
    }
  }
}
