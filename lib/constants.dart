import 'package:material_ui/material_ui.dart';

// Enhancement 4: own social media application name
const String appName = 'Monciverse';

// Enhancement 5: color palette (#1B1931, #44174E, #662249, #A34054, #ED9E59, #E9BCB9)
const Color fbPrimary = Color(0xFFA34054);
const Color fbSecondary = Color(0xFF662249);
const Color fbDarkPrimary = Color(0xFF1B1931);
const Color fbLightPrimary = Color(0xFFE9BCB9);
const Color fbTextColorWhite = Color(0xFFFDF1EF);
const Color fbAccent = Color(0xFFED9E59);
const Color fbPurple = Color(0xFF44174E);

const List<String> _months = [
  'January', 'February', 'March', 'April', 'May', 'June',
  'July', 'August', 'September', 'October', 'November', 'December',
];

/// Formats a post/notification date like Facebook does:
/// "Just now", "15m", "3h", "2d", or "November 3, 2026" for older dates.
String formatDate(DateTime date, {DateTime? now}) {
  final diff = (now ?? DateTime.now()).difference(date);
  if (diff.inMinutes < 1) return 'Just now';
  if (diff.inMinutes < 60) return '${diff.inMinutes}m';
  if (diff.inHours < 24) return '${diff.inHours}h';
  if (diff.inDays < 7) return '${diff.inDays}d';
  return '${_months[date.month - 1]} ${date.day}, ${date.year}';
}

/// Shortens big counts: 1200 -> 1.2K, 3000000 -> 3M.
String formatCount(int value) {
  if (value >= 1000000) {
    final v = value / 1000000;
    return '${v.toStringAsFixed(v.truncateToDouble() == v ? 0 : 1)}M';
  }
  if (value >= 1000) {
    final v = value / 1000;
    return '${v.toStringAsFixed(v.truncateToDouble() == v ? 0 : 1)}K';
  }
  return '$value';
}
