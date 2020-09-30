import 'package:flutter/material.dart';
import 'package:walktron/widgets/widgets.dart';

class AddDevicesView extends StatefulWidget {
  @override
  _AddDevicesViewState createState() => _AddDevicesViewState();
}

class _AddDevicesViewState extends State<AddDevicesView>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
    );
    _startAnimation();
  }

  void _startAnimation() {
    _controller.stop();
    _controller.reset();
    _controller.repeat(
      period: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onDoubleTap: () => _controller.reset(),
        child: SafeArea(
          child: CustomPaint(
            painter: SpritePainter(_controller),
            child: const SizedBox(
              height: 400,
              width: 400,
            ),
          ),
        ),
      ),
    );
  }
}
