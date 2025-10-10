enum MediaType { music, movie, dialogue }

class Media{
  final String title;
  final String description;
  final String duration;
  final MediaType mediaIcon;
  final String url;
  final bool isPlaying;

  const Media({
    required this.title,
    required this.description,
    required this.duration,
    required this.mediaIcon,
    required this.url,
    this.isPlaying = false,
  });

  Media copyWith({
    String? title,
    String? description,
    String? duration,
    MediaType? mediaIcon,
    String? url,
    bool? isPlaying,
  }) {
    return Media(
      title: title ?? this.title,
      description: description ?? this.description,
      duration: duration ?? this.duration,
      mediaIcon: mediaIcon ?? this.mediaIcon,
      url: url ?? this.url,
      isPlaying: isPlaying ?? this.isPlaying,
    );
  }
}

const List<Media> sampleMusicList = [
 Media(
    title: 'Tech Talk Episode 12',
    description: 'Discussion on emerging tech trends in 2025.',
    duration: '27:14',
    mediaIcon: MediaType.music,
    url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3",
  ),
  Media(
    title: 'Motivational Speech',
    description: 'Start your day with a powerful mindset.',
    duration: '4:59',
    mediaIcon: MediaType.music,
    url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3",
  ),
  Media(
    title: 'Ocean Waves',
    description: 'Calming ocean wave sounds for sleep.',
    duration: '6:30',
    mediaIcon: MediaType.music,
    url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-5.mp3",
  ),
  ];

const List<Media> sampleVideoList = [
  Media(
    title: 'Sample Nature Video',
    description: 'Beautiful landscapes and nature scenes.',
    duration: '4:12',
    mediaIcon: MediaType.movie,
    url: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  ),
  Media(
    title: 'Ocean Documentary',
    description: 'Explore the depths of the ocean.',
    duration: '5:30',
    mediaIcon: MediaType.movie,
    url: 'https://samplelib.com/lib/preview/mp4/sample-5s.mp4',
  ),
];

const List<Media> sampleDialogueList = [
  Media(
    title: 'Product Pitch',
    description: 'Narration about product features.',
    duration: '1:45',
    mediaIcon: MediaType.dialogue,
    url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3',
  ),
];


// Sample constant list
// const List<Media> sampleMedia = [
//   Media(
//     title: 'Sony HT-A9M2', 
//     description: '4.0.4 channel system, with 16 speaker drivers',
//     duration: '3:10',
//     mediaIcon: MediaType.music,
//     url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
//     isPlaying: false
//   ),
//   Media(
//     title: 'Sony BRAVIA-(A78KL)', 
//     description: '7.1.2 channel system with subwoofer',
//     duration: '4:50',
//     mediaIcon: MediaType.movie,
//     url: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
//     isPlaying: false
//   ),
//   Media(
//     title: 'Sony BT-BAR6', 
//     description: '7.1.2 channel system with subwoofer',
//     duration: '45:03',
//     mediaIcon: MediaType.dialogue,
//     url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3',
//     isPlaying: false
//   ),
//   Media(
//     title: 'Sony HT-A9M2', 
//     description: '4.0.4 channel system, with 16 speaker drivers',
//     duration: '3:10',
//     mediaIcon: MediaType.music,
//     url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3',
//     isPlaying: false
//   ),
//   Media(
//     title: 'Sony BRAVIA-(A78KL)', 
//     description: '7.1.2 channel system with subwoofer',
//     duration: '4:50',
//     mediaIcon: MediaType.movie,
//     url: 'https://samplelib.com/lib/preview/mp4/sample-5s.mp4',
//     isPlaying: false
//   ),
//   Media(
//     title: 'Sony BT-BAR6', 
//     description: '7.1.2 channel system with subwoofer',
//     duration: '45:03',
//     mediaIcon: MediaType.dialogue,
//     url: 
//     isPlaying: false
//   ),
//   Media(
//     title: 'Sony HT-A9M2', 
//     description: '4.0.4 channel system, with 16 speaker drivers',
//     duration: '3:10',
//     mediaIcon: MediaType.music,
//     url: 
//     isPlaying: false
//   ),
//   Media(
//     title: 'Sony BRAVIA-(A78KL)', 
//     description: '7.1.2 channel system with subwoofer',
//     duration: '4:50',
//     mediaIcon: MediaType.movie,
//     url: 
//     isPlaying: false
//   ),
//   Media(
//     title: 'Sony BT-BAR6', 
//     description: '7.1.2 channel system with subwoofer',
//     duration: '45:03',
//     mediaIcon: MediaType.dialogue,
//     url: 
//     isPlaying: false
//   ),
//   Media(
//     title: 'Sony HT-A9M2', 
//     description: '4.0.4 channel system, with 16 speaker drivers',
//     duration: '3:10',
//     mediaIcon: MediaType.music,
//     url: 
//     isPlaying: false
//   ),
//   Media(
//     title: 'Sony BRAVIA-(A78KL)', 
//     description: '7.1.2 channel system with subwoofer',
//     duration: '4:50',
//     mediaIcon: MediaType.movie,
//     url: 
//     isPlaying: false
//   ),
//   Media(
//     title: 'Sony BT-BAR6', 
//     description: '7.1.2 channel system with subwoofer',
//     duration: '45:03',
//     mediaIcon: MediaType.dialogue,
//     url: 
//     isPlaying: false
//   ),
// ];
