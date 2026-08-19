import 'package:flutter/material.dart';
import 'package:project_midterm/models/music_card_model.dart';

class MusicTrending extends StatefulWidget {
  final MusicCardModel musicCardModel;

  const MusicTrending({super.key, required this.musicCardModel});

  @override
  State<MusicTrending> createState() => _MusicTrendingState();
}

class _MusicTrendingState extends State<MusicTrending> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Album Artwork
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: widget.musicCardModel.image?.isEmpty ?? true
              ? Container(
                  width: 60,
                  height: 60,
                  color: const Color(0xFF51485F),
                  child: const Icon(Icons.music_note, color: Colors.white),
                )
              : Image.asset(
                  widget.musicCardModel.image!,
                  width: 60,
                  height: 60, 
                  fit: BoxFit.cover,
                ),
        ),

        const SizedBox(width: 14),

        // Song Title & Artist
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.musicCardModel.title ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 4),

              Text(
                widget.musicCardModel.description ?? '',
                style: const TextStyle(color: Colors.grey, fontSize: 13),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),

        const SizedBox(width: 10),

        // Play Button
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF232128),
            border: Border.all(color: Colors.white10, width: 1),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.play_arrow_rounded,
              color: Colors.white,
              size: 22,
            ),
            onPressed: () {
              // TODO: Play music
            },
          ),
        ),
      ],
    );
  }
}
