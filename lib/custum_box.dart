import 'dart:math';

import 'package:customcontainerslider/data.dart';
import 'package:flutter/material.dart';

final cardAspectRatio = 12.0 / 22.0;
final mainAspectRatio = cardAspectRatio * 1.2;

// formula aspectRatio = width /height
class CustumBox extends StatelessWidget {
  final double pageIndex;
  List<Widget> boxList = [];
  final padding = 20.0;
  final virticalInset = 20.0;

  CustumBox(this.pageIndex);

  void addWidget(constraint) {
    final maxWidth = constraint.maxWidth;
    final maxheight = constraint.maxHeight;
    final safeWidth = maxWidth - 2 * padding;
    final safeHeight = maxheight - 2 * padding;
    final heightOfPrimaryCard = safeHeight;
    final widthOfprimeryCard = heightOfPrimaryCard * cardAspectRatio;
    final primaryCardLeft = safeWidth - widthOfprimeryCard;
    final horizontalInset = primaryCardLeft / 2;

    for (int i = 0; i < data.length; i++) {
      final delta = i - pageIndex;
      final isOnRight = delta > 0;

      final start = padding + max(primaryCardLeft - horizontalInset * -delta * (isOnRight ? 15 : 1), 0.0);

      final cardItem = Positioned.directional(
        top: padding + virticalInset * max(-delta, 0.0),
        bottom: padding + virticalInset * max(-delta, 0.0),
        start: start,
        textDirection: TextDirection.rtl,
        child: AspectRatio(
          aspectRatio: cardAspectRatio,
          child: Container(
            child: Image.asset(data[i],fit: BoxFit.cover,),
          ),
        ),
      );
      boxList.add(cardItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: mainAspectRatio,
      child: LayoutBuilder(
        builder: (ctx, constraint) {
          addWidget(constraint);
          return Stack(
            children: boxList,
          );
        },
      ),
    );
  }
}
