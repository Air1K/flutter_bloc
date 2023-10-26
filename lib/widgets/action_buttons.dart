import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_bloc/bloc/user_bloc.dart';
import 'package:task_bloc/bloc/user_event.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final UserBloc _userBloc = BlocProvider.of<UserBloc>(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
            onPressed: () {
              _userBloc.add(UserLoadEvent());
            },
            style: ElevatedButton.styleFrom(primary: Colors.green),
            child: const Text(
              "Load",
              style: TextStyle(color: Colors.white),
            )),
        const SizedBox(
          width: 20,
        ),
        ElevatedButton(
            onPressed: () {
              _userBloc.add(UserClearEvent());
            },
            style: ElevatedButton.styleFrom(primary: Colors.red),
            child: const Text(
              "Clear",
              style: TextStyle(color: Colors.white),
            )),
      ],
    );
  }
}
