import 'package:flutter/material.dart';

class AvailableDeviceContainer extends StatelessWidget {
      final String deviceName;
      final String deviceFeat;
      final VoidCallback onPressed;
      final String connectionButton;
      final Color bgcolor;
      final Color fgcolor;

  const AvailableDeviceContainer({
    required this.deviceName,
    required this.deviceFeat,
    required this.onPressed,
    required this.connectionButton,
    required this.bgcolor,
    required this.fgcolor,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return 
      Container(
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
        margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
        child: Row(
          children: [
            Icon(Icons.volume_up_rounded),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  deviceName,
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  deviceFeat,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey
                  ),
                ),
              ],
            ),
            Spacer(),
            SizedBox(
              width: 68,
              height: 25,
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: bgcolor,
                  foregroundColor: fgcolor,
                  padding: EdgeInsets.symmetric(horizontal: 2, vertical: 3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text(
                  connectionButton,
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
            )
          ],
        )
      );
  }
}

