import 'package:flutter/material.dart';
import 'package:kt_app/patientBloc/patient_bloc.dart';
import 'package:kt_app/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'nowTimeBloc/now_time_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
Widget build(BuildContext context) {
  return MultiBlocProvider(
    providers: [
      BlocProvider<PatientBloc>(create: (context) => PatientBloc()),
      BlocProvider<NowTimeBloc>(create: (context) => NowTimeBloc()),
    ],
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
