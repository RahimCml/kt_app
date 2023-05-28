import 'package:flutter/material.dart';

class FloatingActionBottomWidget extends StatefulWidget {
  const FloatingActionBottomWidget({Key? key}) : super(key: key);

  @override
  _FloatingActionBottomWidgetState createState() => _FloatingActionBottomWidgetState();
}

class _FloatingActionBottomWidgetState extends State<FloatingActionBottomWidget> {
  late final TextEditingController titleController;
  late final TextEditingController subtitleController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    subtitleController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    subtitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        triggerBottomSheet();
      },
    );
  }

  void triggerBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (context) {
        return ListView(
          shrinkWrap: true,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            const SizedBox(height: 16,),
            TextField(
              controller: subtitleController,
              decoration: const InputDecoration(
                labelText: 'Subtitle',
              ),
            ),
            Padding(padding: const EdgeInsets.only(right: 120, left: 120),
            child: ElevatedButton(onPressed: (){}, child: const Text('Elavə et')))
          ],
        );
      },
    );
  }
}
