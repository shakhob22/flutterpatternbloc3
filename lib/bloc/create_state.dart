
import 'package:equatable/equatable.dart';
import 'package:flutterpatternbloc3/model/post_model.dart';

abstract class CreateState extends Equatable {}

class CreateInitialState extends CreateState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CreateLoadingState extends CreateState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CreateErrorState extends CreateState {
  String? errorMessage;

  CreateErrorState({this.errorMessage});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class CreatedPostState extends CreateState {
  Post? post;

  CreatedPostState({this.post});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}