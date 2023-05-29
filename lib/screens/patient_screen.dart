import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../patientBloc/patient_bloc.dart';

class PatientScreen extends StatefulWidget {
  const PatientScreen({super.key});

  @override
  State<PatientScreen> createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientBloc, PatientState>(
      builder: (context, state) {
        if (state.status == PatientStatus.loaded) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.patientInfo.length,
              itemBuilder: (context, index) {
                return  Text(
                  state.patientInfo[index].dateTime.toString(),
                  style: const TextStyle(fontSize: 20),
                );
              },
            ),
          );
        }else if(state.status == PatientStatus.loading){
        return const Center(child:CircularProgressIndicator());
        }
        return const SizedBox(height: 12,);
      },
    );
  }
}
