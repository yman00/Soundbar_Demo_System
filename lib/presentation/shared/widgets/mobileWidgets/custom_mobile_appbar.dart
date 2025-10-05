import 'package:flutter/material.dart';

class CustomMobileAppbar extends StatelessWidget {
  final String title;
  final String subTitle;

  const CustomMobileAppbar({
    super.key, 
    required this.title,
    required this.subTitle
    });

  @override
  Widget build(BuildContext context) {
    return 
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
          border: Border.all(color: Color(0xFFDDDDDD), width: 1),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Color(0xFF030211),
                    fontSize: 20,
                  ),
                ),
                Text(
                  subTitle,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFFDDDDDD), // Gray border color
                  width: 0.5,          // Border thickness
                ),
                borderRadius: BorderRadius.circular(8.0), // Optional: rounded corners
              ),
              child: const Icon(
                Icons.refresh_rounded,
                color: Color(0xFF030211),
                size: 18,
              ),
            ),

            SizedBox(width: 10),

            Container(
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFFDDDDDD), // Gray border color
                  width: 0.5,          // Border thickness
                ),
                borderRadius: BorderRadius.circular(8.0), // Optional: rounded corners
              ),
              child: const Icon(
                Icons.settings,
                color: Color(0xFF030211),
                size: 18,
              ),
            )
          ],
        )
      );
  }
}