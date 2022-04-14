import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedIconPage extends StatefulWidget {
  const AnimatedIconPage({Key? key}) : super(key: key);

  @override
  State<AnimatedIconPage> createState() => _AnimatedIconPageState();
}

class _AnimatedIconPageState extends State<AnimatedIconPage>
    with SingleTickerProviderStateMixin {
  bool _forward = false;

  static const _icons = [
    AnimatedIcons.add_event,
    AnimatedIcons.arrow_menu,
    AnimatedIcons.close_menu,
    AnimatedIcons.ellipsis_search,
    AnimatedIcons.event_add,
    AnimatedIcons.home_menu,
    AnimatedIcons.list_view,
    AnimatedIcons.menu_arrow,
    AnimatedIcons.menu_close,
    AnimatedIcons.menu_home,
    AnimatedIcons.pause_play,
    AnimatedIcons.play_pause,
    AnimatedIcons.search_ellipsis,
    AnimatedIcons.view_list,
  ];

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Animated icon')),
        body: GridView.builder(
          itemCount: _icons.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              child: AnimatedIcon(
                icon: _icons[index],
                progress: _controller,
                size: 60,
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_forward) {
              _controller.forward();
            } else {
              _controller.reverse();
            }
            _forward = !_forward;
          },
          child: const Icon(Icons.change_circle_outlined),
        ),
      );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
