import 'package:flutter/material.dart';

class DateScreen extends StatefulWidget {
  DateTime? dataTime = DateTime.now();

  DateScreen({super.key, this.dataTime});

  @override
  State<DateScreen> createState() => _DateScreenState();
}

class _DateScreenState extends State<DateScreen> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MaterialButton(
          onPressed: _showDatePicker,
          child: const Padding(
            padding: EdgeInsets.all(8),
            child: Text('Günü seçin'),
          ),
        ),
        Text('Bu günkü gün: ${widget.dataTime?.day.toString()}')
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
      });
    });
  }
}
