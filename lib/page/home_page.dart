import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_bloc/bloc/user_bloc.dart';
import 'package:task_bloc/services/user_repository.dart';
import 'package:task_bloc/widgets/action_buttons.dart';

import '../widgets/user_list.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        userRepository: userRepository,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("User List"),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: const Flex(
            direction: Axis.horizontal,
            children: [Expanded(child: UserList())]),
        bottomNavigationBar: const _DemoBottomAppBar(
          shape: CircularNotchedRectangle(),
        ),
      ),
    );
  }
}

class _DemoBottomAppBar extends StatelessWidget {
  const _DemoBottomAppBar({
    this.fabLocation = FloatingActionButtonLocation.endDocked,
    this.shape = const CircularNotchedRectangle(),
  });

  final FloatingActionButtonLocation fabLocation;
  final NotchedShape? shape;
  static final List<FloatingActionButtonLocation> centerLocations =
      <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: shape,
      color: Colors.grey,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Center(
          child: ActionButtons(),
        ),
      ),
    );
  }
}
