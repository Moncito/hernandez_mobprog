class Post {
  final String userName;
  final String avatarPath;
  final String content;
  final DateTime date;
  final int numOfLikes;
  final int numOfComments;
  final int numOfShares;

  /// Real image for the post. Takes priority over [hasPlaceholder].
  final String? imagePath;

  /// Shows an empty image placeholder when the post has no real image.
  final bool hasPlaceholder;

  const Post({
    required this.userName,
    required this.content,
    required this.date,
    this.avatarPath = 'assets/images/profile.jpg',
    this.numOfLikes = 0,
    this.numOfComments = 0,
    this.numOfShares = 0,
    this.imagePath,
    this.hasPlaceholder = false,
  });
}
