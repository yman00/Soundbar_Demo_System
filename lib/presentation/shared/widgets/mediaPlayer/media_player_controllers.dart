import 'package:flutter/material.dart';
import 'package:soudbar_kiosk_app/data/sample_media_content.dart';
import 'package:soudbar_kiosk_app/presentation/shared/widgets/mediaPlayer/controller_buttons.dart';
import 'package:soudbar_kiosk_app/presentation/shared/widgets/mediaPlayer/controller_seekbar.dart';
import 'package:soudbar_kiosk_app/presentation/shared/widgets/mediaPlayer/controller_volume.dart';
import 'package:video_player/video_player.dart';
import 'package:just_audio/just_audio.dart';

class MediaPlayerSection extends StatefulWidget {
  final Media media;

  const MediaPlayerSection({super.key, required this.media});

  @override
  State<MediaPlayerSection> createState() => _MediaPlayerSectionState();
}

class _MediaPlayerSectionState extends State<MediaPlayerSection> {
  VideoPlayerController? _videoController;
  AudioPlayer? _audioPlayer;

  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;

  double volumeValue = 50.0; // default to 50 (can range 0–100)

  @override
  void initState() {
    super.initState();
    _initPlayer();
  }

  @override
  void didUpdateWidget(MediaPlayerSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.media.url != widget.media.url) {
      _disposePlayer();
      _initPlayer();
    }
  }

  void _initPlayer() {
    if (widget.media.mediaIcon == MediaType.movie) {
      _videoController = VideoPlayerController.network(widget.media.url)
        ..initialize().then((_) {
          setState(() {
            _duration = _videoController!.value.duration;
          });
          _videoController?.play();

          // ✅ Add this listener for updating _position
          _videoController!.addListener(() {
            if (mounted && _videoController!.value.isInitialized) {
              setState(() {
                _position = _videoController!.value.position;
              });
            }
          });
        });
    } else {
      _audioPlayer = AudioPlayer();
      _audioPlayer!.setUrl(widget.media.url).then((_) {
        _audioPlayer!.play();
      });

      _audioPlayer!.positionStream.listen((pos) {
        if (mounted) {
          setState(() => _position = pos);
        }
      });

      _audioPlayer!.durationStream.listen((dur) {
        if (mounted) {
          setState(() => _duration = dur ?? Duration.zero);
        }
      });
    }
  }

  void _disposePlayer() {
    _videoController?.pause();
    _videoController?.dispose();
    _videoController = null;

    _audioPlayer?.stop();
    _audioPlayer?.dispose();
    _audioPlayer = null;
  }

  @override
  void dispose() {
    _disposePlayer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: widget.media.mediaIcon == MediaType.movie
            ? (_videoController != null && _videoController!.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _videoController!.value.aspectRatio,
                  child: VideoPlayer(_videoController!),
                )
              : const Center(child: CircularProgressIndicator()))
            : Container(
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const Center(
                child: 
                Icon(
                  Icons.music_note_rounded,
                  size: 100,
                ),
              ),
            ),
        ),
        const SizedBox(height: 10),
        Text(
          widget.media.title, 
          style: Theme.of(context).textTheme.titleMedium
        ),
        SeekBar(
          currentPosition: _position,
          totalDuration: _duration,
          onChanged: (newPos) {
            if (_audioPlayer != null) {
              _audioPlayer!.seek(newPos);
            } else {
              _videoController?.seekTo(newPos);
            }
          },
        ),
        if (_audioPlayer != null)
          PlayControls(audioPlayer: _audioPlayer!)
        else if (_videoController != null)
          PlayControls(videoController: _videoController!),
        VolumeSlider(
          value: volumeValue,
          max: 100,
          onChanged: (value) {
            setState(() {
              volumeValue = value;
            });

            final normalizedVolume = value / 100;

            if (_audioPlayer != null) {
              _audioPlayer!.setVolume(normalizedVolume);
            } else if (_videoController != null) {
              _videoController!.setVolume(normalizedVolume);
            }
          },
          onChangeEnd: (value) {
            final normalizedVolume = value / 100;
            print('Final volume set to: $normalizedVolume');

            if (_audioPlayer != null) {
              _audioPlayer!.setVolume(normalizedVolume);
            } else if (_videoController != null) {
              _videoController!.setVolume(normalizedVolume);
            }
          },
        )
      ],
    );
  }
}

