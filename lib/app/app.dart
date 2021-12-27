import 'package:app/app/notifiers/audio_notifier.dart';
import 'package:app/audio_screen/audio_screen.dart';
import 'package:app/dashboard/dashboard_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AudioProviderTestApp extends StatefulWidget {
  const AudioProviderTestApp({Key? key}) : super(key: key);

  @override
  _AudioProviderTestAppState createState() => _AudioProviderTestAppState();
}

class _AudioProviderTestAppState extends State<AudioProviderTestApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: AudioNotifier(),
      child: const MaterialApp(
        home: DashboardScreen(),
      ),
    );
  }
}
