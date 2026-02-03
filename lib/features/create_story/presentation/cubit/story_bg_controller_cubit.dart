import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'story_bg_controller_state.dart';

@injectable
class StoryBgControllerCubit extends Cubit<Color> {
  StoryBgControllerCubit() : super(Colors.transparent);

  void selectColor(Color color) => emit(color);
}
