import 'package:app/audio_screen/audio_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            ),
          ),
          child: const Text('Start Audio Session'),
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AudioScreen(),
            ),
          ),
        ),
      ),
    );
  }
}
