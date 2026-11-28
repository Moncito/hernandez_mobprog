import 'package:flutter/material.dart';
import 'package:hernandez_mobprog/widgets/notification_card.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        NotificationCard(
          userName: 'Sample Name',
          postTitle: 'First Sample Post',
          description: 'Sample description',
        ),
      ],
    );
  }
}
