import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hernandez_mobprog/constants.dart';
import 'package:hernandez_mobprog/data/dummy_data.dart';
import 'package:hernandez_mobprog/widgets/custom_text.dart';
import 'package:hernandez_mobprog/widgets/newsfeed_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const String userName = 'Moncito Glenn Hernandez';

  @override
  Widget build(BuildContext context) {
    final myPosts = posts.where((p) => p.userName == userName).toList();

    return ListView(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(20)),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [fbAccent, fbPrimary, fbPurple],
            ),
          ),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 48,
                backgroundColor: fbTextColorWhite,
                child: CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(10)),
              CustomText(
                text: userName,
                fontSize: ScreenUtil().setSp(18),
                color: fbTextColorWhite,
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                text: 'INF248 · Mobile Programming',
                fontSize: ScreenUtil().setSp(12),
                color: fbTextColorWhite,
              ),
            ],
          ),
        ),
        ...myPosts.map((p) => NewsFeedCard(post: p)),
      ],
    );
  }
}
