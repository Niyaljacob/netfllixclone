import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
         ),
        const Spacer(),
        const Icon(
          Icons.cast,
        color: Colors.white,
        size: 30,
        ),
        kwidth,
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(image: DecorationImage(image: NetworkImage('https://avatars.githubusercontent.com/u/17697213?v=4'))),
        ),
        kwidth,
      ],
    );
  }
}