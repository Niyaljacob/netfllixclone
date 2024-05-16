import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/custom_button_widget.dart';

class BackGroundCard extends StatelessWidget {
  const BackGroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 600,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover, image: NetworkImage(kMainImage))),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CustomButtonWidget(title: "My List",icon:  Icons.add),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: kwhiteColor,
                          ),
                          width: 110,
                          height: 50,
                          child: TextButton.icon(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(kwhiteColor),
                            ),
                            icon: const Icon(
                              Icons.play_arrow,
                              size: 25,
                              color: kBlackcolor,
                            ),
                            label: const Text(
                              "Play",
                              style: TextStyle(fontSize: 20, color: kBlackcolor),
                            ),
                          ),
                        ),
                        const CustomButtonWidget(icon: Icons.info, title: "Info"),
                      ],
                    ),
                  ),
                )
              ],
            );
  }
}