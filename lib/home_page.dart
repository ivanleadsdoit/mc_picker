import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mc_picker/widgets/mc_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MC Picker'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showMCPicker,
        child: const Icon(CupertinoIcons.arrow_down_to_line),
      ),
    );
  }

  void _showMCPicker() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(6),
          topRight: Radius.circular(6),
        ),
      ),
      constraints: const BoxConstraints(maxHeight: 256, minHeight: 256),
      backgroundColor: const Color(0xFF232D53),
      builder: (_) => MCPicker(onDateChanged: _onDateChanged),
    );
  }

  void _onDateChanged(DateTime value) {
    debugPrint(value.toIso8601String());
  }
}
