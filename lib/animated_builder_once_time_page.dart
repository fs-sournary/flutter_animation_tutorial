import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_svg/svg.dart';

class AnimatedBuilderOnceTimePage extends StatefulWidget {
  const AnimatedBuilderOnceTimePage({Key? key}) : super(key: key);

  @override
  State<AnimatedBuilderOnceTimePage> createState() =>
      _AnimatedBuilderOnceTimePageState();
}

class _AnimatedBuilderOnceTimePageState
    extends State<AnimatedBuilderOnceTimePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _control;
  late Animation<double> _rotation;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _control = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _rotation = Tween<double>(begin: 0, end: 0.05 * math.pi).animate(_control);
    _scale = Tween<double>(begin: 1, end: 0.8).animate(_control);
  }

  @override
  void dispose() {
    _control.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated widget')),
      body: Center(
        child: InkWell(
          onTap: _repeatOnce,
          child: AnimatedBuilder(
            animation: _control,
            builder: (_, child) => Transform(
              transform:
                  Matrix4.rotationZ(_rotation.value).scaled(_scale.value),
              alignment: Alignment.center,
              child: SvgPicture.asset('images/ic_like.svg'),
            ),
          ),
        ),
      ),
    );
  }

  void _repeatOnce() async {
    await _control.forward();
    await _control.reverse();
  }
}
