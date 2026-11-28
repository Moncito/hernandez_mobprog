import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hernandez_mobprog/constants.dart';
import 'package:hernandez_mobprog/models/notification_item.dart';
import 'package:hernandez_mobprog/widgets/custom_text.dart';

class NotificationCard extends StatelessWidget {
  final NotificationItem notification;

  const NotificationCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Unread notifications get a light highlight, like Facebook.
      color: notification.isRead
          ? Colors.transparent
          : fbLightPrimary.withValues(alpha: 0.25),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(15),
          vertical: ScreenUtil().setHeight(5),
        ),
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: fbLightPrimary,
          backgroundImage: AssetImage(notification.avatarPath),
        ),
        title: CustomText(
          text: notification.userName,
          fontSize: ScreenUtil().setSp(15),
          color: fbDarkPrimary,
          fontWeight: FontWeight.bold,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: notification.postTitle,
              fontSize: ScreenUtil().setSp(12),
              color: fbSecondary,
            ),
            CustomText(
              text: notification.description,
              fontSize: ScreenUtil().setSp(11),
              color: Colors.grey,
            ),
            CustomText(
              text: formatDate(notification.date),
              fontSize: ScreenUtil().setSp(10),
              color: fbPrimary,
            ),
          ],
        ),
        trailing: const Icon(Icons.more_horiz, color: fbSecondary),
      ),
    );
  }
}
