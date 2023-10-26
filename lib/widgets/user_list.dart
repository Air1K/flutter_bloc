import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_bloc/bloc/user_bloc.dart';

import '../bloc/user_state.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
        listener: ((context, state) {
      log(state.toString());
      if (state is UserLoadedState) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: const Text("Users is loaded")));
      }
    }),
        builder: (context, state) {
      if (state is UserEmptyState) {
        return const Text(
          'No data received. Please button "Load"',
          style: TextStyle(fontSize: 20),
        );
      }
      if (state is UserLoadingState) {
        return const Center(child: CircularProgressIndicator());
      }

      if (state is UserLoadedState) {
        return ListView.builder(
          itemCount: state.loadedUser.length,
          itemBuilder: (context, index) => Container(
            color: index % 2 == 0 ? Colors.white : Colors.blueGrey[50],
            child: ListTile(
              leading: Text(
                'ID: ${state.loadedUser[index].id}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              title: Column(
                children: [
                  Text(
                    "My name: ${state.loadedUser[index].name}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: [
                      Text(
                        "Email: ${state.loadedUser[index].email}",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                      Text(
                        "Phone: ${state.loadedUser[index].phone}",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }

      if (state is UserErrorState) {
        return Text(
          "Error fetching users",
          style: TextStyle(fontSize: 20.0),
        );
      }
      return SizedBox.shrink();
    });
  }
}
