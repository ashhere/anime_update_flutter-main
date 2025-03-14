import 'package:anime_world_tutorial/views/featured_animes.dart';
import 'package:flutter/material.dart';

import '/common/extensions/extensions.dart';
import '/common/utils/utils.dart';
import '/common/styles/paddings.dart';
import '/screens/home_screen.dart';
import '/widgets/seasonal_anime_view.dart';
import '/widgets/top_animes_list.dart';

class AnimesScreen extends StatefulWidget {
  const AnimesScreen({super.key});

  @override
  State<AnimesScreen> createState() => _AnimesScreenState();
}

class _AnimesScreenState extends State<AnimesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentSeason = getCurrentSeason().capitalize();
    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       Navigator.of(context).pushReplacementNamed(
        //         HomeScreen.routeName,
        //         arguments: 1,
        //       );
        //     },
        //     icon: const Icon(
        //       Icons.search,
        //     ),
        //   ),
        // ],
        title: Padding(
          padding: const EdgeInsets.only(left: 0, top: 05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 50,
                height: 50,
                child: Image.asset('assets/images/hi.png'),
              ),
              const Text(
                "",
                style: TextStyle(
                  color: Color.fromARGB(255, 134, 129, 129),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Color.fromARGB(255, 46, 44, 44),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Top Animes Slider
              const SizedBox(
                height: 300,
                child: TopAnimesList(),
              ),

              Padding(
                padding: Paddings.noBottomPadding,
                child: Column(
                  children: [
                    // Top Ranked animes
                    const SizedBox(
                      height: 350,
                      child: FeaturedAnimes(
                        rankingType: 'all',
                        label: 'Top Ranked',
                      ),
                    ),

                    // Top Popular Animes
                    const SizedBox(
                      height: 350,
                      child: FeaturedAnimes(
                        rankingType: 'bypopularity',
                        label: 'Top Popular',
                      ),
                    ),

                    // Top Movie Animes
                    const SizedBox(
                      height: 350,
                      child: FeaturedAnimes(
                        rankingType: 'movie',
                        label: 'Top Movie Animes',
                      ),
                    ),

                    // Top Upcoming Animes
                    const SizedBox(
                      height: 350,
                      child: FeaturedAnimes(
                        rankingType: 'upcoming',
                        label: 'Top Upcoming Animes',
                      ),
                    ),

                    // Top Movie Animes
                    SizedBox(
                      height: 350,
                      child: SeasonalAnimeView(
                        label: 'Top Animes this $currentSeason',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
