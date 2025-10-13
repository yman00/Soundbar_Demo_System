import 'package:flutter/material.dart';

class VolumeSlider extends StatefulWidget {
  final double value;
  final double max;
  final ValueChanged<double>? onChanged;
  final ValueChanged<double>? onChangeEnd;

  const VolumeSlider({
    super.key,
    required this.value,
    this.max = 100.0,
    this.onChanged,
    this.onChangeEnd,
  });

  @override
  State<VolumeSlider> createState() => _VolumeSliderState();
}

class _VolumeSliderState extends State<VolumeSlider> {
  late double _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Slider(
        min: 0.0,
        max: widget.max,
        value: _currentValue,
        activeColor: Color(0xFF030211), // Change this to your desired color
        onChanged: (newValue) {
          setState(() {
            _currentValue = newValue;
          });
          if (widget.onChanged != null) {
            widget.onChanged!(newValue);
          }
        },
        onChangeEnd: (newValue) {
          if (widget.onChangeEnd != null) {
            widget.onChangeEnd!(newValue);
          }
        },
      ),
    );
  }
}
