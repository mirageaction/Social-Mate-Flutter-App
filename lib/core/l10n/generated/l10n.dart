// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppStrings {
  AppStrings();

  static AppStrings? _current;

  static AppStrings get current {
    assert(
      _current != null,
      'No instance of AppStrings was loaded. Try to initialize the AppStrings delegate before accessing AppStrings.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppStrings> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppStrings();
      AppStrings._current = instance;

      return instance;
    });
  }

  static AppStrings of(BuildContext context) {
    final instance = AppStrings.maybeOf(context);
    assert(
      instance != null,
      'No instance of AppStrings present in the widget tree. Did you add AppStrings.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static AppStrings? maybeOf(BuildContext context) {
    return Localizations.of<AppStrings>(context, AppStrings);
  }

  /// `Email/Phone`
  String get emailOrPhoneHint {
    return Intl.message(
      'Email/Phone',
      name: 'emailOrPhoneHint',
      desc: '',
      args: [],
    );
  }

  /// `E-mail/Phone`
  String get emailOrPhoneLabel {
    return Intl.message(
      'E-mail/Phone',
      name: 'emailOrPhoneLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter Password`
  String get enterPassword {
    return Intl.message(
      'Enter Password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordLabel {
    return Intl.message('Password', name: 'passwordLabel', desc: '', args: []);
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Or sign in with`
  String get orSignInWith {
    return Intl.message(
      'Or sign in with',
      name: 'orSignInWith',
      desc: '',
      args: [],
    );
  }

  /// `Google`
  String get google {
    return Intl.message('Google', name: 'google', desc: '', args: []);
  }

  /// `Microsoft`
  String get microsoft {
    return Intl.message('Microsoft', name: 'microsoft', desc: '', args: []);
  }

  /// `Don't have an account? `
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `Enter your name`
  String get nameHint {
    return Intl.message(
      'Enter your name',
      name: 'nameHint',
      desc: '',
      args: [],
    );
  }

  /// `Your Full Name`
  String get nameLabel {
    return Intl.message(
      'Your Full Name',
      name: 'nameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm your password`
  String get confirmPasswordHint {
    return Intl.message(
      'Confirm your password',
      name: 'confirmPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPasswordLabel {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Join Now`
  String get joinNow {
    return Intl.message('Join Now', name: 'joinNow', desc: '', args: []);
  }

  /// `By Using this app you agree with the Terms of Service`
  String get termsAgreement {
    return Intl.message(
      'By Using this app you agree with the Terms of Service',
      name: 'termsAgreement',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Service`
  String get termsOfService {
    return Intl.message(
      'Terms of Service',
      name: 'termsOfService',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email`
  String get invalidEmail {
    return Intl.message(
      'Invalid email',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get emailRequired {
    return Intl.message(
      'Email is required',
      name: 'emailRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get passwordRequired {
    return Intl.message(
      'Password is required',
      name: 'passwordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters long`
  String get passwordTooShort {
    return Intl.message(
      'Password must be at least 6 characters long',
      name: 'passwordTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Name is required`
  String get nameRequired {
    return Intl.message(
      'Name is required',
      name: 'nameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone number`
  String get invalidPhoneNumber {
    return Intl.message(
      'Invalid phone number',
      name: 'invalidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Phone number is required`
  String get phoneNumberRequired {
    return Intl.message(
      'Phone number is required',
      name: 'phoneNumberRequired',
      desc: '',
      args: [],
    );
  }

  /// `Phone number or email is required`
  String get emailOrPhoneRequired {
    return Intl.message(
      'Phone number or email is required',
      name: 'emailOrPhoneRequired',
      desc: '',
      args: [],
    );
  }

  /// `Only Egyptian phone numbers are allowed`
  String get egyptianPhoneError {
    return Intl.message(
      'Only Egyptian phone numbers are allowed',
      name: 'egyptianPhoneError',
      desc: '',
      args: [],
    );
  }

  /// `Or sign up with`
  String get orSignUpWith {
    return Intl.message(
      'Or sign up with',
      name: 'orSignUpWith',
      desc: '',
      args: [],
    );
  }

  /// `Share Story`
  String get shareStory {
    return Intl.message('Share Story', name: 'shareStory', desc: '', args: []);
  }

  /// `Create a Story`
  String get createStory {
    return Intl.message(
      'Create a Story',
      name: 'createStory',
      desc: '',
      args: [],
    );
  }

  /// `Text Story`
  String get textStory {
    return Intl.message('Text Story', name: 'textStory', desc: '', args: []);
  }

  /// `Camera`
  String get camera {
    return Intl.message('Camera', name: 'camera', desc: '', args: []);
  }

  /// `Music`
  String get music {
    return Intl.message('Music', name: 'music', desc: '', args: []);
  }

  /// `Add A Photo`
  String get addPhoto {
    return Intl.message('Add A Photo', name: 'addPhoto', desc: '', args: []);
  }

  /// `Add A Video`
  String get addVideo {
    return Intl.message('Add A Video', name: 'addVideo', desc: '', args: []);
  }

  /// `Add A Document`
  String get addDocument {
    return Intl.message(
      'Add A Document',
      name: 'addDocument',
      desc: '',
      args: [],
    );
  }

  /// `Background Color`
  String get backgroundColor {
    return Intl.message(
      'Background Color',
      name: 'backgroundColor',
      desc: '',
      args: [],
    );
  }

  /// `Add Gif`
  String get addGif {
    return Intl.message('Add Gif', name: 'addGif', desc: '', args: []);
  }

  /// `Live Video`
  String get liveVideo {
    return Intl.message('Live Video', name: 'liveVideo', desc: '', args: []);
  }

  /// `Public`
  String get public {
    return Intl.message('Public', name: 'public', desc: '', args: []);
  }

  /// `What's on your mind?`
  String get whatsOnYourMind {
    return Intl.message(
      'What\'s on your mind?',
      name: 'whatsOnYourMind',
      desc: '',
      args: [],
    );
  }

  /// `Create a Post`
  String get createPost {
    return Intl.message(
      'Create a Post',
      name: 'createPost',
      desc: '',
      args: [],
    );
  }

  /// `Post`
  String get post {
    return Intl.message('Post', name: 'post', desc: '', args: []);
  }

  /// `Share your thoughts and experiences with the world.`
  String get shareThoughts {
    return Intl.message(
      'Share your thoughts and experiences with the world.',
      name: 'shareThoughts',
      desc: '',
      args: [],
    );
  }

  /// `Tell your story.`
  String get tellYourStory {
    return Intl.message(
      'Tell your story.',
      name: 'tellYourStory',
      desc: '',
      args: [],
    );
  }

  /// `What are you thinking about today?`
  String get thinkingAboutToday {
    return Intl.message(
      'What are you thinking about today?',
      name: 'thinkingAboutToday',
      desc: '',
      args: [],
    );
  }

  /// `Write something here...`
  String get writeSomething {
    return Intl.message(
      'Write something here...',
      name: 'writeSomething',
      desc: '',
      args: [],
    );
  }

  /// `Document`
  String get document {
    return Intl.message('Document', name: 'document', desc: '', args: []);
  }

  /// `Posts`
  String get posts {
    return Intl.message('Posts', name: 'posts', desc: '', args: []);
  }

  /// `Photos`
  String get photos {
    return Intl.message('Photos', name: 'photos', desc: '', args: []);
  }

  /// `Followers`
  String get followers {
    return Intl.message('Followers', name: 'followers', desc: '', args: []);
  }

  /// `Following`
  String get following {
    return Intl.message('Following', name: 'following', desc: '', args: []);
  }

  /// `Discover People`
  String get discoverPeople {
    return Intl.message(
      'Discover People',
      name: 'discoverPeople',
      desc: '',
      args: [],
    );
  }

  /// `Suggested for you`
  String get suggestedForYou {
    return Intl.message(
      'Suggested for you',
      name: 'suggestedForYou',
      desc: '',
      args: [],
    );
  }

  /// `People you may know`
  String get peopleYouMayKnow {
    return Intl.message(
      'People you may know',
      name: 'peopleYouMayKnow',
      desc: '',
      args: [],
    );
  }

  /// `Follow`
  String get follow {
    return Intl.message('Follow', name: 'follow', desc: '', args: []);
  }

  /// `Unfollow`
  String get unfollow {
    return Intl.message('Unfollow', name: 'unfollow', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Network`
  String get network {
    return Intl.message('Network', name: 'network', desc: '', args: []);
  }

  /// `Photos/Videos`
  String get photosVideos {
    return Intl.message(
      'Photos/Videos',
      name: 'photosVideos',
      desc: '',
      args: [],
    );
  }

  /// `Groups`
  String get groups {
    return Intl.message('Groups', name: 'groups', desc: '', args: []);
  }

  /// `Search Profile`
  String get searchProfile {
    return Intl.message(
      'Search Profile',
      name: 'searchProfile',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Your Privacy`
  String get yourPrivacy {
    return Intl.message(
      'Your Privacy',
      name: 'yourPrivacy',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get aboutUs {
    return Intl.message('About Us', name: 'aboutUs', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppStrings> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppStrings> load(Locale locale) => AppStrings.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
