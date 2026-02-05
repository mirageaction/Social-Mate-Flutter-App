import 'package:flutter/material.dart';
import 'package:social_mate_app/features/home/domain/entities/story_entity.dart';
import 'package:story_view/story_view.dart';

class StoryViewerPage extends StatefulWidget {
  final List<StoryEntity> stories;

  const StoryViewerPage({super.key, required this.stories});

  @override
  State<StoryViewerPage> createState() => _StoryViewerPageState();
}

class _StoryViewerPageState extends State<StoryViewerPage> {
  final StoryController controller = StoryController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List<StoryItem> _buildStoryItems(List<StoryEntity> stories) {
    return stories.map((story) {
      if (story.type == 'text') {
        return StoryItem.text(
          title: story.content,
          backgroundColor: Color(int.parse(story.bgColor)),
          textStyle: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        );
      } else {
        return StoryItem.pageImage(
          url: story.mediaUrl,
          controller: controller,
          caption: story.content.isNotEmpty
              ? Text(story.content, style: const TextStyle(color: Colors.white))
              : null,
        );
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoryView(
        storyItems: _buildStoryItems(widget.stories),
        controller: controller,
        onComplete: () => Navigator.of(context).pop(),
        onVerticalSwipeComplete: (direction) {
          if (direction == Direction.down) {
            Navigator.of(context).pop();
          }
        },
      ),
    );
  }
}
