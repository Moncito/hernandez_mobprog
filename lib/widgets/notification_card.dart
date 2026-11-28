import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hernandez_mobprog/widgets/custom_text.dart';

class NotificationCard extends StatelessWidget {
  final String userName;
  final String postTitle;
  final String description;

  const NotificationCard({
    super.key,
    required this.userName,
    required this.postTitle,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(15),
        vertical: ScreenUtil().setHeight(5),
      ),
      leading: const CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage('assets/images/profile.jpg'),
      ),
      title: CustomText(
        text: userName,
        fontSize: ScreenUtil().setSp(15),
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: postTitle,
            fontSize: ScreenUtil().setSp(12),
            color: Colors.black87,
          ),
          CustomText(
            text: description,
            fontSize: ScreenUtil().setSp(11),
            color: Colors.grey,
          ),
        ],
      ),
      trailing: const Icon(Icons.more_horiz),
    );
  }
}
