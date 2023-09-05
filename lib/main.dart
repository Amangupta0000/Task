import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/cubit/auth_cubit.dart';
import 'package:task/cubit/auth_state.dart';
import 'package:task/screens.dart/homescreen.dart';
import 'package:task/screens.dart/profilescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        home: BlocBuilder<AuthCubit, AuthState>(
          // buildWhen: (previous, current) {
          //   return previous is AuthInitialState;
          // },
          builder: (BuildContext context, state) {
            if (state is AuthLoggedInState) {
              return const ProfileScreen();
            } else {
              return const HomeScreen();
            }
          },
        ),
      ),
    );
  }
}
