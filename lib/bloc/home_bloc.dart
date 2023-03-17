import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterpatternbloc3/bloc/home_state.dart';
import 'package:flutterpatternbloc3/pages/home_page.dart';
import 'package:flutterpatternbloc3/services/http_service.dart';

import '../pages/create_page.dart';
import 'create_bloc.dart';
import 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<LoadPostEvent>(_onLoadPosts);
    on<DeletePostEvent>(_onDeletePost);
  }

  Future<void> _onLoadPosts(
      LoadPostEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    final response = await Network.GET(Network.API_LIST, {});
    if (response != null) {
      final posts = Network.parsePostList(response);
      emit(HomePostListState(posts: posts));
    } else {
      emit(HomeErrorState(errorMessage: "Couldn't fetch posts"));
    }
  }

  Future<void> _onDeletePost(
      DeletePostEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    final response =
        await Network.DEL(Network.API_DELETE + event.post!.id.toString(), {});
    if (response != null) {
      emit(HomeDeletePostState());
    } else {
      emit(HomeErrorState(errorMessage: "Couldn't delete post"));
    }
  }

  void callCreatePage(BuildContext context) async {
    var result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => CreateBloc(),
            child: const CreatePage(),
          ),
        ));
    if (result != null) {
      add(LoadPostEvent());
    }
  }

  void callUpdatePage(BuildContext context) async {
    var result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => HomeBloc(),
            child: const HomePage(),
          ),
        ));
    if (result != null) {
      add(LoadPostEvent());
    }
  }
}
