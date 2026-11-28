import 'package:material_ui/material_ui.dart';
import 'package:hernandez_mobprog/data/dummy_data.dart';
import 'package:hernandez_mobprog/widgets/notification_card.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: notifications.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) =>
          NotificationCard(notification: notifications[index]),
    );
  }
}
