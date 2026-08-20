import 'package:flutter/material.dart';
import 'package:project_midterm/models/music_card_model.dart';

class MusicTrending extends StatefulWidget {
  final MusicCardModel musicCardModel;
  final bool isSelected;
  const MusicTrending({
    super.key,
    required this.musicCardModel,
    required this.isSelected,
  });

  @override
  State<MusicTrending> createState() => _MusicTrendingState();
}

class _MusicTrendingState extends State<MusicTrending> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

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
                      width: 70,
                      height: 70,
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
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  widget.isSelected ? Icons.more_vert : Icons.play_arrow,
                  color: Colors.white,
                  size: 22,
                ),
                onPressed: () {
                  // TODO: Play music
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
