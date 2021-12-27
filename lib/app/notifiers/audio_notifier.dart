import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:just_audio/just_audio.dart';

class AudioNotifier extends ChangeNotifier {
  AudioPlayer _player = AudioPlayer();

  AudioSource? _audioSource;

  AudioSource? get audioSource => _audioSource;

  set audioSource(AudioSource? value) {
    _audioSource = value;
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  AudioPlayer get player => _player;

  set player(AudioPlayer value) {
    _player = value;
    notifyListeners();
  }

  Future<void> init() async {
    await _player.stop();
    await _player.setAudioSource(_audioSource!);

    if (!kIsWeb) await player.setVolume(2.0);
    notifyListeners();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}
