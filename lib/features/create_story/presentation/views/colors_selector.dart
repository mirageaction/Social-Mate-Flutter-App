import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_mate_app/features/create_story/presentation/cubit/story_bg_controller_cubit.dart';

class ColorsSelector extends StatefulWidget {
  final int selectedIndex;
  const ColorsSelector({super.key, required this.selectedIndex});

  @override
  State<ColorsSelector> createState() => _ColorsSelectorState();
}

class _ColorsSelectorState extends State<ColorsSelector> {
  int selectedIndex = 0;

  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.cyan,
  ];

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
    context.read<StoryBgControllerCubit>().selectColor(colors[selectedIndex]);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final color = colors[index];
          final isSelected = index == selectedIndex;
          return InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: () => {
              setState(() => selectedIndex = index),
              context.read<StoryBgControllerCubit>().selectColor(color),
            },
            child: _CircleColor(color: color, isSelected: isSelected),
          );
        },
        separatorBuilder: (context, index) => 8.horizontalSpace,
        itemCount: colors.length,
      ),
    );
  }
}

class _CircleColor extends StatelessWidget {
  final Color color;
  final bool isSelected;
  const _CircleColor({required this.color, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35.w,
      height: 35.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(color: isSelected ? Colors.white : color),
      ),
      child: isSelected
          ? Icon(Icons.check, color: Colors.white, size: 18.w)
          : null,
    );
  }
}
