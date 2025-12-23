class Post {
  final String id;
  final String clubId;
  final String? eventId;
  final String content;
  final String? mediaUrl;
  final String createdAt;

  Post({
    required this.id,
    required this.clubId,
    this.eventId,
    required this.content,
    this.mediaUrl,
    required this.createdAt,
  });
}
