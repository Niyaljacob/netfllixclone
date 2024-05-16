import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  final _widgetList = [
    const _SmartDownloads(),
    Section2(),
    const Section3(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: "Downloads",
          ),
        ),
        body: ListView.separated(
          padding: EdgeInsets.all(10),
            itemBuilder: (ctx, index)=>_widgetList[index],
            separatorBuilder:(ctx, index)=>SizedBox(height: 25,) ,
            itemCount: _widgetList.length));
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});
  final List imageList = [
    "https://media.themoviedb.org/t/p/w220_and_h330_face/gxVcBc4VM0kAg9wX4HVg6KJHG46.jpg",
    "https://media.themoviedb.org/t/p/w220_and_h330_face/bXi6IQiQDHD00JFio5ZSZOeRSBh.jpg",
    "https://media.themoviedb.org/t/p/w220_and_h330_face/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          "Introducing Downloads for you",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kwhiteColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        kheight,
        const Text(
          "We will download a personalised selection of\nmovies and shows for you, so there's\nis always something to watch on your\ndevice",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        kheight,
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.4),
                  radius: size.width * 0.38,
                ),
              ),
              DownloadsImageWidget(
                imageList: imageList[0],
                margin: EdgeInsets.only(left: 175,top: 45 ),
                angle: 15,
                size: Size(size.width * 0.48, size.width * 0.58),
              ),
              DownloadsImageWidget(
                imageList: imageList[1],
                margin: EdgeInsets.only(right: 175,top: 45  ),
                angle: -15,
                size: Size(size.width * 0.48, size.width * 0.58),
              ),
              DownloadsImageWidget(
                imageList: imageList[2],
                radius: 10,
                margin: EdgeInsets.only(left: 0, bottom: 10,top: 25 ),
                size: Size(size.width * 0.59, size.width * 0.65),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kButtonColorBlue,
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Setup",
                style: TextStyle(
                    color: kwhiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        kheight,
        MaterialButton(
          color: kButtonColorWhite,
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "See what you can download",
              style: TextStyle(
                  color: kBlackcolor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kwidth,
        Icon(
          Icons.settings,
          color: Colors.white,
        ),
        kwidth,
        Text("Smat Downloads"),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    super.key,
    required this.imageList,
    this.angle = 0,
    required this.margin,
    required this.size,
    this.radius = 10,
  });
  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 100,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Container(
            width: size.width,
            height: size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageList),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
