import 'package:flutter/material.dart';

class AnimatedAngryImage extends StatefulWidget {
  final String image;
  final double width;
  const AnimatedAngryImage({
    super.key,
    required this.image,
    required this.width,
  });

  @override
  State<AnimatedAngryImage> createState() => _AnimatedAngryImageState();
}

class _AnimatedAngryImageState extends State<AnimatedAngryImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    final Animation<double> curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutSine,
    );

    _animation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 40.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 40.0, end: -20.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -20.0, end: 7.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 7.0, end: -3.5), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -3.5, end: 1.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 1),
    ]).animate(curvedAnimation);

    _animation.addListener(() {
      if (_animation.status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (_animation.status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return Transform.rotate(
            angle: _animation.value * 0.0175433,
            child: Image.asset(
              widget.image,
              width: widget.width,
            ),
          );
        });
  }
}
