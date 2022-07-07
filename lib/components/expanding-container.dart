import 'package:flutter/material.dart';

class ExpandingContainer extends StatefulWidget {
  final Widget Function(BuildContext context, VoidCallback toggleOpened, Animation<double> animation) builder;
  final Widget child;

  const ExpandingContainer({
    Key? key,
    required this.builder,
    required this.child
  }) : super(key: key);

  @override
  State<ExpandingContainer> createState() => _ExpandingContainerState();
}

class _ExpandingContainerState extends State<ExpandingContainer> with TickerProviderStateMixin {
  bool _expanded = true;
  bool _contentVisible = false;
  late AnimationController controller;
  late Widget child;

  @override
  void initState() {
    child = widget.child;
    _contentVisible = _expanded;
    controller = AnimationController(vsync: this, value: _expanded? 1: 0);
    controller.addListener(() {
      final shouldBeVisible = controller.value > 0;
      if(_contentVisible != shouldBeVisible) {
        setState(() {
          _contentVisible = shouldBeVisible;
        });
      }
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ExpandingContainer oldWidget) {
    setState(() {
      child = widget.child;
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.builder(
          context,
          () {
            setState(() {
              _expanded = !_expanded;
              controller.animateTo(
                _expanded? 1: 0,
                duration: const Duration(milliseconds: 225),
                curve: Curves.easeOut
              );
            });
          },
          controller
        ),
        if(_contentVisible) AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return ClipRect(
              child: Align(
                alignment: Alignment.topCenter,
                heightFactor: controller.value,
                child: child,
              ),
            );
          },
          child: child
        )
      ],
    );
  }
}