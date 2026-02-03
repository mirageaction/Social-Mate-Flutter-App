import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/home/data/models/story_model.dart';
import 'package:social_mate_app/features/home/data/remote/story_remote_datasource.dart';
import 'package:social_mate_app/features/home/domain/entities/story_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: StoryRemoteDataSource)
class StoryRemoteDatasourceImpl implements StoryRemoteDataSource {
  final SupabaseClient supabaseClient;
  StoryRemoteDatasourceImpl({required this.supabaseClient});

  @override
  Future<List<StoryEntity>> getStories() async {
    try {
      final response = await supabaseClient
          .from('stories')
          .select('*, users(name)') // This joins the users table and selects the name
          .order('created_at', ascending: false);
      
      return response.map((json) => StoryModel.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
