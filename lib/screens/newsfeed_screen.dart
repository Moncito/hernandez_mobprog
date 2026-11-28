import 'package:material_ui/material_ui.dart';
import 'package:hernandez_mobprog/data/dummy_data.dart';
import 'package:hernandez_mobprog/widgets/newsfeed_card.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // builder only creates the cards that are visible on screen
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) => NewsFeedCard(post: posts[index]),
    );
  }
}
