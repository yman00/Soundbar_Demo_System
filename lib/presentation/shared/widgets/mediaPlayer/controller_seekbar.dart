import 'package:flutter/material.dart';

class SeekBar extends StatelessWidget {
  final Duration currentPosition;
  final Duration totalDuration;
  final ValueChanged<Duration>? onChanged;
  final ValueChanged<Duration>? onChangeEnd;

  const SeekBar({
    super.key,
    required this.currentPosition,
    required this.totalDuration,
    this.onChanged,
    this.onChangeEnd,
  });

  String _formatDuration(Duration duration) {
    twoDigits(int n) => n.toString().padLeft(2, '0');
    // final twoDigits = (int n) => n.toString().padLeft(2, '0');
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    
    if (hours > 0) {
      return '${twoDigits(hours)}:${twoDigits(minutes)}:${twoDigits(seconds)}';
    } else {
      return '${twoDigits(minutes)}:${twoDigits(seconds)}';
    }
  }

  @override
  Widget build(BuildContext context) {
    final double max = totalDuration.inMilliseconds.toDouble().clamp(1, double.infinity);
    final double value = currentPosition.inMilliseconds.clamp(0, max).toDouble();

    return Column(
      children: [
        Slider(
          min: 0.0,
          max: max,
          value: value,
          activeColor: Color(0xFF030211),
          onChanged: (newValue) {
            if (onChanged != null) {
              onChanged!(Duration(milliseconds: newValue.round()));
            }
          },
          onChangeEnd: (newValue) {
            if (onChangeEnd != null) {
              onChangeEnd!(Duration(milliseconds: newValue.round()));
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_formatDuration(currentPosition)),
              Text(_formatDuration(totalDuration)),
            ],
          ),
        ),
      ],
    );
  }
}
