import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_mate_app/core/utils/time_ago_helper.dart';
import 'package:social_mate_app/features/inbox/domain/entities/chat_room.dart';
import 'package:social_mate_app/features/inbox/presentation/bloc/inbox_bloc.dart';
import 'package:social_mate_app/global/widgets/status_avatar.dart';
import 'package:social_mate_app/core/l10n/generated/l10n.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({super.key});

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text('Inbox'),
        backgroundColor: colorScheme.surface,
        elevation: 0,
        bottom: const InboxSearchBar(),
      ),
      body: BlocBuilder<InboxBloc, InboxState>(
        builder: (context, state) {
          if (state is InboxLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is InboxError) {
            return Center(child: Text(state.message));
          } else if (state is InboxLoaded) {
            final chatRooms = state.chatRooms;
            if (chatRooms.isEmpty) {
              return const Center(child: Text('No messages yet'));
            }
            return ListView.separated(
              itemCount: chatRooms.length,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              itemBuilder: (context, index) {
                return InboxItem(chatRoom: chatRooms[index]);
              },
              separatorBuilder: (context, index) {
                return 12.verticalSpace;
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class InboxItem extends StatelessWidget {
  final ChatRoom chatRoom;

  const InboxItem({super.key, required this.chatRoom});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Dismissible(
      key: Key(chatRoom.id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        context.read<InboxBloc>().add(DeleteChatRoomRequested(chatRoom.id));
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          color: colorScheme.primaryContainer.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Icon(Icons.delete_outline, color: colorScheme.primary),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          border: Border.all(color: colorScheme.outline.withValues(alpha: 0.2)),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          leading: StatusAvatar(
            imageUrl: chatRoom.otherParticipant.avatarUrl,
            isOnline: chatRoom.isOnline,
            size: 56,
          ),
          title: Text(
            chatRoom.otherParticipant.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.titleMedium?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            chatRoom.lastMessage,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
            ),
          ),
          trailing: Text(
            TimeAgoHelper.formatInbox(chatRoom.lastMessageTime),
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
            ),
          ),
        ),
      ),
    );
  }
}

class InboxSearchBar extends StatelessWidget implements PreferredSizeWidget {
  const InboxSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: 12.h,
            horizontal: 16.w,
          ),
          hintText: 'Search...',
          hintStyle: textTheme.bodyLarge?.copyWith(
            color: colorScheme.primary.withValues(alpha: 0.5),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: colorScheme.primary,
            size: 22.w,
          ),
          filled: true,
          fillColor: colorScheme.primary.withValues(alpha: 0.05),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(
              color: colorScheme.primary.withValues(alpha: 0.3),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(
              color: colorScheme.primary.withValues(alpha: 0.2),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: colorScheme.primary),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70.h);
}
