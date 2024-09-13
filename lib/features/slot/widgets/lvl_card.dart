import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils.dart';

class LvlCard extends StatelessWidget {
  const LvlCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20 + getStatusBar(context),
      right: 22,
      child: SvgPicture.asset('assets/slot/lvl.svg'),
    );
  }
}
