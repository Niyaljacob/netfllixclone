import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index, this.image});
  final int index;
  final image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
              height: 200,
            ),
            Container(
              width: 130,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: kRadius10,
                  image:  DecorationImage(
                    fit: BoxFit.cover,
                      image: NetworkImage(
                          imageBase+image,)
                          ),
                          ),
            ),
          ],
        ),
        Positioned(
          top: 35,
          left: -10,
          child: BorderedText(
            strokeWidth: 10.0,
            strokeColor: kwhiteColor,
            child: Text(
              "${index + 1}",
              style: const TextStyle(
                  fontSize: 140,
                  color: kBlackcolor,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  decorationColor: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
