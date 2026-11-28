import 'package:material_ui/material_ui.dart';
import 'package:hernandez_mobprog/constants.dart';

class PostImage extends StatelessWidget {
  final String imagePath;

  const PostImage({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        imagePath,
        width: double.infinity,
        height: 250,
        fit: BoxFit.cover,
      ),
    );
  }
}

/// Empty image box with a crossed frame, shown when a post has a
/// placeholder instead of a real picture.
class PostImagePlaceholder extends StatelessWidget {
  const PostImagePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: double.infinity,
        height: 250,
        color: fbLightPrimary.withValues(alpha: 0.35),
        child: CustomPaint(
          painter: _CrossPainter(),
          child: const Center(
            child: Icon(Icons.image_outlined, size: 48, color: fbSecondary),
          ),
        ),
      ),
    );
  }
}

class _CrossPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = fbSecondary.withValues(alpha: 0.35)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    canvas.drawRect(Offset.zero & size, paint);
    canvas.drawLine(Offset.zero, Offset(size.width, size.height), paint);
    canvas.drawLine(Offset(size.width, 0), Offset(0, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
