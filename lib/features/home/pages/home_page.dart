import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../bloc/home_bloc.dart';
import '../widgets/bonus_button.dart';
import '../widgets/coins_card.dart';
import '../widgets/game_card.dart';
import '../widgets/game_title_card.dart';
import '../widgets/gems_card.dart';
import '../widgets/music_button.dart';
import '../widgets/page_indicator.dart';
import '../widgets/rules_button.dart';
import '../widgets/wheel_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = CarouselSliderController();

  int pageIndex = 0;

  void onPageChanged(int index, CarouselPageChangedReason reason) {
    setState(() {
      pageIndex = index;
    });
  }

  void onPageIndicator(int index) {
    controller.jumpToPage(index);
  }

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetHomeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          SizedBox(height: 20 + getStatusBar(context)),
          const SizedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(width: 22),
                BonusButton(),
                Spacer(),
                Column(
                  children: [
                    CoinsCard(),
                    SizedBox(height: 5),
                    GemsCard(),
                  ],
                ),
                Spacer(),
                WheelButton(),
                SizedBox(width: 22),
              ],
            ),
          ),
          Expanded(
            child: CarouselSlider(
              carouselController: controller,
              items: const [
                GameCard(id: 1),
                GameCard(id: 2),
                GameCard(id: 3),
              ],
              options: CarouselOptions(
                clipBehavior: Clip.none,
                enableInfiniteScroll: false,
                aspectRatio: 1,
                viewportFraction: getWidth(context) >= 500 ? 1.5 : 1,
                onPageChanged: onPageChanged,
              ),
            ),
          ),
          GameTitleCard(id: pageIndex + 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PageIndicator(
                id: 0,
                active: pageIndex == 0,
                onPressed: onPageIndicator,
              ),
              const SizedBox(width: 10),
              PageIndicator(
                id: 1,
                active: pageIndex == 1,
                onPressed: onPageIndicator,
              ),
              const SizedBox(width: 10),
              PageIndicator(
                id: 2,
                active: pageIndex == 2,
                onPressed: onPageIndicator,
              ),
            ],
          ),
          const SizedBox(height: 66),
          const Row(
            children: [
              SizedBox(width: 22),
              RulesButton(),
              Spacer(),
              MusicButton(),
              SizedBox(width: 22),
            ],
          ),
          SizedBox(height: 10 + getBottom(context)),
        ],
      ),
    );
  }
}
