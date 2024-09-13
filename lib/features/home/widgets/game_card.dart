import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/router.dart';

class GameCard extends StatelessWidget {
  const GameCard({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380,
      width: 380,
      child: Stack(
        children: [
          Image.asset(
            'assets/$id.png',
            width: double.infinity,
          ),
          if (id == 3)
            Positioned(
              bottom: 14,
              right: 14,
              child: Image.asset(
                'assets/play3.png',
                height: 120,
              ),
            ),
          Positioned(
            bottom: 32,
            right: 32,
            child: CupertinoButton(
              onPressed: () {
                context.push(Routes.slot, extra: id);
              },
              padding: EdgeInsets.zero,
              child: SvgPicture.asset('assets/play$id.svg'),
            ),
          ),
        ],
      ),
    );
  }
}
