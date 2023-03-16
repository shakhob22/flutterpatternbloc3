
import 'package:equatable/equatable.dart';

import '../model/post_model.dart';

abstract class HomeState extends Equatable {}

class HomeInitialState extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeErrorState extends HomeState {
  String? errorMessage = "";
  HomeErrorState({this.errorMessage});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomePostListState extends HomeState {
  List<Post>? posts = [];
  HomePostListState({this.posts});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeDeletePostState extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}







