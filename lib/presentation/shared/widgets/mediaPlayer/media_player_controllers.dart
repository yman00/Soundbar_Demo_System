import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:soudbar_kiosk_app/data/sample_media_content.dart';
import 'package:soudbar_kiosk_app/presentation/shared/widgets/mediaPlayer/controller_buttons.dart';
import 'package:soudbar_kiosk_app/presentation/shared/widgets/mediaPlayer/controller_seekbar.dart';
import 'package:soudbar_kiosk_app/presentation/shared/widgets/mediaPlayer/controller_volume.dart';

class MediaPlayerSection extends StatefulWidget {
  final Media media;

  const MediaPlayerSection({super.key, required this.media});

  @override
  State<MediaPlayerSection> createState() => _MediaPlayerSectionState();
}

class _MediaPlayerSectionState extends State<MediaPlayerSection> {
  late AudioPlayer _audioPlayer;

  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;

  double volumeValue = 50.0; // default to 50 (0–100)

  @override
  void initState() {
    super.initState();
    _initAudioPlayer();
  }

  @override
  void didUpdateWidget(MediaPlayerSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.media.url != widget.media.url) {
      _disposeAudioPlayer();
      _initAudioPlayer();
    }
  }

  void _initAudioPlayer() {
    _audioPlayer = AudioPlayer();
    _audioPlayer.setUrl(widget.media.url).then((_) {
      _audioPlayer.play();
    });

    _audioPlayer.positionStream.listen((pos) {
      if (mounted) {
        setState(() => _position = pos);
      }
    });

    _audioPlayer.durationStream.listen((dur) {
      if (mounted) {
        setState(() => _duration = dur ?? Duration.zero);
      }
    });
  }

  void _disposeAudioPlayer() {
    _audioPlayer.stop();
    _audioPlayer.dispose();
  }

  @override
  void dispose() {
    _disposeAudioPlayer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Static music note UI
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 226, 226, 226),
                  borderRadius: BorderRadius.circular(5)
                ),
                padding: EdgeInsets.all(25.0),
                child: Icon(Icons.music_note_rounded),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.media.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'mediaDesc',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Seek bar
        SeekBar(
          currentPosition: _position,
          totalDuration: _duration,
          onChanged: (newPos) {
            _audioPlayer.seek(newPos);
          },
        ),

        // Play/pause/skip controls
        PlayControls(audioPlayer: _audioPlayer),

        // Volume slider
        VolumeSlider(
          value: volumeValue,
          max: 100,
          onChanged: (value) {
            setState(() {
              volumeValue = value;
            });
            _audioPlayer.setVolume(value / 100);
          },
          onChangeEnd: (value) {
            _audioPlayer.setVolume(value / 100);
          },
        ),
      ],
    );
  }
}
