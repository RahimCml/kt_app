import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_app/bloc/patient_bloc.dart';

class PatientScreen extends StatefulWidget {
  const PatientScreen({super.key});

  @override
  State<PatientScreen> createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<PatientBloc, PatientState>(builder: (context, state) {
          if(state is PatientAddSuccess) {
            return Text(state.patientInfo.name.toString(), style: const TextStyle(fontSize: 20));
          }
          return  const SizedBox(height: 20,);
        })
      ],
    );
  }
}