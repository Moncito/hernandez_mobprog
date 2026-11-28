import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hernandez_mobprog/constants.dart';
import 'package:hernandez_mobprog/screens/newsfeed_screen.dart';
import 'package:hernandez_mobprog/screens/notification_screen.dart';
import 'package:hernandez_mobprog/screens/profile_screen.dart';
import 'package:hernandez_mobprog/widgets/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final PageController _pageController = PageController();

  // Enhancement 2: one AppBar title per page
  static const List<String> _titles = [appName, 'Notifications', 'Profile'];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isHome = _selectedIndex == 0;

    return Scaffold(
      backgroundColor: fbTextColorWhite,
      appBar: AppBar(
        backgroundColor: fbDarkPrimary,
        shadowColor: fbPurple,
        elevation: 2,
        title: CustomText(
          text: _titles[_selectedIndex],
          fontSize: ScreenUtil().setSp(isHome ? 25 : 21),
          color: isHome ? fbAccent : fbTextColorWhite,
          fontFamily: 'Klavika',
          fontWeight: FontWeight.w700,
        ),
        actions: [
          if (isHome)
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: fbLightPrimary),
            ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: const [
          NewsFeedScreen(),
          NotificationScreen(),
          ProfileScreen(),
        ],
        onPageChanged: (page) {
          setState(() {
            _selectedIndex = page;
          });
        },
      ),
      // Enhancement 3: more BottomNavigationBarItems
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: fbDarkPrimary,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onTappedBar,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: fbAccent,
        unselectedItemColor: fbLightPrimary,
        currentIndex: _selectedIndex,
      ),
    );
  }

  void _onTappedBar(int value) {
    setState(() {
      _selectedIndex = value;
    });

    _pageController.jumpToPage(value);
  }
}
