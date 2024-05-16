import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix/application/controller/now_playing/now_playing.dart';
import 'package:netflix/application/controller/popular/popular.dart';
import 'package:netflix/application/controller/top_rated.dart/top_rated.dart';
import 'package:netflix/application/controller/upcoming/upcoming.dart';
import 'package:netflix/application/model/now_playing.dart';
import 'package:netflix/application/model/popular.dart';
import 'package:netflix/application/model/top_rated.dart';
import 'package:netflix/application/model/upcoming.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widget/backgroound_card.dart';
import 'package:netflix/presentation/widgets/main_title_card.dart';

import 'widget/number_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  List<TopRated>topRated=[];
  List<Popular>popular=[];
  List<Upcoming>upcoming=[];
  List<NowPlaying>newplaying=[];
  Future getAllMovies() async {
    topRated = await getTopRatedMovies();
    popular = await getAllPopular();
    upcoming = await getAllUpcoming();
    newplaying = await getAllNowPlaying();

    setState(() {});
  }

  @override
  void initState() {
    getAllMovies();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: scrollNotifier,
          builder: (BuildContext context, index, _) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection direction = notification.direction;
                if (direction == ScrollDirection.reverse) {
                  scrollNotifier.value = false;
                } else if (direction == ScrollDirection.forward) {
                  scrollNotifier.value = true;
                }
                return true;
              },
              child: Stack(
                children: [
                  ListView(
                    children:  [
                      const BackGroundCard(),
                      MainTitleCard(
                        movies: topRated,
                        title: "Released in the past year"),
                      kheight,
                      MainTitleCard(
                        movies: upcoming,
                        title: "Trending Now",
                      ),
                      kheight,
                      upcoming.isNotEmpty
                      ? NumberTitleCard(upcoming: newplaying)
                      : Container(),
                      kheight,
                      MainTitleCard(
                        movies: topRated,
                        title: "Tense Dramas",
                      ),
                      kheight,
                      MainTitleCard(
                        movies: popular,
                        title: "South Indian Cinema",
                      ),
                      kheight,
                    ],
                  ),
                  scrollNotifier.value == true
                      ? AnimatedContainer(
                        duration: const Duration(milliseconds: 1000),
                          width: double.infinity,
                          height: 80,
                          color: Colors.black.withOpacity(0.3),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.network(
                                    "https://upload.wikimedia.org/wikipedia/commons/f/ff/Netflix-new-icon.png",
                                    width: 55,
                                    height: 55,
                                  ),
                                  const Spacer(),
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
                                   decoration: const BoxDecoration(image: DecorationImage(image: NetworkImage('https://avatars.githubusercontent.com/u/17697213?v=4'))),

                                  ),
                                  kwidth,
                                ],
                              ),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("TV Shows", style: KHomeTitleText,),
                                  Text("Movies",style: KHomeTitleText,),
                                  Text("Categories",style: KHomeTitleText,),
                                ],
                              )
                            ],
                          ),
                        )
                      : kheight,
                ],
              ),
            );
          }),
    );
  }
}
