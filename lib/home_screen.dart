import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
DateTime _dataTime = DateTime.now();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 103, 101, 101),
      title: const Text('KT Qeydiyyat'),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(onPressed: _showDatePicker, child: const Padding(padding: EdgeInsets.all(8), child: Text('Günü seçin'),),),
                            Text('Bu günkü gün: ${_dataTime.day.toString()}')

              ],
            ),
            ],
        ),
      ),
    );
  }
  void _showDatePicker() {
    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2023), lastDate: DateTime(2024)).then((value) {setState(() {
      _dataTime = value!;
    });});
  }
}