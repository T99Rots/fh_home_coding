import 'dart:math';

import 'package:fh_home_coding/components/equally_divided_row.dart';
import 'package:fh_home_coding/components/expanding_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCard extends StatelessWidget {
  final Widget? leading;
  final String title;
  final List<Widget>? actions;
  final List<Widget> children;

  const CustomCard({
    Key? key,
    this.leading,
    this.actions,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 13,
          color: Color(0xff2D3436)
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 30,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        if(leading != null) Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: leading,
                        ),
                        Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600
                          ),
                        )
                      ],
                    ),
                    if(actions?.isNotEmpty ?? false) Row(
                      children: actions!.map<Widget>((child) => Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: child,
                      )).toList(),
                    )
                  ],
                ),
              ),
              ...children.map((child) => FractionallySizedBox(
                widthFactor: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: child,
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class CardRow extends StatelessWidget {
  final List<Widget>? leadingActions;
  final List<Widget>? trailingActions;
  final List<Widget> headerRowItems;
  final List<Widget>? info;

  const CardRow({
    Key? key,
    this.leadingActions,
    this.trailingActions,
    this.info,
    required this.headerRowItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xff03A9F1)
        ),
        borderRadius: BorderRadius.circular(15)
      ),
      child: ExpandingContainer(
        initiallyExpanded: true,
        builder: (context, toggleOpened, animation, expanded) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: EquallyDividedRow(
                    divisions: 5,
                    gap: 10,
                    children: headerRowItems.map((child) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: child,
                    )).toList(),
                  ),
                ),
              ),
              SizedBox(
                width: 30,
                height: 30,
                child: InkWell(
                  onTap: toggleOpened,
                  borderRadius: BorderRadius.circular(15),
                  child: RotationTransition(
                    turns: animation.drive(Tween(begin: 0, end: 0.5)),
                    child: const Icon(Icons.keyboard_arrow_down_rounded),
                  ),
                ),
              )
            ],
          );
        },
        child: Padding(
          padding: EdgeInsets.only(
            bottom: 10,
            top: info != null? 5: 0
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if(info != null) ...info!,
              if(leadingActions != null || trailingActions != null) Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                child: Row(
                  children: [
                    if(leadingActions != null) Row(
                      mainAxisSize: MainAxisSize.min,
                      children: leadingActions!.map((child) => Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: child,
                      )).toList(),
                    ),
                    if(trailingActions != null) Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: trailingActions!.map((child) => Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: child,
                        )).toList(),
                      ),
                    )
                  ]
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CardRowItem extends StatelessWidget {
  final Widget text;
  final Widget? leading;
  final VoidCallback? onCopy;

  const CardRowItem({
    Key? key,
    this.onCopy,
    this.leading,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 18,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if(leading != null) Padding(
            padding: const EdgeInsets.only(right: 5),
            child: leading,
          ),
          text,
          if(onCopy != null) Padding(
            padding: const EdgeInsets.only(left: 5),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: onCopy,
                child: SvgPicture.asset('assets/Copy.svg'),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CardInfoRow extends StatelessWidget {
  final Widget title;
  final Widget data;
  final VoidCallback? onCopy;

  const CardInfoRow({
    Key? key,
    this.onCopy,
    required this.title,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: EquallyDividedRow(
          divisions: 5,
          gap: 10,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: DefaultTextStyle(
                style: DefaultTextStyle.of(context).style.copyWith(
                  fontWeight: FontWeight.w700,
                ),
                child: title,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: CardRowItem(
                text: data,
                onCopy: onCopy,
              ),
            )
          ],
        ),
      ),
    );
  }
}