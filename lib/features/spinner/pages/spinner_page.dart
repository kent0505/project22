import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/db/prefs.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../home/bloc/home_bloc.dart';
import '../../home/widgets/gems_card.dart';
import '../widgets/arrow_back_button.dart';
import '../widgets/spin_button.dart';
import '../widgets/spinner_gem.dart';

class SpinnerPage extends StatefulWidget {
  const SpinnerPage({super.key});

  @override
  State<SpinnerPage> createState() => _SpinnerPageState();
}

class _SpinnerPageState extends State<SpinnerPage> {
  double turns = 0.0;
  double angle = 0;

  bool canSpin = true;

  List<double> angles = [
    2, // 2
    3,
    14, // 3
    15, // 4
    8,
    16, // 3
    19, // 4
    13,
    20, // 3
    21, // 2
    18,
    24, // 2
    26, // 1
    23,
    29, // 2
  ];

  int getGems() {
    if (angle == 2) return 2;
    if (angle == 14) return 3;
    if (angle == 15) return 4;
    if (angle == 16) return 3;
    if (angle == 19) return 4;
    if (angle == 20) return 3;
    if (angle == 21) return 2;
    if (angle == 24) return 2;
    if (angle == 26) return 1;
    if (angle == 29) return 2;
    return 0;
  }

  void getRandom() {
    Random random = Random();
    int randomIndex = random.nextInt(angles.length);
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        angle = angles[randomIndex];
        logger(angle);
      });
    });
  }

  void onSpin() async {
    if (canSpin) {
      canSpin = false;
      setState(() {
        turns += 5 / 1;
      });
      getRandom();
      Future.delayed(const Duration(seconds: 7), () async {
        await saveInt(Prefs.gemsKEY, Prefs.gems + getGems()).then((_) {
          if (mounted) context.read<HomeBloc>().add(GetHomeEvent());
          canSpin = true;
          // showDialog(
          //   context: context,
          //   barrierDismissible: false,
          //   builder: (context) {
          //     return RewardDialog(
          //       title: 'Your winnings',
          //       reward: getCoins().toString(),
          //       asset: asset,
          //       onPressed: () async {
          //         await plusCoins(getCoins()).then((value) {
          //           context.read<RewardBloc>().add(GetCoinsEvent());
          //           context.pop();
          //         });
          //       },
          //     );
          //   },
          // );
        });
      });
    } else {
      logger('CANT SPIN');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(height: 4 + getStatusBar(context)),
                SvgPicture.asset('assets/spinner/title_card.svg'),
                const GemsCard(),
                const Spacer(),
                SizedBox(
                  // color: Colors.greenAccent,
                  height: 430,
                  width: 400,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: SvgPicture.asset('assets/spinner/spinner3.svg'),
                      ),
                      Center(
                        child: Transform.rotate(
                          angle: angle,
                          child: AnimatedRotation(
                            turns: turns,
                            curve: Curves.easeInOutCirc,
                            duration: const Duration(seconds: 6),
                            child: Stack(
                              children: [
                                SvgPicture.asset(
                                  'assets/spinner/spinner1.svg',
                                ),
                                const SpinnerGem(
                                  top: 68,
                                  left: 0,
                                  right: 0,
                                ),
                                const SpinnerGem(
                                  degree: 23,
                                  top: 78,
                                  right: 136,
                                ),
                                const SpinnerGem(
                                  degree: 71,
                                  top: 144,
                                  right: 70,
                                ),
                                const SpinnerGem(
                                  degree: 95,
                                  top: 192,
                                  right: 66,
                                ),
                                const SpinnerGem(
                                  degree: 142,
                                  top: 272,
                                  right: 112,
                                ),
                                const SpinnerGem(
                                  degree: 166,
                                  top: 292,
                                  right: 154,
                                ),
                                const SpinnerGem(
                                  degree: -145,
                                  top: 276,
                                  right: 246,
                                ),
                                const SpinnerGem(
                                  degree: -121,
                                  top: 242,
                                  right: 281,
                                ),
                                const SpinnerGem(
                                  degree: -72,
                                  top: 148,
                                  right: 290,
                                ),
                                const SpinnerGem(
                                  degree: -47,
                                  top: 105,
                                  right: 266,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        left: 0,
                        right: 0,
                        child: Image.asset(
                          'assets/spinner/spinner2.png',
                          height: 45,
                        ),
                      ),
                      Positioned(
                        top: 30,
                        left: 0,
                        right: 0,
                        child: SvgPicture.asset('assets/spinner/spinner2.svg'),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                SpinButton(onPressed: onSpin),
                const Spacer(),
              ],
            ),
          ),
          const ArrowBackButton(),
        ],
      ),
    );
  }
}
