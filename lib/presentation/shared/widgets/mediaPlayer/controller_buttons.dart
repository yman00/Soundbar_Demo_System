import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:video_player/video_player.dart';

class PlayControls extends StatelessWidget {
  final AudioPlayer? audioPlayer;
  final VideoPlayerController? videoController;

  const PlayControls({
    super.key,
    this.audioPlayer,
    this.videoController,
  });

  bool get isAudio => audioPlayer != null;

  @override
  Widget build(BuildContext context) {
    if (isAudio) {
      return StreamBuilder<bool>(
        stream: audioPlayer!.playingStream,
        builder: (context, snapshot) {
          final isPlaying = snapshot.data ?? false;

          return _buildControlRow(isPlaying, () {
            isPlaying ? audioPlayer!.pause() : audioPlayer!.play();
          });
        },
      );
    } else if (videoController != null) {
      final isPlaying = videoController!.value.isPlaying;

      return _buildControlRow(isPlaying, () {
        isPlaying ? videoController!.pause() : videoController!.play();
      });
    } else {
      return const SizedBox(); // Nothing to render
    }
  }

  Widget _buildControlRow(bool isPlaying, VoidCallback onTogglePlayPause) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // ⏮️ Skip Previous
        IconButton(
          iconSize: 40,
          icon: const Icon(Icons.skip_previous),
          color: Color(0xFF030211),
          onPressed: isAudio ? audioPlayer!.hasPrevious ? audioPlayer!.seekToPrevious : null : null,
        ),

        // ⏪ Rewind 10s
        IconButton(
          iconSize: 36,
          icon: const Icon(Icons.replay_10),
          color: Color(0xFF030211),
          onPressed: () async {
            final position = isAudio
                ? audioPlayer!.position
                : videoController!.value.position;

            final target = position - const Duration(seconds: 10);
            final safeTarget = target > Duration.zero ? target : Duration.zero;

            if (isAudio) {
              await audioPlayer!.seek(safeTarget);
            } else {
              videoController!.seekTo(safeTarget);
            }
          },
        ),

        // ▶️ / ⏸️ Play/Pause
        IconButton(
          iconSize: 64,
          icon: Icon(isPlaying ? Icons.pause_circle : Icons.play_circle),
          color: Color(0xFF030211),
          onPressed: onTogglePlayPause,
        ),

        // ⏩ Forward 10s
        IconButton(
          iconSize: 36,
          icon: const Icon(Icons.forward_10),
          color: Color(0xFF030211),
          onPressed: () async {
            final duration = isAudio
                ? audioPlayer!.duration ?? Duration.zero
                : videoController!.value.duration;

            final position = isAudio
                ? audioPlayer!.position
                : videoController!.value.position;

            final target = position + const Duration(seconds: 10);
            final safeTarget = target < duration ? target : duration;

            if (isAudio) {
              await audioPlayer!.seek(safeTarget);
            } else {
              videoController!.seekTo(safeTarget);
            }
          },
        ),

        // ⏭️ Skip Next
        IconButton(
          iconSize: 40,
          icon: const Icon(Icons.skip_next),
          color: Color(0xFF030211),
          onPressed: isAudio ? audioPlayer!.hasNext ? audioPlayer!.seekToNext : null : null,
        ),
      ],
    );
  }
}
