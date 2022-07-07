import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget? leading;
  final Widget? trailing;
  final Widget text;
  final VoidCallback onPressed;
  final bool outlined;
  final Color color;
  final double outlineWidth;

  const CustomButton({
    Key? key,
    this.leading,
    this.trailing,
    this.outlined = false,
    this.outlineWidth = 1,
    this.color = const Color(0XFF2D3436),
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: outlined? null: color,      
      borderRadius: BorderRadius.circular(25),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(25),
        child: IconTheme(
          data: IconThemeData(
            color: outlined? color: Colors.white,
            size: 10
          ),
          child: Container(
            decoration: BoxDecoration(
              border: !outlined? null: Border.all(
                width: outlineWidth,
                color: color,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            constraints: const BoxConstraints(
              minHeight: 24
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                if(leading != null) Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: leading!
                ),
                DefaultTextStyle(
                  style: TextStyle(
                    color: outlined? color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w700
                  ),
                  child: text
                ),
                if(trailing != null) Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: trailing!,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}