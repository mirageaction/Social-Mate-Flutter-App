import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_mate_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:social_mate_app/features/profile/presentation/pages/profile_page.dart';
import 'package:social_mate_app/global/widgets/follow_button.dart';

class ProfileFollowButton extends StatelessWidget {
  const ProfileFollowButton({super.key, required this.widget});

  final ProfilePage widget;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ProfileBloc, ProfileState, bool>(
      selector: (state) {
        if (state is ProfileLoaded) {
          return state.profile.isFollowing;
        }
        return false;
      },
      builder: (context, isFollowing) {
        return FollowButton(
          userId: widget.userId!,
          isFollowing: isFollowing,
          width: 100.w,
          onFollow: () {
            context.read<ProfileBloc>().add(FollowUserEvent(widget.userId!));
          },
          onUnfollow: () {
            context.read<ProfileBloc>().add(UnfollowUserEvent(widget.userId!));
          },
        );
      },
    );
  }
}
