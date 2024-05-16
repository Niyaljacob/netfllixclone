import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/application/model/top_rated.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final Size size;
  final TopRated topRated;
  const ComingSoonWidget({
    super.key, required this.size, required this.topRated,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        const SizedBox(
          width: 50,
          height: 480,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "FEB",
                style: TextStyle(
                  fontSize: 16,
                  color: kGreycolor,
                ),
              ),
              Text(
                "11",
                style: TextStyle(
                  fontSize: 30,
                  letterSpacing: 4,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(imagePath: imageBase+topRated.imagePath,),
               Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width*0.6,
                    child: Text(topRated.title,style: const TextStyle(fontSize: 35,fontWeight: FontWeight.bold,letterSpacing: -5,overflow: TextOverflow.ellipsis,),maxLines: 1,)),
                  const Spacer(),
                  const Row(
                    children: [
                      CustomButtonWidget(
                        icon: Icons.notifications,
                        title: 'Remind me',
                        iconSize: 15,
                        textSize: 8,
                      ),
                      kwidth,
                      CustomButtonWidget(
                        icon: Icons.info,  
                        title: 'Info',
                        iconSize: 15,
                        textSize: 8,
                      ),
                      kwidth,
                    ],
                  ),
                ],
              ),
              kheight,
              Text("coming on ${topRated.releaseDate}"),
              kheight,
               Text(
                topRated.title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              kheight,
               Text(
                topRated.overview,
                style: const TextStyle(fontSize: 10,
                  color: kGreycolor,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

