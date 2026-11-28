import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hernandez_mobprog/constants.dart';
import 'package:hernandez_mobprog/models/post.dart';
import 'package:hernandez_mobprog/widgets/custom_text.dart';
import 'package:hernandez_mobprog/widgets/post_action_button.dart';
import 'package:hernandez_mobprog/widgets/post_image.dart';

class NewsFeedCard extends StatelessWidget {
  final Post post;

  const NewsFeedCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final double screenUtil10 = ScreenUtil().setSp(10);
    final double screenUtil15 = ScreenUtil().setWidth(15);

    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(
        horizontal: screenUtil15,
        vertical: ScreenUtil().setHeight(8),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenUtil15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Info
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: fbLightPrimary,
                  backgroundImage: AssetImage(post.avatarPath),
                ),
                SizedBox(width: screenUtil10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: post.userName,
                        fontSize: ScreenUtil().setSp(15),
                        color: fbDarkPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                      Row(
                        children: [
                          // Enhancement 1: date per post
                          CustomText(
                            text: formatDate(post.date),
                            fontSize: ScreenUtil().setSp(12),
                            color: Colors.grey,
                          ),
                          SizedBox(width: ScreenUtil().setWidth(3)),
                          Icon(
                            Icons.public,
                            color: Colors.grey,
                            size: ScreenUtil().setSp(15),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.more_horiz, color: fbSecondary),
              ],
            ),

            SizedBox(height: ScreenUtil().setHeight(8)),

            CustomText(
              text: post.content,
              fontSize: ScreenUtil().setSp(13),
              color: fbDarkPrimary,
            ),

            SizedBox(height: ScreenUtil().setHeight(8)),

            // Enhancement 1: real image, placeholder, or none
            if (post.imagePath != null)
              PostImage(imagePath: post.imagePath!)
            else if (post.hasPlaceholder)
              const PostImagePlaceholder(),

            const SizedBox(height: 10),

            // Enhancement 1: dynamic number of values
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.thumb_up, color: fbPrimary, size: 18),
                    const SizedBox(width: 5),
                    Text(formatCount(post.numOfLikes)),
                  ],
                ),
                Text(
                  '${_plural(post.numOfComments, 'Comment')} · '
                  '${_plural(post.numOfShares, 'Share')}',
                ),
              ],
            ),

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
                const CircleAvatar(
                  radius: 12,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: ScreenUtil().setWidth(8)),
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(12),
                      vertical: ScreenUtil().setHeight(8),
                    ),
                    decoration: BoxDecoration(
                      color: fbLightPrimary.withValues(alpha: 0.3),
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

            if (post.numOfComments > 0) ...[
              SizedBox(height: ScreenUtil().setHeight(10)),
              CustomText(
                text: post.numOfComments == 1
                    ? 'View 1 comment'
                    : 'View all ${formatCount(post.numOfComments)} comments',
                fontSize: ScreenUtil().setSp(12),
                fontWeight: FontWeight.bold,
                color: fbSecondary,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

String _plural(int count, String word) =>
    '${formatCount(count)} $word${count == 1 ? '' : 's'}';
