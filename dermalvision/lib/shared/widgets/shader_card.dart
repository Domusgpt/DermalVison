import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ShaderCard extends StatefulWidget {
  const ShaderCard({super.key, required this.child, required this.shaderAsset});

  final Widget child;
  final String shaderAsset;

  @override
  State<ShaderCard> createState() => _ShaderCardState();
}

class _ShaderCardState extends State<ShaderCard> with SingleTickerProviderStateMixin {
  FragmentProgram? _program;
  late Ticker _ticker;
  double _time = 0.0;

  @override
  void initState() {
    super.initState();
    _loadShader();
    _ticker = createTicker((elapsed) {
      if (mounted) {
        setState(() {
          _time = elapsed.inMilliseconds / 1000.0;
        });
      }
    });
    _ticker.start();
  }

  Future<void> _loadShader() async {
    try {
      final program = await FragmentProgram.fromAsset(widget.shaderAsset);
      if (mounted) setState(() => _program = program);
    } catch (e) {
      debugPrint('Shader load error: $e');
    }
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_program == null) return widget.child;

    return CustomPaint(
      foregroundPainter: ShaderPainter(
        shader: _program!.fragmentShader(),
        time: _time,
      ),
      child: widget.child,
    );
  }
}

class ShaderPainter extends CustomPainter {
  ShaderPainter({required this.shader, required this.time});
  final FragmentShader shader;
  final double time;

  @override
  void paint(Canvas canvas, Size size) {
    shader.setFloat(0, time);
    shader.setFloat(1, size.width);
    shader.setFloat(2, size.height);

    final paint = Paint()..shader = shader;
    canvas.drawRect(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(covariant ShaderPainter oldDelegate) =>
      oldDelegate.time != time;
}
