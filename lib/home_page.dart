import 'package:flutter/material.dart';
import 'package:flutter_animation_tutorial/animated_builder_once_time_page.dart';
import 'package:flutter_animation_tutorial/animated_icon_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildAnimatedBuilderOnceTimeButton(context),
              _buildAnimatedIconButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedBuilderOnceTimeButton(BuildContext context) => Container(
        margin: const EdgeInsets.only(top: 20),
        child: OutlinedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (_) => const AnimatedBuilderOnceTimePage()),
            );
          },
          child: const Text('Animated builder once time'),
        ),
      );

  Widget _buildAnimatedIconButton(BuildContext context) => OutlinedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const AnimatedIconPage()),
          );
        },
        child: const Text('Animated icon'),
      );
}
