class NotificationItem {
  final String userName;
  final String postTitle;
  final String description;
  final DateTime date;
  final String avatarPath;
  final bool isRead;

  const NotificationItem({
    required this.userName,
    required this.postTitle,
    required this.description,
    required this.date,
    this.avatarPath = 'assets/images/profile.jpg',
    this.isRead = false,
  });
}
