import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:social_mate_app/core/di/di.dart';
import 'package:social_mate_app/core/routes/app_paths.dart';
import 'package:social_mate_app/core/services/toast_service.dart';
import 'package:social_mate_app/features/auth/bloc/auth_bloc.dart';
import 'package:social_mate_app/features/profile/presentation/bloc/profile_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    final profileBloc = context.read<ProfileBloc>();
    if (profileBloc.state is! ProfileLoaded) {
      profileBloc.add(GetProfileEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: BlocConsumer<ProfileBloc, ProfileState>(
          listenWhen: (previous, current) => current is ProfileError,
          listener: (context, state) {
            if (state is ProfileError) {
              getIt<ToastService>().showErrorToast(
                context: context,
                message: state.message,
              );
            }
          },
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ProfileError) {
              return Center(
                child: Text(
                  state.message,
                  style: TextStyle(color: colorScheme.error),
                ),
              );
            }
            if (state is ProfileLoaded) {
              return SingleChildScrollView(
                clipBehavior: Clip.none,
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30.r),
                            bottomRight: Radius.circular(30.r),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: state.profile.avatarUrl!,
                            height: 0.38.sh,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                        Positioned(
                          bottom: -60.w,
                          left: 0,
                          right: 0,
                          child: InkWell(
                            onLongPress: () {
                              context.read<AuthBloc>().add(SignOutEvent());
                              context.go(AppPaths.auth);
                            },
                            borderRadius: BorderRadius.circular(100),
                            child: CircleAvatar(
                              radius: 65.w,
                              backgroundColor: colorScheme.secondary,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: CachedNetworkImage(
                                  imageUrl: state.profile.avatarUrl!,
                                  height: 120.w,
                                  width: 120.w,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topCenter,
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    70.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        children: [
                          Text(
                            state.profile.name,
                            style: textTheme.headlineMedium,
                          ),
                          6.verticalSpace,
                          if (state.profile.username != null)
                            Text(
                              state.profile.username!,
                              style: textTheme.bodyLarge,
                            ),
                          4.verticalSpace,
                          if (state.profile.bio != null)
                            Text(
                              state.profile.bio!,
                              style: textTheme.bodyLarge,
                            ),
                          16.verticalSpace,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {},
                                    borderRadius: BorderRadius.circular(10.r),
                                    child: Container(
                                      width: double.infinity,
                                      height: 60.h,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: colorScheme.outline,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          10.r,
                                        ),
                                      ),
                                      child: Text(
                                        'Edit Profile'.toUpperCase(),
                                        style: textTheme.titleMedium?.copyWith(
                                          color: colorScheme.onSurfaceVariant,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                16.horizontalSpace,
                                InkWell(
                                  onTap: () {},
                                  borderRadius: BorderRadius.circular(10.r),
                                  child: Container(
                                    width: 60.w,
                                    height: 60.h,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: colorScheme.outline,
                                      ),
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child: Icon(
                                      Icons.settings_outlined,
                                      color: colorScheme.onSurfaceVariant,
                                      size: 30.w,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          24.verticalSpace,
                          Container(
                            width: double.infinity,
                            height: 80.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(color: colorScheme.outline),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Posts',
                                      style: textTheme.titleMedium?.copyWith(
                                        color: colorScheme.onSurfaceVariant,
                                      ),
                                    ),
                                    Text(
                                      state.profile.postsCount.toString(),
                                      style: textTheme.titleMedium?.copyWith(
                                        color: colorScheme.onSurfaceVariant,
                                      ),
                                    ),
                                  ],
                                ),
                                VerticalDivider(
                                  color: colorScheme.outline,
                                  thickness: 1,
                                  indent: 12.h,
                                  endIndent: 12.h,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Photos',
                                      style: textTheme.titleMedium?.copyWith(
                                        color: colorScheme.onSurfaceVariant,
                                      ),
                                    ),
                                    Text(
                                      state.profile.followersCount.toString(),
                                      style: textTheme.titleMedium?.copyWith(
                                        color: colorScheme.onSurfaceVariant,
                                      ),
                                    ),
                                  ],
                                ),
                                VerticalDivider(
                                  color: colorScheme.outline,
                                  thickness: 1,
                                  indent: 12.h,
                                  endIndent: 12.h,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Following',
                                      style: textTheme.titleMedium?.copyWith(
                                        color: colorScheme.onSurfaceVariant,
                                      ),
                                    ),
                                    Text(
                                      state.profile.followersCount.toString(),
                                      style: textTheme.titleMedium?.copyWith(
                                        color: colorScheme.onSurfaceVariant,
                                      ),
                                    ),
                                  ],
                                ),
                                VerticalDivider(
                                  color: colorScheme.outline,
                                  thickness: 1,
                                  indent: 12.h,
                                  endIndent: 12.h,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Following',
                                      style: textTheme.titleMedium?.copyWith(
                                        color: colorScheme.onSurfaceVariant,
                                      ),
                                    ),
                                    Text(
                                      state.profile.followingCount.toString(),
                                      style: textTheme.titleMedium?.copyWith(
                                        color: colorScheme.onSurfaceVariant,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
