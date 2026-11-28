import 'package:hernandez_mobprog/models/notification_item.dart';
import 'package:hernandez_mobprog/models/post.dart';

DateTime _ago({int minutes = 0, int hours = 0, int days = 0}) =>
    DateTime.now().subtract(Duration(minutes: minutes, hours: hours, days: days));

/// 10 posts: some with a real image, some with a placeholder, some text only.
final List<Post> posts = [
  Post(
    userName: 'Steve Rogers',
    content: 'I can do this all day! #AvengersAssemble',
    date: _ago(minutes: 12),
    numOfLikes: 10,
    numOfComments: 4,
    numOfShares: 1,
  ),
  Post(
    userName: 'Tony Stark',
    content: 'I am Iron Man. #GeniusBillionairePlayboyPhilanthropist',
    date: _ago(hours: 2),
    numOfLikes: 3000,
    numOfComments: 845,
    numOfShares: 320,
    imagePath: 'assets/images/iron_man.jpg',
  ),
  Post(
    userName: 'Cyrus Robles',
    content: 'Kamusta! First post here on Monciverse.',
    date: _ago(hours: 5),
    numOfLikes: 58,
    numOfComments: 12,
    numOfShares: 2,
  ),
  Post(
    userName: 'Robin Juanatas',
    content: 'Kicking off the holiday season with Cyril Wick!',
    date: _ago(days: 1),
    numOfLikes: 245,
    numOfComments: 37,
    numOfShares: 9,
    hasPlaceholder: true,
  ),
  Post(
    userName: 'Natasha Romanoff',
    content: 'Training day. No days off. #RedRoom',
    date: _ago(days: 2),
    numOfLikes: 1820,
    numOfComments: 203,
    numOfShares: 44,
    hasPlaceholder: true,
  ),
  Post(
    userName: 'Bruce Banner',
    content: "That's my secret, Cap. I'm always angry.",
    date: _ago(days: 3),
    numOfLikes: 970,
    numOfComments: 88,
    numOfShares: 15,
  ),
  Post(
    userName: 'Peter Parker',
    content: 'Mr. Stark, I don\'t feel so good... just kidding, exam week.',
    date: _ago(days: 4),
    numOfLikes: 12500,
    numOfComments: 1300,
    numOfShares: 640,
    imagePath: 'assets/images/iron_man.jpg',
  ),
  Post(
    userName: 'Wanda Maximoff',
    content: 'Home is where the sitcom is.',
    date: _ago(days: 6),
    numOfLikes: 430,
    numOfComments: 51,
    numOfShares: 7,
    hasPlaceholder: true,
  ),
  Post(
    userName: 'Thor Odinson',
    content: 'Another! *throws mug* #Asgard',
    date: _ago(days: 10),
    numOfLikes: 2200,
    numOfComments: 190,
    numOfShares: 60,
  ),
  Post(
    userName: 'Moncito Glenn Hernandez',
    content: 'Lab Activity 2A done: 10 posts and 20 notifications, all dynamic. #INF248',
    date: _ago(days: 25),
    numOfLikes: 77,
    numOfComments: 9,
    numOfShares: 3,
    imagePath: 'assets/images/profile.jpg',
  ),
];

/// 20 notifications.
final List<NotificationItem> notifications = [
  NotificationItem(userName: 'Tony Stark', postTitle: 'Reacted to your post', description: 'Lab Activity 2A done: 10 posts...', date: _ago(minutes: 3)),
  NotificationItem(userName: 'Steve Rogers', postTitle: 'Commented on your post', description: '"Nice work, soldier."', date: _ago(minutes: 18)),
  NotificationItem(userName: 'Cyrus Robles', postTitle: 'Sent you a friend request', description: '12 mutual friends', date: _ago(minutes: 45)),
  NotificationItem(userName: 'Robin Juanatas', postTitle: 'Tagged you in a post', description: 'Kicking off the holiday season...', date: _ago(hours: 1)),
  NotificationItem(userName: 'Natasha Romanoff', postTitle: 'Shared your post', description: 'Training day. No days off.', date: _ago(hours: 2)),
  NotificationItem(userName: 'Bruce Banner', postTitle: 'Mentioned you in a comment', description: '"@Moncito check this out"', date: _ago(hours: 3)),
  NotificationItem(userName: 'Peter Parker', postTitle: 'Posted a new photo', description: 'Exam week survival kit', date: _ago(hours: 5)),
  NotificationItem(userName: 'Wanda Maximoff', postTitle: 'Invited you to a group', description: 'Westview Neighbors', date: _ago(hours: 8), isRead: true),
  NotificationItem(userName: 'Thor Odinson', postTitle: 'Reacted to your comment', description: '"Another!"', date: _ago(hours: 12), isRead: true),
  NotificationItem(userName: 'INF248 Group', postTitle: 'New announcement', description: 'Lab Activity 2A has been posted', date: _ago(days: 1), isRead: true),
  NotificationItem(userName: 'Clint Barton', postTitle: 'Liked your photo', description: 'Profile picture', date: _ago(days: 1), isRead: true),
  NotificationItem(userName: 'Sam Wilson', postTitle: 'Commented on your post', description: '"On your left."', date: _ago(days: 2), isRead: true),
  NotificationItem(userName: 'Bucky Barnes', postTitle: 'Accepted your friend request', description: 'You are now friends', date: _ago(days: 2), isRead: true),
  NotificationItem(userName: 'Carol Danvers', postTitle: 'Went live', description: 'Higher, further, faster', date: _ago(days: 3), isRead: true),
  NotificationItem(userName: 'Stephen Strange', postTitle: 'Shared a memory', description: '14,000,605 futures ago', date: _ago(days: 3), isRead: true),
  NotificationItem(userName: "T'Challa", postTitle: 'Reacted to your post', description: 'Wakanda Forever', date: _ago(days: 4), isRead: true),
  NotificationItem(userName: 'Scott Lang', postTitle: 'Tagged you in a photo', description: 'Quantum realm selfie', date: _ago(days: 5), isRead: true),
  NotificationItem(userName: 'Hope van Dyne', postTitle: 'Commented on a photo', description: '"Scott, stop."', date: _ago(days: 6), isRead: true),
  NotificationItem(userName: 'Nick Fury', postTitle: 'Invited you to an event', description: 'Avengers Initiative briefing', date: _ago(days: 8), isRead: true),
  NotificationItem(userName: 'Monciverse', postTitle: 'Welcome to Monciverse!', description: 'Complete your profile to get started', date: _ago(days: 25), isRead: true),
];
