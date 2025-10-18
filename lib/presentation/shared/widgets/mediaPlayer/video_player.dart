import 'package:flutter/material.dart';
import 'package:soudbar_kiosk_app/data/sample_media_content.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class ChewieVideoPlayerSection extends StatefulWidget {
  final Media media;
  final VoidCallback onExit;

  const ChewieVideoPlayerSection({
    super.key,
    required this.media,
    required this.onExit,
  });

  @override
  State<ChewieVideoPlayerSection> createState() => _ChewieVideoPlayerSectionState();
}

class _ChewieVideoPlayerSectionState extends State<ChewieVideoPlayerSection> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();

    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(widget.media.url))
      ..initialize().then((_) {
        setState(() {});
      });

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: false,
      aspectRatio: 16 / 9,
      allowFullScreen: true,
      allowPlaybackSpeedChanging: true,
      allowMuting: true,
      showControls: true,
      materialProgressColors: ChewieProgressColors(
        playedColor: const Color.fromARGB(255, 165, 21, 10),
        handleColor: Color.fromARGB(255, 165, 21, 10),
        backgroundColor: const Color.fromARGB(255, 230, 230, 230),
        bufferedColor: const Color.fromARGB(255, 179, 179, 179),
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Video player
        AspectRatio(
          aspectRatio: 16 / 9,
          child: _chewieController != null &&
                  _chewieController!.videoPlayerController.value.isInitialized
              ? Chewie(controller: _chewieController!)
              : const Center(child: CircularProgressIndicator()),
        ),

        // Floating Exit Button (top-right)
        Positioned(
          top: 8,
          right: 8,
          child: ClipOval(
            child: Material(
              color: Colors.black.withOpacity(0.6),
              child: InkWell(
                onTap: widget.onExit,
                child: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(
                    Icons.close, color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
