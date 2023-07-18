import 'package:flutter/material.dart';

class MyCircularProgressIndicator extends StatefulWidget {
  final double progressValue;

  const MyCircularProgressIndicator({super.key, required this.progressValue});

  @override
  _MyCircularProgressIndicatorState createState() =>
      _MyCircularProgressIndicatorState();
}

class _MyCircularProgressIndicatorState
    extends State<MyCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late double animatedValue = widget.progressValue;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween(begin: 0.0, end: widget.progressValue).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animation.addListener(() {
      setState(() {
        animatedValue = _animation.value;
      });
    });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: animatedValue ?? 0.0,
      backgroundColor: Colors.white,
      valueColor: const AlwaysStoppedAnimation<Color>(
        Color.fromRGBO(195, 244, 78, 1),
      ),
      strokeWidth: 17,
    );
  }
}
