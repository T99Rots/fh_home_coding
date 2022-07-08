import 'package:flutter/material.dart';

class ExpandingContainer extends StatefulWidget {
  final Widget Function(BuildContext context, VoidCallback toggleOpened, Animation<double> animation, bool expanded) builder;
  final Widget child;
  final bool initiallyExpanded;

  const ExpandingContainer({
    Key? key,
    this.initiallyExpanded = false,
    required this.builder,
    required this.child,
  }) : super(key: key);

  @override
  State<ExpandingContainer> createState() => _ExpandingContainerState();
}

class _ExpandingContainerState extends State<ExpandingContainer> with TickerProviderStateMixin {
  bool _expanded = true;
  bool _contentVisible = false;
  late AnimationController _controller;
  late Widget _child;

  @override
  void initState() {
    _expanded = widget.initiallyExpanded;
    _contentVisible = _expanded;
    _child = widget.child;
    _controller = AnimationController(vsync: this, value: _expanded? 1: 0);
    _controller.addListener(() {
      final shouldBeVisible = _controller.value > 0;
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
      _child = widget.child;
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
              _controller.animateTo(
                _expanded? 1: 0,
                duration: const Duration(milliseconds: 225),
                curve: Curves.easeOut
              );
            });
          },
          _controller,
          _expanded
        ),
        if(_contentVisible) AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return ClipRect(
              child: Align(
                alignment: Alignment.topCenter,
                heightFactor: _controller.value,
                child: child,
              ),
            );
          },
          child: _child
        )
      ],
    );
  }
}