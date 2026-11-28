import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hernandez_mobprog/widgets/custom_text.dart';
import 'package:hernandez_mobprog/widgets/post_action_button.dart';
import 'package:hernandez_mobprog/widgets/post_image.dart';

class NewsFeedCard extends StatelessWidget {
  final String userName;
  final String postContent;
  final String date;
  final int? numOfLikes;

  /// Path of the post image. When null, the card shows no image.
  final String? imagePath;

  /// Path of the user's profile picture.
  final String avatarPath;

  const NewsFeedCard({
    super.key,
    required this.userName,
    required this.postContent,
    required this.date,
    this.numOfLikes,
    this.imagePath,
    this.avatarPath = 'assets/images/profile.jpg',
  });

  bool get hasImage => imagePath != null;

  @override
  Widget build(BuildContext context) {
    final double screenUtil10 = ScreenUtil().setSp(10);
    final double screenUtil15 = ScreenUtil().setWidth(15);
    final double screenUtilFontUserNameSize = ScreenUtil().setSp(15);
    final double screenUtilIconSize = ScreenUtil().setSp(15);

    return Card(
      margin: EdgeInsets.all(screenUtil15),
      child: Padding(
        padding: EdgeInsets.all(screenUtil15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Info (Enhancement 2: avatar image)
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(avatarPath),
                ),
                SizedBox(width: screenUtil10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: userName,
                      fontSize: screenUtilFontUserNameSize,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: date,
                          fontSize: ScreenUtil().setSp(12),
                          color: Colors.grey,
                        ),
                        SizedBox(width: ScreenUtil().setWidth(3)),
                        Icon(
                          Icons.public,
                          color: Colors.grey,
                          size: screenUtilIconSize,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: ScreenUtil().setHeight(5)),

            // Post Content
            CustomText(
              text: postContent,
              fontSize: ScreenUtil().setSp(12),
              color: Colors.black,
            ),

            SizedBox(height: ScreenUtil().setHeight(5)),

            // Enhancement 1: image widget, shown only when the post has an image
            if (hasImage) PostImage(imagePath: imagePath!),

            const SizedBox(height: 10),

            // Reactions summary
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.thumb_up, color: Colors.blue, size: 18),
                    const SizedBox(width: 5),
                    Text('${numOfLikes ?? 0}'),
                  ],
                ),
                const Text('42 Comments · 5 Shares'),
              ],
            ),

            const SizedBox(height: 10),

            // Enhancement 3: widget-based action buttons
            const Divider(),
            Row(
              children: [
                PostActionButton(
                  icon: Icons.thumb_up_alt_outlined,
                  text: 'Like',
                  onPressed: () {},
                ),
                PostActionButton(
                  icon: Icons.comment_outlined,
                  text: 'Comment',
                  onPressed: () {},
                ),
                PostActionButton(
                  icon: Icons.share_outlined,
                  text: 'Share',
                  onPressed: () {},
                ),
              ],
            ),
            const Divider(),

            // Comment Box
            Row(
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundImage: AssetImage(avatarPath),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: ScreenUtil().setWidth(8)),
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(12),
                      vertical: ScreenUtil().setHeight(8),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const CustomText(
                      text: 'Write a comment...',
                      fontSize: 11,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: ScreenUtil().setHeight(10)),

            CustomText(
              text: 'View all comments',
              fontSize: ScreenUtil().setSp(12),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
