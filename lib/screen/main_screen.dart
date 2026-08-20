import 'package:flutter/material.dart';
import 'package:project_midterm/provider/home_provider.dart';
import 'package:project_midterm/screen/home_screen.dart';
import 'package:project_midterm/screen/profile_screen.dart';
import 'package:project_midterm/screen/song_screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  final List<IconData> _navIcons = [
    Icons.home_rounded,
    Icons.music_note_rounded,
    Icons.person_rounded,
  ];

  final List<Widget> _pagesScreen = [
    HomeScreen(),
    SongScreen(),
    ProfileScreen(),
  ];

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeProvider>(
        builder: (context, value, child) => IndexedStack(
          index: value.currentIndex,
          children: [..._pagesScreen],
        ),
      ),

      // =========================
      // Custom Styled Bottom Navigation Bar
      // =========================
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1E1C24).withOpacity(0.85),
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Consumer<HomeProvider>(
          builder: (context, value, child) => BottomNavigationBar(
            currentIndex: value.currentIndex,
            onTap: (index) => {
              value.onTap(index),
              _pageController.animateToPage(
                index,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              ),
            },
            backgroundColor: Colors.transparent,
            elevation: 0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: List.generate(_navIcons.length, (index) {
              return BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  _navIcons[index],
                  color: Colors.white.withOpacity(0.5),
                  size: 22,
                ),
                activeIcon: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF9D50BB), // Glow purple
                        Color(0xFF3B82F6), // Glow blue
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF3B82F6).withOpacity(0.35),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(_navIcons[index], color: Colors.white, size: 22),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
