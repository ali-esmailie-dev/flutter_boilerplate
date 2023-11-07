import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/widgets/circular_reveal_animation/circular_reveal_clipper.dart';

class CircularRevealAnimation extends StatelessWidget {
  /// Creates [CircularRevealAnimation] with given params.
  /// For open animation [animation] should run forward:
  /// [AnimationController.forward].
  /// For close animation [animation] should run reverse:
  /// [AnimationController.reverse].
  ///
  /// [centerOffset] center of circular reveal. Child's center if not specified.
  /// [centerAlignment] or [centerOffset] must be null (or both).
  ///
  /// [minRadius] minimum radius of circular reveal. 0 if not if not specified.
  /// [maxRadius] maximum radius of circular reveal.
  /// Distance from center to further child's corner if not specified.
  const CircularRevealAnimation({
    super.key,
    required this.child,
    required this.animation,
    this.centerAlignment,
    this.centerOffset,
    this.minRadius,
    this.maxRadius,
  }) : assert(centerAlignment == null || centerOffset == null);
  final Alignment? centerAlignment;
  final Offset? centerOffset;
  final double? minRadius;
  final double? maxRadius;
  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(final BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (final BuildContext context, final Widget? child) {
        return ClipPath(
          clipper: CircularRevealClipper(
            fraction: animation.value,
            centerAlignment: centerAlignment,
            centerOffset: centerOffset,
            minRadius: minRadius,
            maxRadius: maxRadius,
          ),
          child: child,
        );
      },
      child: child,
    );
  }
}
