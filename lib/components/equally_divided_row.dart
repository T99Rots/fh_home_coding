import 'dart:math';
import 'package:flutter/material.dart';

class EquallyDividedRow extends StatelessWidget {
  final int divisions;
  final List<Widget> children;
  final double gap;

  const EquallyDividedRow({
    Key? key,
    this.gap = 0,
    required this.divisions,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final childWidth = ((constraints.maxWidth - (gap * (divisions - 1))) / divisions);
        final List<Widget> widgets = [];

        for(int i = 0; i < min(children.length, divisions); i++) {
          final child = SizedBox(
            width: childWidth,
            child: children[i]
          );

          if(children.length - 1 > i) {
            widgets.add(Padding(
              padding: EdgeInsets.only(right: gap),
              child: child,
            ));
          } else {
            widgets.add(child);
          }
        }

        return Row(
          children: widgets,
        );
      },
    );
  }
}