import 'package:flutter/material.dart';
import 'package:kt_app/screens/date_screen.dart';
import 'package:kt_app/screens/widgets/floating_action_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 103, 101, 101),
        title: const Text('KT Qeydiyyat'),
      ),
      floatingActionButton: const FloatingActionBottomWidget(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DateScreen(),
          ],
        ),
      ),
    );
  }
}
