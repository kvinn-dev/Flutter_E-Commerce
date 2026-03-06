import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app_new/src/widgets/BottomNavigationBar/centered_elasticIn_curve.dart';

class BackgroundCurvePainter extends CustomPainter {
  static const _radiusTop = 50.0;
  static const _radiusBottom = 30.0;
  static const _horizontalControlTop = 0.6;
  static const _horizontalControlBottom = 0.5;
  static const _pointControlTop = 0.35;
  static const _pointControlBottom = 0.85;
  static const _topY = -20.0;
  static const _topDistance = 0.0;
  static const _bottomDistance = 10.0;

  /// Seberapa dalam gundukan "menekan" saat animasi
  static const _pressDepth = 14.0;

  final double _x;
  final double _normalizedY;
  final Color _color;

  BackgroundCurvePainter(this._x, this._normalizedY, this._color);

  @override
  void paint(Canvas canvas, Size size) {
    // Tetap pakai norm untuk animasi horizontal
    final norm = LinearPointCurve(0.5, 2.0).transform(_normalizedY) / 5;

    // Radius tetap dinamis agar tidak merusak proporsi visual
    final radius = Tween<double>(
      begin: _radiusTop,
      end: _radiusBottom,
    ).transform(norm);

    final anchorControlOffset = Tween<double>(
      begin: radius * _horizontalControlTop,
      end: radius * _horizontalControlBottom,
    ).transform(LinearPointCurve(0.5, 0.75).transform(norm));

    final dipControlOffset = Tween<double>(
      begin: radius * _pointControlTop,
      end: radius * _pointControlBottom,
    ).transform(LinearPointCurve(0.5, 0.8).transform(norm));

    /// PRESS EFFECT
    /// Awal = 0
    /// Tengah = max
    /// Akhir = 0
    double y;

    final progress = _normalizedY.clamp(0.0, 1.0);

    // Kalau belum hampir selesai → tetap pendek
    if (progress < 0.9) {
      y = _topY + _pressDepth;
    } else {
      // 10% terakhir baru naik + bounce
      final t = (progress - 0.9) / 0.1;

      final elastic =
          math.pow(2.0, -10.0 * t) *
              math.sin((t - 0.075) * (2.0 * math.pi) / 0.3) +
          1.0;

      y = (_topY + _pressDepth) - (_pressDepth * elastic);
    }

    final dist = Tween<double>(
      begin: _topDistance,
      end: _bottomDistance,
    ).transform(LinearPointCurve(0.5, 0.0).transform(norm));

    final x0 = _x - dist / 2;
    final x1 = _x + dist / 2;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(x0 - radius, 0)
      ..cubicTo(
        x0 - radius + anchorControlOffset,
        0,
        x0 - dipControlOffset,
        y,
        x0,
        y,
      )
      ..lineTo(x1, y)
      ..cubicTo(
        x1 + dipControlOffset,
        y,
        x1 + radius - anchorControlOffset,
        0,
        x1 + radius,
        0,
      )
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);

    final paint = Paint()..color = _color;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(BackgroundCurvePainter oldPainter) {
    return _x != oldPainter._x ||
        _normalizedY != oldPainter._normalizedY ||
        _color != oldPainter._color;
  }
}
