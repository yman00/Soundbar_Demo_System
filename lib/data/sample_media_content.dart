enum MediaType { music, movie, dialogue }

class Media{
  final String title;
  final String description;
  final String duration;
  final MediaType mediaIcon;
  final bool isPlaying;

  const Media({
    required this.title,
    required this.description,
    required this.duration,
    required this.mediaIcon,
    this.isPlaying = false,
  });

  Media copyWith({
    String? title,
    String? description,
    String? duration,
    MediaType? mediaIcon,
    bool? isPlaying,
  }) {
    return Media(
      title: title ?? this.title,
      description: description ?? this.description,
      duration: duration ?? this.duration,
      mediaIcon: mediaIcon ?? this.mediaIcon,
      isPlaying: isPlaying ?? this.isPlaying,
    );
  }
}

// Sample constant list
const List<Media> sampleMedia = [
  Media(
    title: 'Sony HT-A9M2', 
    description: '4.0.4 channel system, with 16 speaker drivers',
    duration: '3:10',
    mediaIcon: MediaType.music,
    isPlaying: false
  ),
  Media(
    title: 'Sony BRAVIA-(A78KL)', 
    description: '7.1.2 channel system with subwoofer',
    duration: '4:50',
    mediaIcon: MediaType.movie,
    isPlaying: false
  ),
  Media(
    title: 'Sony BT-BAR6', 
    description: '7.1.2 channel system with subwoofer',
    duration: '45:03',
    mediaIcon: MediaType.dialogue,
    isPlaying: false
  ),
  Media(
    title: 'Sony HT-A9M2', 
    description: '4.0.4 channel system, with 16 speaker drivers',
    duration: '3:10',
    mediaIcon: MediaType.music,
    isPlaying: false
  ),
  Media(
    title: 'Sony BRAVIA-(A78KL)', 
    description: '7.1.2 channel system with subwoofer',
    duration: '4:50',
    mediaIcon: MediaType.movie,
    isPlaying: false
  ),
  Media(
    title: 'Sony BT-BAR6', 
    description: '7.1.2 channel system with subwoofer',
    duration: '45:03',
    mediaIcon: MediaType.dialogue,
    isPlaying: false
  ),
  Media(
    title: 'Sony HT-A9M2', 
    description: '4.0.4 channel system, with 16 speaker drivers',
    duration: '3:10',
    mediaIcon: MediaType.music,
    isPlaying: false
  ),
  Media(
    title: 'Sony BRAVIA-(A78KL)', 
    description: '7.1.2 channel system with subwoofer',
    duration: '4:50',
    mediaIcon: MediaType.movie,
    isPlaying: false
  ),
  Media(
    title: 'Sony BT-BAR6', 
    description: '7.1.2 channel system with subwoofer',
    duration: '45:03',
    mediaIcon: MediaType.dialogue,
    isPlaying: false
  ),
  Media(
    title: 'Sony HT-A9M2', 
    description: '4.0.4 channel system, with 16 speaker drivers',
    duration: '3:10',
    mediaIcon: MediaType.music,
    isPlaying: false
  ),
  Media(
    title: 'Sony BRAVIA-(A78KL)', 
    description: '7.1.2 channel system with subwoofer',
    duration: '4:50',
    mediaIcon: MediaType.movie,
    isPlaying: false
  ),
  Media(
    title: 'Sony BT-BAR6', 
    description: '7.1.2 channel system with subwoofer',
    duration: '45:03',
    mediaIcon: MediaType.dialogue,
    isPlaying: false
  ),
];
