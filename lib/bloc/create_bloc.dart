
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterpatternbloc3/bloc/create_event.dart';
import 'package:flutterpatternbloc3/bloc/create_state.dart';
import 'package:flutterpatternbloc3/model/post_model.dart';
import 'package:flutterpatternbloc3/services/http_service.dart';

class CreateBloc extends Bloc<CreateEvent, CreateState> {
  CreateBloc() : super(CreateInitialState()) {
    on<CreatePostEvent>(_onCreatePost);
  }

  Future<void> _onCreatePost(CreatePostEvent event, Emitter<CreateState> emit) async {
    emit(CreateLoadingState());
    final response = await Network.POST(Network.API_CREATE, Network.paramsCreate(event.post!));
    if (response != null) {
      Post post = Network.parsePost(response);
      emit(CreatedPostState(post: post));
    } else {
      emit(CreateErrorState(errorMessage: "E R R O R"));
    }
  }
}
