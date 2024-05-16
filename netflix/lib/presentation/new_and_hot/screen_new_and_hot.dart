import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix/application/controller/top_rated.dart/top_rated.dart';
import 'package:netflix/application/controller/upcoming/upcoming.dart';
import 'package:netflix/application/model/top_rated.dart';
import 'package:netflix/application/model/upcoming.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix/presentation/new_and_hot/widgets/everyones_watching.dart';

class ScreenNewAndHot extends StatefulWidget {
  const ScreenNewAndHot({Key? key});

  @override
  State<ScreenNewAndHot> createState() => _ScreenNewAndHotState();
}

class _ScreenNewAndHotState extends State<ScreenNewAndHot> {
  List<TopRated> comingMovies = [];
  List<Upcoming> everyOne = [];

  Future getAllMovies() async {
    comingMovies = await getTopRatedMovies();
    everyOne = await getAllUpcoming();
    setState(() {});
  }

  @override
  void initState() {
    getAllMovies();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: AppBar(
              title: Row(
                children: [
                  const Text(
                    "New & Hot",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: kwhiteColor,
                    ),
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
                    decoration: const BoxDecoration(image: DecorationImage(image: NetworkImage('https://avatars.githubusercontent.com/u/17697213?v=4'))),

                  ),
                  kwidth,
                ],
              ),
              bottom: TabBar(
                labelColor: kBlackcolor,
                dividerColor: kBlackcolor,
                unselectedLabelColor: kwhiteColor,
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: kwhiteColor,
                  borderRadius: kRadius30,
                ),
                tabs: const [
                  Tab(
                    text: "🍿 Coming Soon",
                  ),
                  Tab(
                    text: "👀 Everyone's watching",
                  ),
                ],
              ),
            ),
          ),
          body: Padding(
            padding:const EdgeInsets.only(top: 8.0),
            child: TabBarView(children: [
              ComingSoon(
                comingMovies: comingMovies,
              ),
              EveryonesWatching(everyone: everyOne)
           ]),
)
          ),
    );
  }
}


// ignore: must_be_immutable
class ComingSoon extends StatelessWidget {
  ComingSoon({super.key, required this.comingMovies});
  List<TopRated> comingMovies = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
        itemCount: comingMovies.length,
        itemBuilder: (context, index) {
          return ComingSoonWidget(
            size: size,
            topRated: comingMovies[index],
          );
        });
  }
}

class EveryonesWatching extends StatelessWidget {
  const EveryonesWatching({super.key, required this.everyone});
  final List<Upcoming> everyone;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 30,
        itemBuilder: (BuildContext context, index) {
          return EveryOnesWatchingWidget(upcoming: everyone[index]);
        });
  }
}

