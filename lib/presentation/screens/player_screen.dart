import 'package:flutter/material.dart';
import 'package:soudbar_kiosk_app/data/sample_media_content.dart';
import 'package:soudbar_kiosk_app/data/sample_paired_devices.dart';
import 'package:soudbar_kiosk_app/presentation/shared/layout/base_layout.dart';
import 'package:soudbar_kiosk_app/presentation/shared/widgets/available_devices_container.dart';
import 'package:soudbar_kiosk_app/presentation/shared/widgets/content_library_menu.dart';
import 'package:soudbar_kiosk_app/presentation/shared/widgets/mediaPlayer/media_player_controllers.dart';
// import 'package:soudbar_kiosk_app/presentation/shared/widgets/mediaPlayer/controller_seekbar.dart';
// import 'package:soudbar_kiosk_app/presentation/shared/widgets/mediaPlayer/controller_buttons.dart';
import 'package:soudbar_kiosk_app/presentation/shared/widgets/media_content_container.dart';

class PlayerScreen extends StatefulWidget {
  // static const routeName = '/PlayerDemo';
  
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late List<Device> devices;
  late List<Media> media;
  Media? activeMedia;


  @override
  void initState() {
    super.initState();
    devices = List<Device>.from(sampleDevices);
    // media = List<Media>.from(sampleMedia);

    // final allMediaSamples = [
    //   ...sampleMusicList,
    //   ...sampleVideoList,
    //   ...sampleDialogueList,
    // ];
    // media = allMediaSamples;

    media = [
      ...sampleMusicList,
      ...sampleVideoList,
      ...sampleDialogueList,
    ];
  }

  void _toggleStatus(int index) {
    setState(() {
      final currentDevice = devices[index];
      DeviceStatus newStatus;
      switch (currentDevice.status) {
        case DeviceStatus.connect:
          newStatus = DeviceStatus.connected;
          break;
        case DeviceStatus.connected:
          newStatus = DeviceStatus.connect;
          break;
        case DeviceStatus.offline:
          newStatus = DeviceStatus.connect;
          break;
      }
      devices[index] = currentDevice.copyWith(status: newStatus);
    });
  }

  void _togglePlay(int index) {
    setState(() {
      final selected = media[index];
      final newStatus = !selected.isPlaying;

      // Reset all other media items
      media = media.map((m) => m.copyWith(isPlaying: false)).toList();

      // Update the selected media
      media[index] = selected.copyWith(isPlaying: newStatus);
      
      // Set or unset the active media
      activeMedia = newStatus ? media[index] : null;
    });
  }

  IconData _getMediaType(MediaType type) {
    switch (type) {
      case MediaType.music:
        return 
        Icons.music_note_rounded;
      case MediaType.movie:
        return Icons.local_movies_rounded;
      case MediaType.dialogue:
        return Icons.voice_chat;

    }
  }

  (String title, Color bgColor, Color fgColor) _getChipData(MediaType type) {
  switch (type) {
    case MediaType.music:
      return ('Music', Colors.green.shade100, Colors.green.shade600);
    case MediaType.movie:
      return ('Movie', Colors.lightBlue.shade100, Colors.blue.shade600);
    case MediaType.dialogue:
      return ('Dialogue', Colors.orange.shade100, Colors.deepOrange);
  }
}

  
 @override
  Widget build(BuildContext context) {
    return BaseLayout(
      connectionContent: Expanded(
        child: ListView.builder(
          itemCount: devices.length,
          itemBuilder: (context, index) {
            final device = devices[index];
            String buttonText;
            Color backgroundColor;
            Color foregroundColor;

            switch (device.status) {
              case DeviceStatus.connect:
                buttonText = 'connect';
                backgroundColor = Color.fromARGB(255, 226, 226, 226);
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

            return AvailableDeviceContainer(
              deviceName: device.deviceName,
              deviceFeat: device.features,
              onPressed: () => _toggleStatus(index),
              connectionButton: buttonText,
              bgcolor: backgroundColor,
              fgcolor: foregroundColor,
            );
          },
        ),
      ),

      mediaPlayerContent: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: activeMedia != null
          ? MediaPlayerSection(media: activeMedia!)
          : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [
                Icon(
                  Icons.local_movies_rounded,
                  size: 80,
                  color: Colors.grey[500],
                  ),
                Text(
                  'Video display active',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[500],
                  ),
                ),
                Text(
                  'Music player pause',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[500],
                  ),
                )
              ],
            )
          ),
      ),

      contentLibraryMenu: ContentLibrabryMenu(
        allContent: () {
          
        },
        movieContent: () {
          
        },
        musicContent: () {
          
        },
        dialogueContent: () {
          
        },
      ),
      mediaContent: Expanded(
        child: ListView.builder(
          itemCount: media.length,
          itemBuilder: (context, index) {
            final item = media[index];
            final isPlaying = item.isPlaying;
            final (chipTitle, chipBgColor, chipFgColor) = _getChipData(item.mediaIcon);

            return MediaContentContainer(
              mediaIcons: _getMediaType(item.mediaIcon),
              mediaTitle: item.title,
              chipTitle: chipTitle,
              chipIcon: _getMediaType(item.mediaIcon),
              chipBgColor: chipBgColor,
              chipFgColor: chipFgColor,
              mediaDesc: item.description,
              mediaDuration: item.duration,
              buttonIcons:
                  isPlaying ? Icons.stop_rounded : Icons. play_arrow_rounded,
              buttonText: isPlaying ? 'Stop' : 'Play',
              bgcolor: isPlaying
                  ? Color.fromARGB(255, 226, 226, 226)
                  : Color(0xFF030211),
              fgcolor: isPlaying
                  ? Color(0xFF030211)
                  : Colors.white,
              onPressed: () => _togglePlay(index),
            );
          },
        ),
      ),
    );
  }
}