import 'package:flutter/material.dart';
import 'package:project_midterm/helper/music_card.dart';
import 'package:project_midterm/helper/music_tranding.dart';
import 'package:project_midterm/models/music_card_model.dart';

class SongScreen extends StatefulWidget {
  const SongScreen({super.key});

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  List<MusicCardModel> musicTrending = [
    MusicCardModel(
      title: "Rap",
      image: "assets/images/Rectangle2.png",
      description: "Olivia Rodrigo",
    ),
    MusicCardModel(
      title: "Rap",
      image: "assets/images/Rectangle2.png",
      description: "Olivia Rodrigo",
    ),
    MusicCardModel(
      title: "Rap",
      image: "assets/images/Rectangle2.png",
      description: "Olivia Rodrigo",
    ),
    MusicCardModel(
      title: "Rap",
      image: "assets/images/Rectangle2.png",
      description: "Olivia Rodrigo",
    ),
    MusicCardModel(
      title: "Rap",
      image: "assets/images/Rectangle2.png",
      description: "Olivia Rodrigo",
    ),
    MusicCardModel(
      title: "Rap",
      image: "assets/images/Rectangle2.png",
      description: "Olivia Rodrigo",
    ),
    MusicCardModel(
      title: "Rap",
      image: "assets/images/Rectangle2.png",
      description: "Olivia Rodrigo",
    ),
    MusicCardModel(
      title: "Rap",
      image: "assets/images/Rectangle2.png",
      description: "Olivia Rodrigo",
    ),
    MusicCardModel(
      title: "Rap",
      image: "assets/images/Rectangle2.png",
      description: "Olivia Rodrigo",
    ),
    MusicCardModel(
      title: "Rap",
      image: "assets/images/Rectangle2.png",
      description: "Olivia Rodrigo",
    ),
    MusicCardModel(
      title: "Rap",
      image: "assets/images/Rectangle2.png",
      description: "Olivia Rodrigo",
    ),
    MusicCardModel(
      title: "Rap",
      image: "assets/images/Rectangle2.png",
      description: "Olivia Rodrigo",
    ),
    MusicCardModel(
      title: "Rap",
      image: "assets/images/Rectangle2.png",
      description: "Olivia Rodrigo",
    ),
    MusicCardModel(
      title: "Rap",
      image: "assets/images/Rectangle2.png",
      description: "Olivia Rodrigo",
    ),
    MusicCardModel(
      title: "Rap",
      image: "assets/images/Rectangle2.png",
      description: "Olivia Rodrigo",
    ),
    MusicCardModel(
      title: "Rap",
      image: "assets/images/Rectangle2.png",
      description: "Olivia Rodrigo",
    ),
    MusicCardModel(
      title: "Rap",
      image: "assets/images/Rectangle2.png",
      description: "Olivia Rodrigo",
    ),
    MusicCardModel(
      title: "Rap",
      image: "assets/images/Rectangle2.png",
      description: "Olivia Rodrigo",
    ),
    MusicCardModel(
      title: "Rap",
      image: "assets/images/Rectangle2.png",
      description: "Olivia Rodrigo",
    ),
    MusicCardModel(
      title: "Rap",
      image: "assets/images/Rectangle2.png",
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
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 39, 29, 63),
            Color.fromARGB(255, 2, 2, 3),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true, // Content extends under the floating navbar
        body: SafeArea(
          child: Column(
            children: [
              // Wrap ListView in Expanded so it occupies available space correctly
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 12,
                  ),
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Your Library",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        // Right action buttons container
                        Row(
                          children: [
                            _buildCircularIconButton(
                              icon: Icons.search,
                              onTap: () {},
                            ),
                            const SizedBox(width: 10),
                            _buildCircularIconButton(
                              icon: Icons
                                  .add, // Changed duplicate search icon to add/plus icon
                              onTap: () {},
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    // Categories
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

                    const SizedBox(height: 30),

                    // Recent Text
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.history, // or Icons.scroll
                            color: Color.fromARGB(255, 219, 218, 218),
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Recent",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 219, 218, 218),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    Expanded(
                      child: SizedBox(
                        height: 580,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: musicTrending.length,
                            itemBuilder: (context, index) {
                              return MusicTrending(
                                musicCardModel: musicTrending[index], isSelected: false,
                              );
                            },
                          ),
                        ),
                      ),
                    ), // Bottom clearance for floating bar
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // helper icon button search and plus
  Widget _buildCircularIconButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF51485F), Color(0xFF302B38)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFF625A6D), width: 0.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(child: Icon(icon, color: Colors.white, size: 18)),
      ),
    );
  }

  // Helper Widget
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
