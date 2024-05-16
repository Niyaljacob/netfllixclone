import 'package:flutter/material.dart';
import 'package:netflix/application/model/now_playing.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widget/number_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  final List<NowPlaying>upcoming;
  const NumberTitleCard({
    super.key, required this.upcoming,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             MainTitle(title: "Top 10 TV Shows In India Today"),
           kheight,
           LimitedBox(
            maxHeight: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                upcoming.length < 10 ? upcoming.length : 10, 
                (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: NumberCard(index: index,image: upcoming[index].imagePath,),
              )),
            ),
           )
          ],
        );
  }
}
