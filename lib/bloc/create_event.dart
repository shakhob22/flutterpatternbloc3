

import 'package:equatable/equatable.dart';

import '../model/post_model.dart';

abstract class CreateEvent extends Equatable {
  const CreateEvent();
}

class CreatePostEvent extends CreateEvent {
  Post? post;
  CreatePostEvent({this.post});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
