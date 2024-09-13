import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BonusButton extends StatelessWidget {
  const BonusButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {},
      padding: EdgeInsets.zero,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/gift.png',
              height: 42,
            ),
          ),
          SvgPicture.asset('assets/bonus_button.svg'),
        ],
      ),
    );
  }
}
