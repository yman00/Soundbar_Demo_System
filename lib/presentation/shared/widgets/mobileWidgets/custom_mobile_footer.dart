import 'package:flutter/material.dart';

class CustomFooter extends StatelessWidget {
  final String systemStatus;

  const CustomFooter({
    super.key,
    required this.systemStatus
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
        child:                     Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.green, // Green dot
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 6), // Spacing between dot and text
              Text(
                systemStatus,
                style: TextStyle(
                  color: Color(0xFF030211),
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                ),
              ),
              SizedBox(width: 20), // Spacing between dot and text
              Text(
                'Active Device: Connected Device',
                style: TextStyle(
                  color: Color(0xFF030211),
                  fontSize: 9,
                ),
              ),

              const Spacer(),

              Text(
                // 'SanPabloDevs © 2025 - Soundbar Demo  v1.0',
                'MISO © 2025 - Flutter Testing  v1.0',
                style: TextStyle(
                  color: Color(0xFF030211),
                  fontSize: 9,
                ),
              ),
            ],
          ),
      );
  }
}