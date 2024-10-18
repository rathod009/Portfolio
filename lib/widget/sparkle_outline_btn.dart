import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:universal_html/html.dart' as html;
import 'package:portfolio/constants.dart';

class SparkleOutlinedButton extends StatefulWidget {
  const SparkleOutlinedButton({super.key});

  @override
  _SparkleOutlinedButtonState createState() => _SparkleOutlinedButtonState();
}

class _SparkleOutlinedButtonState extends State<SparkleOutlinedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.transparent, width: 1),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: ShaderMask(
                  shaderCallback: (bounds) {
                    return LinearGradient(
                      colors: const [
                        Colors.red,
                        Colors.blue,
                        Colors.green,
                        Colors.yellow,
                        Colors.pink,
                      ],
                      stops: const [
                        0.0,
                        0.4,
                        0.8,
                        1.2,
                        1.6,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      transform: GradientRotation(_controller.value * 2 * 3.14), // Rotate the gradient
                    ).createShader(bounds);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              Center(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8, horizontal: 110),
                    side: const BorderSide(color: Colors.transparent),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 16, // Increased text size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    kIsWeb
                        ? html.window.open(StaticUtils.resume, "pdf")
                        : openURL(StaticUtils.resume);
                  },
                  child: const Text(
                    "RESUME",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
