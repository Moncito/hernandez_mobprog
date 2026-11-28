# hernandez_mobprog

Lab Activity 1A: File Structuring | Design Pattern. A Facebook-style newsfeed built with Flutter and `flutter_screenutil`.

**Student:** Moncito Glenn Hernandez · **Section:** INF248

## Project structure

```
lib/
├── screens/
│   ├── home_screen.dart
│   └── newsfeed_screen.dart
├── widgets/
│   ├── custom_text.dart
│   ├── newsfeed_card.dart
│   ├── post_action_button.dart   (Enhancement 3)
│   └── post_image.dart           (Enhancement 1)
├── constants.dart
└── main.dart
```

## Enhancements

1. **Image widget for post images.** `PostImage` (`lib/widgets/post_image.dart`) wraps `Image.asset` with rounded corners, full width, a fixed height and `BoxFit.cover`.
2. **Avatar image for the user profile.** The generic person icon was replaced with a `CircleAvatar` that uses an `AssetImage`, both in the post header and the comment box.
3. **Widget-based Like, Comment and Share buttons.** `PostActionButton` (`lib/widgets/post_action_button.dart`) takes an icon, a label and an `onPressed` callback, so all three buttons share one widget.

## Lab Activity 1: Discussion

**How did I integrate the image into `newsfeed_card.dart` and make it dynamic, whether it has an image or not?**

I did not put the `Image.asset` code directly inside the card. Instead, I created a separate reusable widget called `PostImage` in `lib/widgets/post_image.dart`. It receives an `imagePath` and displays the image using `Image.asset`, wrapped in a `ClipRRect` for rounded corners, with `width: double.infinity`, a fixed height and `BoxFit.cover` so every post image has the same size and look.

To make it dynamic, `NewsFeedCard` has an optional (nullable) parameter `String? imagePath`. Each post in `newsfeed_screen.dart` decides for itself whether it has an image:

```dart
NewsFeedCard(
  userName: 'Steve Rogers',
  postContent: 'I can do this all day! #AvengersAssemble',
  date: '2 hours ago',
  numOfLikes: 10,
), // no imagePath, so no image

NewsFeedCard(
  userName: 'Tony Stark',
  postContent: 'I am Iron Man. #GeniusBillionairePlayboyPhilanthropist',
  date: 'December 1, 2023',
  numOfLikes: 3000,
  imagePath: 'assets/images/iron_man.jpg',
), // has an image
```

Inside the card, a getter checks if a path was given, and a collection `if` adds the image to the `Column` only when it exists:

```dart
bool get hasImage => imagePath != null;
...
if (hasImage) PostImage(imagePath: imagePath!),
```

So a text-only post (Steve Rogers) shows no empty space for an image, while a post with an image (Tony Stark) shows it. Any new post can show any picture just by passing a different `imagePath`, without changing the card's code. The same idea is used for the profile picture through the `avatarPath` parameter.

## Output

| Before enhancement | After enhancement | After (post with image) |
| --- | --- | --- |
| ![Before](screenshots/before.png) | ![After](screenshots/after.png) | ![After, image post](screenshots/after_image_post.png) |

## Run

```bash
flutter pub get
flutter run
```
