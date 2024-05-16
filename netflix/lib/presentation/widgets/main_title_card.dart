import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

import 'main_card.dart';
import 'main_title.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    super.key, required this.title, required this.movies,
  });
  final String title;
  final List movies;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         MainTitle(title: title),
       kheight,
       LimitedBox(
        maxHeight: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
            movies.length,
            (index)=> Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: MainCard(image: imageBase + movies[index].imagePath),
            ))
          ),
        ),
      ],
    );
  }
}