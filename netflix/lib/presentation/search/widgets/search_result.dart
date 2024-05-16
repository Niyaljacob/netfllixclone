import 'package:flutter/material.dart';

import 'package:netflix/application/model/popular.dart';

import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/search/widgets/title.dart';


const imageUrl= "https://media.themoviedb.org/t/p/w220_and_h330_face/gxVcBc4VM0kAg9wX4HVg6KJHG46.jpg";
class SearchResultWidget extends StatelessWidget {
  final List<Popular> popular;
  const SearchResultWidget({Key? key, required this.popular}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Movies & TV'),
        kheight,
        Expanded(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1 / 1.4,
            children: List.generate(popular.length, (index) {
              return MainCard(image: popular[index].imagePath);
            }),
          ),
        )
      ],
    );
  }
}
class MainCard extends StatelessWidget {
  final String image;
  const MainCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image:  DecorationImage(
          image: NetworkImage(imageBase+image),
          fit: BoxFit.cover
        ),
        borderRadius: BorderRadius.circular(7),
      ),
    );
  }
}