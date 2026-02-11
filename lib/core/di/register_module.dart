import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:retry/retry.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  SupabaseClient get supabaseClient => Supabase.instance.client;

  @lazySingleton
  ImagePicker get imagePicker => ImagePicker();

  @lazySingleton
  RetryOptions get retryOptions => RetryOptions(
    maxAttempts: 5,
    delayFactor: const Duration(seconds: 1),
    maxDelay: const Duration(seconds: 8),
  );
}
