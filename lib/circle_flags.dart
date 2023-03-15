library circle_flags;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// a rounded flag
class CircleFlag extends StatelessWidget {
  CircleFlag(
    this.countryCode, {
    Key? key,
    this.size = 48,
    this.isSquare = false,
    this.borderRadius = 0,
  })  : assetName = 'assets/svg/${countryCode.toLowerCase()}.svg',
        super(key: key);

  final String countryCode;
  final double size;
  final String assetName;
  final bool isSquare;

  ///  Border radius used when [isSquare] is true
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final svg = SvgPicture.asset(
      assetName,
      width: size,
      height: size,
      package: 'circle_flags',
      fit: BoxFit.fill,
    );

    if (isSquare) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: SizedBox(
          width: size * 140 / 100,
          height: size,
          child: svg,
        ),
      );
    }

    return ClipOval(
      child: svg,
    );
  }
}
