import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlayControls extends StatelessWidget {
  final AudioPlayer audioPlayer;

  const PlayControls({
    super.key,
    required this.audioPlayer,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: audioPlayer.playingStream,
      builder: (context, snapshot) {
        final isPlaying = snapshot.data ?? false;

        return _buildControlRow(isPlaying, () {
          isPlaying ? audioPlayer.pause() : audioPlayer.play();
        });
      },
    );
  }

  Widget _buildControlRow(bool isPlaying, VoidCallback onTogglePlayPause) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // ⏮️ Skip Previous
        IconButton(
          iconSize: 40,
          icon: const Icon(Icons.skip_previous),
          color: const Color(0xFF030211),
          onPressed: audioPlayer.hasPrevious ? audioPlayer.seekToPrevious : null,
        ),

        // ⏪ Rewind 10s
        IconButton(
          iconSize: 36,
          icon: const Icon(Icons.replay_10),
          color: const Color(0xFF030211),
          onPressed: () async {
            final position = audioPlayer.position;
            final target = position - const Duration(seconds: 10);
            final safeTarget = target > Duration.zero ? target : Duration.zero;
            await audioPlayer.seek(safeTarget);
          },
        ),

        // ▶️ / ⏸️ Play/Pause
        IconButton(
          iconSize: 64,
          icon: Icon(isPlaying ? Icons.pause_circle : Icons.play_circle),
          color: const Color(0xFF030211),
          onPressed: onTogglePlayPause,
        ),

        // ⏩ Forward 10s
        IconButton(
          iconSize: 36,
          icon: const Icon(Icons.forward_10),
          color: const Color(0xFF030211),
          onPressed: () async {
            final duration = audioPlayer.duration ?? Duration.zero;
            final position = audioPlayer.position;
            final target = position + const Duration(seconds: 10);
            final safeTarget = target < duration ? target : duration;
            await audioPlayer.seek(safeTarget);
          },
        ),

        // ⏭️ Skip Next
        IconButton(
          iconSize: 40,
          icon: const Icon(Icons.skip_next),
          color: const Color(0xFF030211),
          onPressed: audioPlayer.hasNext ? audioPlayer.seekToNext : null,
        ),
      ],
    );
  }
}
