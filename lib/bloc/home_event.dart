import 'package:equatable/equatable.dart';

import '../model/post_model.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class LoadPostEvent extends HomeEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DeletePostEvent extends HomeEvent {
  Post? post;
  DeletePostEvent({this.post});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
