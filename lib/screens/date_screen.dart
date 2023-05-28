import 'package:flutter/material.dart';

class DateScreen extends StatefulWidget {
  DateTime? dataTime = DateTime.now();

  DateScreen({super.key, this.dataTime});

  @override
  State<DateScreen> createState() => _DateScreenState();
}

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
    print(_month);
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
            ? Text('Seçdiyin gün: $_month ${widget.dataTime?.day.toString()}')
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
        widget.dataTime = value!;
        months.asMap().forEach((index, month) {
          if (index == widget.dataTime!.month.toInt() - 1) {
            print(month);
            _month = month;
          }
          ;
        });
      });
    });
  }
}
