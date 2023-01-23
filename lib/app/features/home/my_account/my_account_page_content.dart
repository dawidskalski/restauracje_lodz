import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restauracje_lodz/app/cubit/root_cubit.dart';

class MyAccountPageContent extends StatelessWidget {
  const MyAccountPageContent({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Jesteś zalogowany jako $email'),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              context.read<RootCubit>().signOut();
            },
            child: Text('Wyloguj'),
          )
        ],
      ),
    );
  }
}
