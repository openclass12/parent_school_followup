import 'package:flutter/material.dart';
import 'dart:async';

class Animation_lancement extends StatefulWidget {
  final Widget child;
  final int delay;
  const Animation_lancement({required this.child, required this.delay});

  @override
  State<Animation_lancement> createState() => _Animation_lancementState();
}

class _Animation_lancementState extends State<Animation_lancement>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animOffset;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    final curve =
        CurvedAnimation(parent: _controller, curve: Curves.decelerate);
    _animOffset = Tween<Offset>(
      begin: Offset(0.0, -0.75),
      end: Offset.zero,
    ).animate(curve);
    Timer(Duration(milliseconds: widget.delay), () {
      _controller.forward();
    });
  }

  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: SlideTransition(
        position: _animOffset,
        child: widget.child,
      ),
    );
  }
}
