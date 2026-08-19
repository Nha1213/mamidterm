import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF09080C),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          children: [
            // =========================
            // Header
            // =========================
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Music",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),

                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF51485F), Color(0xFF302B38)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: const Color(0xFF625A6D),
                      width: 0.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(Icons.search, size: 17, color: Colors.white),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            // =========================
            // Categories
            // =========================
            SizedBox(
              height: 34,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _musicCard("All", isSelected: true),
                  _musicCard("Video"),
                  _musicCard("Chill"),
                  _musicCard("Workout"),
                  _musicCard("Focus"),
                  _musicCard("Sleep"),
                ],
              ),
            ),

            const SizedBox(height: 22),

            // =========================
            // For You
            // =========================
            const Text(
              "For You",
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 12),

            // =========================
            // Music Cards
            // =========================
            SizedBox(
              height: 170,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _musicItem(title: "doja vu", artist: "Olivia Rodrigo"),

                  _musicItem(title: "APT.", artist: "ROSÉ, Bruno"),

                  _musicItem(title: "Die With A Smile", artist: "Lady Gaga"),

                  _musicItem(
                    title: "Birds of a Feather",
                    artist: "Billie Eilish",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // =========================
            // Popular
            // =========================
            const Text(
              "Popular",
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 170,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _musicItem(title: "APT.", artist: "ROSÉ, Bruno"),
                  _musicItem(title: "Die With A Smile", artist: "Lady Gaga"),
                  _musicItem(title: "Houdini", artist: "Dua Lipa"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =====================================
  // Category Button
  // =====================================
  Widget _musicCard(String title, {bool isSelected = false}) {
    return Container(
      height: 32,
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        gradient: isSelected
            ? const LinearGradient(
                colors: [Color(0xFF5B7CFF), Color(0xFF8A6DFF)],
              )
            : const LinearGradient(
                colors: [Color(0xFF302E39), Color(0xFF24232B)],
              ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? Colors.transparent : const Color(0xFF4B4855),
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 11,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }

  // =====================================
  // Music Item
  // =====================================
  Widget _musicItem({required String title, required String artist}) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Album
          Stack(
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF8D7BC4), Color(0xFF51485F)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Icon(
                    Icons.music_note,
                    size: 40,
                    color: Colors.white70,
                  ),
                ),
              ),

              // Play button
              Positioned(
                right: 7,
                bottom: 7,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: Color(0xFF617DFF),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 7),

          // Title
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 3),

          // Artist
          Text(
            artist,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Color(0xFF85828C), fontSize: 9),
          ),
        ],
      ),
    );
  }
}
