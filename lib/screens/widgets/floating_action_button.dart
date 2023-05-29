import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../nowTimeBloc/now_time_bloc.dart';
import '../../patientBloc/patient_bloc.dart';

class FloatingActionBottomWidget extends StatefulWidget {
  FloatingActionBottomWidget({super.key});

  @override
  _FloatingActionBottomWidgetState createState() =>
      _FloatingActionBottomWidgetState();
}

class _FloatingActionBottomWidgetState
    extends State<FloatingActionBottomWidget> {
  late final TextEditingController titleController;
  late final TextEditingController subtitleController;
  late final TextEditingController numberController;
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
NowTimeBloc nowTimeBloc = BlocProvider.of<NowTimeBloc>(context);
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
                      context.read<PatientBloc>().add(PatientAddEvent(
                          dateTime: nowTimeBloc.state.nowTime,
                          name: titleController.text,
                          number: number,
                          surName: subtitleController.text));
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
