import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/application/model/upcoming.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

class EveryOnesWatchingWidget extends StatelessWidget {
  final Upcoming upcoming;
  const EveryOnesWatchingWidget({
    super.key, required this.upcoming,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        kheight,
         Text(
                upcoming.title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              kheight,
               Text(
                upcoming.overview,
                style: const TextStyle(
                  color: kGreycolor,
                ),
              ),
              kheight50,
              VideoWidget(imagePath: imageBase+upcoming.imagePath,),
              kheight,
              const Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButtonWidget(
                        icon: Icons.share,
                        title: 'Share',
                        iconSize: 25,
                        textSize: 16,
                      ),
                      kwidth,
                      CustomButtonWidget(
                        icon: Icons.add,
                        title: 'My List',
                        iconSize: 25,
                        textSize: 16,
                      ),
                      kwidth,
                      CustomButtonWidget(
                        icon: Icons.play_arrow,
                        title: 'Play',
                        iconSize: 25,
                        textSize: 16,
                      ),
                      kwidth,
                ],
              )
      ],
    );
  }
}

