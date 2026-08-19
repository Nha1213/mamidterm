import 'package:flutter/material.dart';
import 'package:project_midterm/helper/music_card.dart';
import 'package:project_midterm/helper/music_tranding.dart';
import 'package:project_midterm/models/music_card_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<MusicCardModel> musicCards = [
    MusicCardModel(
      title: "Rap",
      image: "assets/images/Rectangle1.png",
      description: "Olivia Rodrigo",
    ),
    MusicCardModel(
      title: "Rap",
      image: "assets/images/Rectangle2.png",
      description: "Olivia Rodrigo",
    ),
    MusicCardModel(
      title: "Rap",
      image: "assets/images/Rectangle1.png",
      description: "Olivia Rodrigo",
    ),
    MusicCardModel(
      title: "Rap",
      image: "assets/images/Rectangle2.png",
      description: "Olivia Rodrigo",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      // Replace BoxDecoration image with image_1.png
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 39, 29, 63), // Dark purple top
            Color.fromARGB(255, 2, 2, 3), // Near-black bottom
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal, 
                  children: [
                    for (var card in musicCards)
                      Padding(
                        padding: const EdgeInsets.only(right: 14),
                        child: MusicCard(musicCardModel: card),
                      ),
                  ],
                ),
              ),
      
              const SizedBox(height: 20),
      
              // =========================
              // Trending Now Text
              // =========================
              const Text(
                "Trending Now",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              Column(
                children: [
                  for (var card in musicCards)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: MusicTrending(musicCardModel: card),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

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
}
