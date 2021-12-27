import 'package:app/app/notifiers/audio_notifier.dart';
import 'package:app/audio_screen/widgets/animated_play_pause.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({
    Key? key,
  }) : super(key: key);

  @override
  _AudioScreenState createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      Provider.of<AudioNotifier>(context, listen: false).audioSource =
          AudioSource.uri(
        Uri.parse(
          const String.fromEnvironment('AUDIO_URI'),
        ),
      );
      await Provider.of<AudioNotifier>(context, listen: false).init();
    });
  }

  @override
  void dispose() {
    Provider.of<AudioNotifier>(context, listen: false).player.stop();
    super.dispose();
  }

  Future<void> playPause(AudioNotifier notifier) async {
    if (notifier.player.playing) {
      await notifier.player.pause();
    } else {
      await notifier.player.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AudioNotifier>(
      builder: (ctx, notifer, widget) => Scaffold(
        appBar: AppBar(),
        body: StreamBuilder<bool>(
            stream: notifer.player.playingStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Center(
                  child: FloatingActionButton(
                    onPressed: () => playPause(notifer),
                    child: AnimatedPlayPause(
                      playing: snapshot.data!,
                    ),
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
