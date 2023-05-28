import 'package:flutter/material.dart';
import 'package:kt_app/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/patient_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PatientBloc>(
      create: (context) => PatientBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
