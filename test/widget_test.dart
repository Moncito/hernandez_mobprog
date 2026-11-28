import 'package:flutter_test/flutter_test.dart';

import 'package:hernandez_mobprog/main.dart';
import 'package:hernandez_mobprog/widgets/post_image.dart';

void main() {
  testWidgets('Newsfeed shows posts and only image posts get an image',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MainApp());
    await tester.pumpAndSettle();

    expect(find.text('Facebook'), findsOneWidget);
    expect(find.text('Steve Rogers'), findsOneWidget);
    expect(find.text('Tony Stark'), findsOneWidget);

    // Only Tony Stark's post has an imagePath, so exactly one PostImage.
    expect(find.byType(PostImage), findsOneWidget);
  });
}
