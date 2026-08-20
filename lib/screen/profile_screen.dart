import 'package:flutter/material.dart';
import 'package:project_midterm/helper/music_card.dart';
import 'package:project_midterm/helper/music_tranding.dart';
import 'package:project_midterm/models/music_card_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
            Color.fromARGB(255, 80, 59, 130),
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
                    //
                    Container(
                      child: Column(
                        children: [
                          // Top Action Row (More icon button)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              // vertical: 10.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF51485F),
                                        Color(0xFF302B38),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    shape: BoxShape.circle,
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
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.more_vert,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 10),

                          // Profile Image with White Border
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 3.5,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: const CircleAvatar(
                              radius: 65,
                              backgroundImage: NetworkImage(
                                'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=400',
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          // User Name
                          const Text(
                            'Roeun Vathana',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),

                          const SizedBox(height: 6),

                          // Bio Text
                          const Text(
                            'Music is my therapy',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),

                          const SizedBox(height: 35),

                          // Stats Row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildStatItem('12', 'Playlists'),
                              _buildStatItem('980', 'Followers'),
                              _buildStatItem('120', 'Following'),
                            ],
                          ),
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
                            Icons.filter_list_rounded, // or Icons.scroll
                            color: Color.fromARGB(255, 219, 218, 218),
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Playlists",
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
                    //card music
                    Expanded(
                      child: SizedBox(
                        height: 310,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: musicTrending.length,
                            itemBuilder: (context, index) {
                              return MusicTrending(
                                musicCardModel: musicTrending[index],
                                isSelected: true,
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

  //// Helper Widget for Stats
  Widget _buildStatItem(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 13),
        ),
      ],
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
