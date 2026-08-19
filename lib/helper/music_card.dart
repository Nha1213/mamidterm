import 'package:flutter/material.dart';
import 'package:project_midterm/models/music_card_model.dart';

class MusicCard extends StatelessWidget {
  final MusicCardModel musicCardModel;
  const MusicCard({super.key, required this.musicCardModel});

  @override
  Widget build(BuildContext context) {
    final imagePath = musicCardModel.image;

    return Container(
      width: 150,
      // margin: const EdgeInsets.only(right: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Album
          Stack(
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF8D7BC4), Color(0xFF51485F)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  child: imagePath == null || imagePath.isEmpty
                      ? const Icon(
                          Icons.music_note,
                          color: Colors.white,
                          size: 48,
                        )
                      : Image.asset(
                          imagePath,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
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
            musicCardModel.title ?? '',
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
            musicCardModel.description ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Color(0xFF85828C), fontSize: 9),
          ),
        ],
      ),
    );
  }
}
