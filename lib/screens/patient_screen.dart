import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../nowTimeBloc/now_time_bloc.dart';
import '../patientBloc/patient_bloc.dart';

class PatientScreen extends StatefulWidget {
  const PatientScreen({super.key});

  @override
  State<PatientScreen> createState() => _PatientScreenState();
}
bool loading = false;

class _PatientScreenState extends State<PatientScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientBloc, PatientState>(
      builder: (context, state) {
        DateTime? nowTime = context.watch<NowTimeBloc>().state.nowTime;
        if (nowTime != null) {
          loading = true;
          return Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(12),
              itemCount: state.patientInfo.length,
              itemBuilder: (context, index) {
                int queue = index + 1;
                return nowTime ==
                        state.patientInfo[index].dateTime
                    ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            '$queue. ${state.patientInfo[index].name.toString()}',
                            style: const TextStyle(fontSize: 20),
                          ),
                        MaterialButton(onPressed: (){
                          state.patientInfo.removeAt(index);
                          setState(() {
                          });
                        }, child: const Icon(Icons.delete, color: Color.fromARGB(255, 205, 90, 82),),)
                      ],
                    )
                    : Container(
                        color: Colors.red,
                      );
              },
            ),
          );
        } else if (state.status == PatientStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        return const SizedBox(
          height: 12,
        );
      },
    );
  }
}
