
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterpatternbloc3/bloc/create_bloc.dart';
import 'package:flutterpatternbloc3/bloc/create_state.dart';

import '../bloc/create_event.dart';
import '../model/post_model.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  late CreateBloc createBloc;
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  void _finish() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Navigator.pop(context);
    });
  }

  @override
  void initState() {
    createBloc = BlocProvider.of<CreateBloc>(context);
    createBloc.stream.listen((state) {
      if (state is CreatedPostState) {
        _finish();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc"),
      ),
      body: BlocBuilder<CreateBloc, CreateState> (
        builder: (context, state) {
          if (state is CreateLoadingState) {
            return viewOfCreate(true, context);
          }
          return viewOfCreate(false, context);
        },
      ),
    );
  }

  Widget viewOfCreate(bool isLoading, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Stack(
        children: [
          Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                    hintText: "Title",
                    hintStyle: TextStyle(color: Colors.grey)),
              ),
              TextField(
                controller: bodyController,
                decoration: const InputDecoration(
                    hintText: "Body", hintStyle: TextStyle(color: Colors.grey)),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {
                  Post post = Post(
                      title: titleController.text.toString(),
                      body: bodyController.text.toString(),
                      userId: 1);
                  createBloc.add(CreatePostEvent(post: post));
                },
                color: Colors.blue,
                child: const Text(
                  "Create a Post",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          isLoading
              ? const Center(
            child: CircularProgressIndicator(),
          )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

}

