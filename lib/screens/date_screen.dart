import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../nowTimeBloc/now_time_bloc.dart';


class DateScreen extends StatefulWidget {
  const DateScreen({super.key});

  @override
  State<DateScreen> createState() => _DateScreenState();
}
  DateTime dataTime = DateTime.now();

List<String> months = [
  'yanvar',
  'fevral',
  'mart',
  'aprel',
  'may',
  'iyun',
  'iyul',
  'avqust',
  'sentyabr',
  'oktyabr',
  'noyabr',
  'dekabr'
];
String? _month;

class _DateScreenState extends State<DateScreen> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MaterialButton(
          onPressed: _showDatePicker,
          child: const Padding(
            padding: EdgeInsets.all(8),
            child: Text('Günü seçin'),
          ),
        ),
        _month != null
            ? Text('Seçdiyin gün: $_month ${dataTime.day.toString()}')
            : const Text('')
      ],
    );
  }

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2023),
            lastDate: DateTime(2024))
        .then((value) {
      setState(() {
        dataTime = value!;
        context.read<NowTimeBloc>().add(UpdateNowTimeEvent(dataTime));
        months.asMap().forEach((index, month) {
          if (index == dataTime.month.toInt() - 1) {
            print(month);
            _month = month;
          }
          ;
        });
      });
    });
  }
}
