import 'package:flutter/widgets.dart';

extension LoadingAnimationControllerX on AnimationController {
  T eval<T>(Tween<T> tween, {Curve curve = Curves.linear}) =>
      tween.transform(curve.transform(value));

  double evalDouble({
    double from = 0,
    double to = 1,
    double begin = 0,
    double end = 1,
    Curve curve = Curves.linear,
  }) {
    return eval(
      Tween<double>(begin: from, end: to),
      curve: Interval(begin, end, curve: curve),
    );
  }
}

class DrawDot extends StatelessWidget {
  final double width;
  final double height;
  final bool circular;
  final Color color;

  const DrawDot.circular({
    super.key,
    required double dotSize,
    required this.color,
  })  : width = dotSize,
        height = dotSize,
        circular = true;

  const DrawDot.elliptical({
    super.key,
    required this.width,
    required this.height,
    required this.color,
  }) : circular = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        shape: circular ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: circular
            ? null
            : BorderRadius.all(Radius.elliptical(width, height)),
      ),
    );
  }
}

class BuildDot extends StatelessWidget {
  final Color color;
  final double angle;
  final double size;
  final Interval interval;
  final AnimationController controller;
  final bool first;
  const BuildDot.first({
    super.key,
    required this.color,
    required this.angle,
    required this.size,
    required this.interval,
    required this.controller,
  }) : first = true;

  const BuildDot.second({
    super.key,
    required this.color,
    required this.angle,
    required this.size,
    required this.interval,
    required this.controller,
  }) : first = false;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: Transform.translate(
        offset: Offset(0, -size / 2.4),
        child: UnconstrainedBox(
          child: DrawDot.circular(
              color: color,
              dotSize: controller.eval(
                Tween<double>(
                  begin: first ? 0.0 : size / 6,
                  end: first ? size / 6 : 0.0,
                ),
                curve: interval,
              )),
        ),
      ),
    );
  }
}
