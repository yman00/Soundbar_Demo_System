import 'package:flutter/material.dart';

class AvailableDeviceContainer extends StatefulWidget {
  final String deviceName;
  final String deviceFeat;

  const AvailableDeviceContainer({
    required this.deviceName,
    required this.deviceFeat,
    super.key,
  });

  @override
  State<AvailableDeviceContainer> createState() => _AvailableDeviceContainerState();
}

enum DeviceStatus { connect, connected, offline }

class _AvailableDeviceContainerState extends State<AvailableDeviceContainer> {
  DeviceStatus _status = DeviceStatus.connect;

  void _toggleStatus() {
    setState(() {
      switch (_status) {
        case DeviceStatus.connect:
          _status = DeviceStatus.connected;
          break;
        case DeviceStatus.connected:
          _status = DeviceStatus.connect;
          break;
        case DeviceStatus.offline:
          _status = DeviceStatus.connect;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Define button appearance based on status
    String buttonText;
    Color backgroundColor;
    Color foregroundColor;

    switch (_status) {
      case DeviceStatus.connect:
        buttonText = 'connect';
        backgroundColor = Colors.grey;
        foregroundColor = Colors.black;
        break;
      case DeviceStatus.connected:
        buttonText = 'connected';
        backgroundColor = Color(0xFF030211);
        foregroundColor = Colors.white;
        break;
      case DeviceStatus.offline:
        buttonText = 'offline';
        backgroundColor = Color.fromARGB(255, 203, 203, 203);
        foregroundColor = Color.fromARGB(255, 119, 119, 119);
        break;
    }

    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFFDDDDDD), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.01),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 2.0),
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: Row(
        children: [
          Icon(Icons.volume_up_rounded),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.deviceName,
                style: TextStyle(fontSize: 15),
              ),
              Text(
                widget.deviceFeat,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Spacer(),
          SizedBox(
            width: 68,
            height: 25,
            child: ElevatedButton(
              onPressed: _toggleStatus,
              style: ElevatedButton.styleFrom(
                backgroundColor: backgroundColor,
                foregroundColor: foregroundColor,
                padding: EdgeInsets.symmetric(horizontal: 2, vertical: 3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Text(
                buttonText,
                style: TextStyle(fontSize: 10),
              ),
            ),
          )
        ],
      ),
    );
  }
}
