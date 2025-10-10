import 'package:flutter/material.dart';
import 'package:soudbar_kiosk_app/presentation/shared/layout/mobile_layout.dart';
import 'package:soudbar_kiosk_app/presentation/shared/layout/tablet_landscape_layout.dart';
import 'package:soudbar_kiosk_app/presentation/shared/layout/tablet_portrait_layout.dart';

class BaseLayout extends StatelessWidget {
  final Widget connectionContent;
  final Widget mediaPlayerContent;
  final Widget mediaContent;
  final Widget contentLibraryMenu;

  const BaseLayout({
    super.key,
    required this.connectionContent,
    required this.mediaPlayerContent,
    required this.mediaContent,
    required this.contentLibraryMenu,
    });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    // final bool isTablet = screenWidth > screenHeight;
    // final bool isTablet = screenWidth > 1024;
    final bool isTablet = screenWidth > 600;

  if (isTablet && screenWidth > screenHeight) {
      // Landscape tablet
      return TabletLandscapeLayout(
        connectionContent: connectionContent,
        mediaPlayerContent: mediaPlayerContent,
        mediaContent: mediaContent,
        contentLibraryMenu: contentLibraryMenu,
      );
    } else if (isTablet && screenHeight > screenWidth) {
      // Portrait tablet
      return TabletPortraitLayout(
        connectionContent: connectionContent,
        mediaPlayerContent: mediaPlayerContent,
        mediaContent: mediaContent,
        contentLibraryMenu: contentLibraryMenu,
      );
    } else {
      // Mobile
      return MobileLayout(
        connectionContent: connectionContent,
        mediaPlayerContent: mediaPlayerContent,
        mediaContent: mediaContent,
        contentLibraryMenu: contentLibraryMenu,
      );
    }
  }
}