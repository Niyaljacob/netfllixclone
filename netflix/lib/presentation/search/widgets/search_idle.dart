import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix/application/model/popular.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/search/widgets/title.dart';

const imageUrl =
    'https://media.themoviedb.org/t/p/w250_and_h141_face/9wJO4MBzkqgUZemLTGEsgUbYyP6.jpg';

class SearchIdleWidget extends StatelessWidget {
  final List<Popular> popular;
  const SearchIdleWidget({Key? key, required this.popular}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Top Searches'),
        kheight,
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (ctx, index) => TopSearchItemTile(
              url: popular[index].imagePath,
              movieName: popular[index].title,
            ),
            separatorBuilder: (ctx, index) => kheight20,
            itemCount: popular.length,
          ),
        )
      ],
    );
  }
}



class TopSearchItemTile extends StatelessWidget {
  final String url;
  final String movieName;
  const TopSearchItemTile({super.key, required this.url, required this.movieName});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 65,
          decoration:  BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageBase+url),
            ),
          ),
        ),
         Expanded(
          child: Text(
            movieName,
            style: const TextStyle(
                color: kwhiteColor, fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ),
        const CircleAvatar(
          backgroundColor: kwhiteColor,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: kBlackcolor,
            radius: 23,
            child: Center(
              child: Icon(
                CupertinoIcons.play_fill,
                color: kwhiteColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
