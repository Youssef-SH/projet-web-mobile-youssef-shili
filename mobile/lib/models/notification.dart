class NotificationItem {
  final String id;
  final String type;
  final String message;
  final String time;
  final bool isRead;

  NotificationItem({
    required this.id,
    required this.type,
    required this.message,
    required this.time,
    this.isRead = false,
  });
}
