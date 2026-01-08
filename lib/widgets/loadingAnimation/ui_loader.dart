import 'package:flutter/material.dart';
import './animations/wavedots.dart';
import 'animations/flickr.dart';
import 'animations/horizontaldots.dart';
import 'animations/progressivedots.dart';
import 'animations/hexagon_dots.dart';

class UIProLoader {
  UIProLoader._();

  /// Three dots rotates in a horizontal plane. Required color is applied to all
  /// three dots.
  static Widget horizontalRotatingDots({
    required Color color,
    required double size,
    Key? key,
  }) {
    return HorizontalRotatingDots(
      color: color,
      size: size,
      key: key,
    );
  }

  /// Four dots in a row left most scales down and a new dot emerge from right.
  /// Required color is applied to four dots.
  static Widget progressiveDots({
    required Color color,
    required double size,
    Key? key,
  }) {
    return ProgressiveDots(
      color: color,
      size: size,
      key: key,
    );
  }

  /// Similar to flickr loading animation. Two disks swap positon and come back to initial.
  /// Required leftDotColor is applied to the left disk.
  /// Required rightDotColor is applied to the right disk.
  static Widget flickr({
    required Color leftDotColor,
    required Color rightDotColor,
    required double size,
    Key? key,
  }) {
    return Flickr(
      leftDotColor: leftDotColor,
      rightDotColor: rightDotColor,
      size: size,
      key: key,
    );
  }

  /// Six dots in each vertice of a gon emerge one by one then shrink to disappear while rotating
  /// Required color is applied to all dots.
  static Widget hexagonDots({
    required Color color,
    required double size,
    Key? key,
  }) {
    return HexagonDots(
      color: color,
      size: size,
      key: key,
    );
  }

  /// Three dots go up and down give wave effect. Required color is applied to
  /// all dots.
  static Widget waveDots({
    required Color color,
    required double size,
    Key? key,
  }) {
    return WaveDots(
      color: color,
      size: size,
      key: key,
    );
  }
}
