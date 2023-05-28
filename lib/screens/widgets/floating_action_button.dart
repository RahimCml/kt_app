import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_app/bloc/patient_bloc.dart';
import 'package:kt_app/models/patient_model.dart';

class FloatingActionBottomWidget extends StatefulWidget {
  const FloatingActionBottomWidget({Key? key}) : super(key: key);

  @override
  _FloatingActionBottomWidgetState createState() =>
      _FloatingActionBottomWidgetState();
}

class _FloatingActionBottomWidgetState
    extends State<FloatingActionBottomWidget> {
  late final TextEditingController titleController;
  late final TextEditingController subtitleController;
  late final TextEditingController numberController;
  DateTime nowTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    subtitleController = TextEditingController();
    numberController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    subtitleController.dispose();
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        triggerBottomSheet();
      },
      child: const Icon(Icons.add_rounded),
    );
  }

  void triggerBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (context) {
        return ListView(
          shrinkWrap: true,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Ad',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: subtitleController,
              decoration: const InputDecoration(
                labelText: 'Soyad',
              ),
            ),
            TextField(
              controller: numberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Nömrə',
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(right: 120, left: 120),
                child: ElevatedButton(
                    onPressed: () {
                      final int number =
                          int.tryParse(numberController.text) ?? 0;
                      final patientModel = PatientModel(
                        name: titleController.text,
                        surName: subtitleController.text,
                        number: number, // Pass the converted number as int
                        dateTime: nowTime,
                      );
                      context
                          .read<PatientBloc>()
                          .add(PatientAddEvent(patientModel: patientModel));
                      titleController.clear();
                      subtitleController.clear();
                      numberController.clear();
                      Navigator.pop(context);
                    },
                    child: const Text('Elavə et')))
          ],
        );
      },
    );
  }
}
