import 'package:flutter/material.dart';
import 'package:soudbar_kiosk_app/presentation/shared/layout/mobile_layout.dart';
import 'package:soudbar_kiosk_app/presentation/shared/layout/tablet_layout.dart';

class BaseLayout extends StatelessWidget {
  final Widget connectionContent;
  final Widget mediaPlayerContent;
  final Widget mediaContent;

  const BaseLayout({
    super.key,
    required this.connectionContent,
    required this.mediaPlayerContent,
    required this.mediaContent,
    });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isTablet = screenWidth > 1024;
    // final bool isTablet = screenWidth > 600;

    return isTablet
    ? TabletLayout(
      connectionContent: connectionContent, 
      mediaPlayerContent: mediaPlayerContent, 
      mediaContent: mediaContent, 
      )
    : MobileLayout(
      connectionContent: connectionContent, 
      mediaPlayerContent: mediaPlayerContent, 
      mediaContent: mediaContent, 
      )
    ;
  }
}