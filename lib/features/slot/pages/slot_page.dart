import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../home/widgets/coins_card.dart';
import '../../home/widgets/gems_card.dart';
import '../../home/widgets/music_button.dart';
import '../../home/widgets/rules_button.dart';
import '../../spinner/widgets/arrow_back_button.dart';
import '../../spinner/widgets/slot_widget.dart';
import '../widgets/add_time_card.dart';
import '../widgets/lvl_card.dart';
import '../widgets/restart_card.dart';
import '../widgets/spin_slot_button.dart';

class SlotPage extends StatefulWidget {
  const SlotPage({super.key, required this.id});

  final int id;

  @override
  State<SlotPage> createState() => _SlotPageState();
}

class _SlotPageState extends State<SlotPage> {
  // int seconds = 2;
  // int amount = 10;
  // double top = 0;
  // String asset = 'coin';
  // bool win = false;
  // bool active = true;

  // List<String> slotAssets = ['coin', 'slot1', 'slot2', 'slot3'];

  // bool getWinOrLoose() {
  //   Random random = Random();
  //   bool win = random.nextBool();
  //   print(win);
  //   return win;
  // }

  // void changeAsset() {
  //   Random random = Random();
  //   asset = slotAssets[random.nextInt(slotAssets.length)];
  // }

  // String getRandomAsset() {
  //   Random random = Random();
  //   return slotAssets[random.nextInt(slotAssets.length)];
  // }

  // void onChangeAmount(bool plus) {
  //   if (active == false) return;
  //   setState(() {
  //     if (plus) {
  //       if (amount <= 90) amount = amount + 10;
  //     } else {
  //       if (amount >= 20) amount = amount - 10;
  //     }
  //   });
  // }

  // void onSpin() async {
  //   if (active == false) return;
  //   active = false;
  //   win = getWinOrLoose();
  //   String topAsset1 = getRandomAsset();
  //   String topAsset2 = getRandomAsset();
  //   String topAsset3 = getRandomAsset();
  //   String topAsset4 = getRandomAsset();
  //   String bottomAsset1 = getRandomAsset();
  //   String bottomAsset2 = getRandomAsset();
  //   String bottomAsset3 = getRandomAsset();
  //   String bottomAsset4 = getRandomAsset();
  //   String midle1 = getRandomAsset();
  //   String midle2 = getRandomAsset();
  //   String midle3 = getRandomAsset();
  //   String midle4 = getRandomAsset();

  //   await minusCoins(amount).then((value) {
  //     setState(() {
  //       if (win) {
  //         changeAsset();
  //         childrens1.insert(0, SlotItem(asset: topAsset1));
  //         childrens1.insert(0, SlotItem(asset: asset));
  //         childrens1.insert(0, SlotItem(asset: bottomAsset1));
  //         childrens2.insert(0, SlotItem(asset: topAsset2));
  //         childrens2.insert(0, SlotItem(asset: asset));
  //         childrens2.insert(0, SlotItem(asset: bottomAsset2));
  //         childrens3.insert(0, SlotItem(asset: topAsset3));
  //         childrens3.insert(0, SlotItem(asset: asset));
  //         childrens3.insert(0, SlotItem(asset: bottomAsset3));
  //         childrens4.insert(0, SlotItem(asset: topAsset4));
  //         childrens4.insert(0, SlotItem(asset: asset));
  //         childrens4.insert(0, SlotItem(asset: bottomAsset4));
  //       } else {
  //         childrens1.insert(0, SlotItem(asset: topAsset1));
  //         childrens1.insert(0, SlotItem(asset: midle1));
  //         childrens1.insert(0, SlotItem(asset: bottomAsset1));
  //         childrens2.insert(0, SlotItem(asset: topAsset2));
  //         childrens2.insert(0, SlotItem(asset: midle2));
  //         childrens2.insert(0, SlotItem(asset: bottomAsset2));
  //         childrens3.insert(0, SlotItem(asset: topAsset3));
  //         childrens3.insert(0, SlotItem(asset: midle3));
  //         childrens3.insert(0, SlotItem(asset: bottomAsset3));
  //         childrens4.insert(0, SlotItem(asset: topAsset4));
  //         childrens4.insert(0, SlotItem(asset: midle4));
  //         childrens4.insert(0, SlotItem(asset: bottomAsset4));
  //       }
  //       print(asset);
  //       context.read<RewardBloc>().add(GetCoinsEvent());
  //       seconds = 2;
  //       top = top - 222 * 12;
  //     });
  //   });
  //   try {
  //     await Future.delayed(const Duration(milliseconds: 2500), () {
  //       if (win) {
  //         showDialog(
  //           context: context,
  //           barrierDismissible: false,
  //           builder: (context) {
  //             return RewardDialog(
  //               title: 'Your winnings',
  //               reward: (amount * 2).toString(),
  //               onPressed: () async {
  //                 await plusCoins(amount * 2).then((value) {
  //                   context.read<RewardBloc>().add(GetCoinsEvent());
  //                   context.pop();
  //                 });
  //               },
  //             );
  //           },
  //         );
  //       }
  //       setState(() {
  //         childrens1.shuffle();
  //         childrens2.shuffle();
  //         childrens3.shuffle();
  //         childrens4.shuffle();
  //         childrens1.removeLast();
  //         childrens1.removeLast();
  //         childrens1.removeLast();
  //         childrens1.removeLast();
  //         childrens1.removeLast();
  //         childrens1.removeLast();
  //         childrens2.removeLast();
  //         childrens2.removeLast();
  //         childrens2.removeLast();
  //         childrens2.removeLast();
  //         childrens2.removeLast();
  //         childrens2.removeLast();
  //         childrens3.removeLast();
  //         childrens3.removeLast();
  //         childrens3.removeLast();
  //         childrens3.removeLast();
  //         childrens3.removeLast();
  //         childrens3.removeLast();
  //         childrens4.removeLast();
  //         childrens4.removeLast();
  //         childrens4.removeLast();
  //         childrens4.removeLast();
  //         childrens4.removeLast();
  //         childrens4.removeLast();

  //         if (win) {
  //           childrens1.add(SlotItem(asset: bottomAsset1));
  //           childrens1.add(SlotItem(asset: asset));
  //           childrens1.add(SlotItem(asset: topAsset1));
  //           childrens2.add(SlotItem(asset: bottomAsset2));
  //           childrens2.add(SlotItem(asset: asset));
  //           childrens2.add(SlotItem(asset: topAsset2));
  //           childrens3.add(SlotItem(asset: bottomAsset3));
  //           childrens3.add(SlotItem(asset: asset));
  //           childrens3.add(SlotItem(asset: topAsset3));
  //           childrens4.add(SlotItem(asset: bottomAsset4));
  //           childrens4.add(SlotItem(asset: asset));
  //           childrens4.add(SlotItem(asset: topAsset4));
  //         } else {
  //           childrens1.add(SlotItem(asset: bottomAsset1));
  //           childrens1.add(SlotItem(asset: midle1));
  //           childrens1.add(SlotItem(asset: topAsset1));
  //           childrens2.add(SlotItem(asset: bottomAsset2));
  //           childrens2.add(SlotItem(asset: midle2));
  //           childrens2.add(SlotItem(asset: topAsset2));
  //           childrens3.add(SlotItem(asset: bottomAsset3));
  //           childrens3.add(SlotItem(asset: midle3));
  //           childrens3.add(SlotItem(asset: topAsset3));
  //           childrens4.add(SlotItem(asset: bottomAsset4));
  //           childrens4.add(SlotItem(asset: midle4));
  //           childrens4.add(SlotItem(asset: topAsset4));
  //         }
  //         top = 0;
  //         seconds = 0;
  //         active = true;
  //       });
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // List<Widget> childrens1 = [
  //   ...List.generate(9, (index) => const SlotItem(asset: 'coin')),
  //   ...List.generate(9, (index) => const SlotItem(asset: 'slot1')),
  //   ...List.generate(9, (index) => const SlotItem(asset: 'slot2')),
  //   ...List.generate(9, (index) => const SlotItem(asset: 'slot3')),
  // ];
  // List<Widget> childrens2 = [
  //   ...List.generate(9, (index) => const SlotItem(asset: 'coin')),
  //   ...List.generate(9, (index) => const SlotItem(asset: 'slot1')),
  //   ...List.generate(9, (index) => const SlotItem(asset: 'slot2')),
  //   ...List.generate(9, (index) => const SlotItem(asset: 'slot3')),
  // ];

  // List<Widget> childrens3 = [
  //   ...List.generate(9, (index) => const SlotItem(asset: 'coin')),
  //   ...List.generate(9, (index) => const SlotItem(asset: 'slot1')),
  //   ...List.generate(9, (index) => const SlotItem(asset: 'slot2')),
  //   ...List.generate(9, (index) => const SlotItem(asset: 'slot3')),
  // ];

  // List<Widget> childrens4 = [
  //   ...List.generate(9, (index) => const SlotItem(asset: 'coin')),
  //   ...List.generate(9, (index) => const SlotItem(asset: 'slot1')),
  //   ...List.generate(9, (index) => const SlotItem(asset: 'slot2')),
  //   ...List.generate(9, (index) => const SlotItem(asset: 'slot3')),
  // ];

  // @override
  // void initState() {
  //   super.initState();
  //   childrens1.shuffle();
  //   childrens2.shuffle();
  //   childrens3.shuffle();
  //   childrens4.shuffle();

  //   childrens1.shuffle();
  //   childrens2.shuffle();
  //   childrens3.shuffle();
  //   childrens4.shuffle();

  //   childrens1.shuffle();
  //   childrens2.shuffle();
  //   childrens3.shuffle();
  //   childrens4.shuffle();

  //   childrens1.shuffle();
  //   childrens2.shuffle();
  //   childrens3.shuffle();
  //   childrens4.shuffle();
  // }
  void onSpin() {}

  // @override
  // void initState() {
  //   super.initState();
  //   logger(widget.id);
  // }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      bg: widget.id + 1,
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(height: 20 + getStatusBar(context)),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CoinsCard(),
                    SizedBox(width: 10),
                    GemsCard(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/slot/timer.svg'),
                    const SizedBox(width: 10),
                    SvgPicture.asset('assets/slot/count.svg'),
                  ],
                ),
                SvgPicture.asset('assets/game_title${widget.id}.svg'),
                const Spacer(),
                const SlotWidget(),
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(width: 22),
                    const RulesButton(),
                    const Spacer(),
                    SpinSlotButton(
                      id: widget.id,
                      onPressed: onSpin,
                    ),
                    const Spacer(),
                    const MusicButton(),
                    const SizedBox(width: 22),
                  ],
                ),
                SizedBox(height: 10 + getBottom(context)),
              ],
            ),
          ),
          const ArrowBackButton(),
          const LvlCard(),
          const RestartCard(),
          const AddTimeCard(),
        ],
      ),
    );
  }
}
