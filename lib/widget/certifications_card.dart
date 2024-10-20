import 'package:flutter/material.dart';
import 'package:portfolio/configs/configs.dart';
import 'package:portfolio/provider/app_provider.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class CertificateCard extends StatefulWidget {
  final String? certificate;
  final String certificateTitle;

  const CertificateCard({
    super.key,
    required this.certificateTitle,
    this.certificate,
  });

  @override
  CertificateCardState createState() => CertificateCardState();
}

class CertificateCardState extends State<CertificateCard> with SingleTickerProviderStateMixin {
  bool isFront = true; // Track whether the front side is showing
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isHover = false; // Track hover state for color change

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600), // Smoother flip animation
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut, // Smooth transition
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleCard() {
    if (isFront) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    setState(() {
      isFront = !isFront;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true), // Detect hover enter
      onExit: (_) => setState(() => isHover = false), // Detect hover exit
      child: GestureDetector(
        onTap: _toggleCard, // Handle card flip on tap
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final angle = _animation.value * pi; // Calculate rotation angle
            final isFrontSide = angle <= pi / 2; // Check if front side is visible

            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(angle),
              child: isFrontSide
                  ? _buildFrontCard(appProvider, width, height)
                  : Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(pi), // Rotate back side
                      child: _buildBackCard(appProvider, width, height),
                    ),
            );
          },
        ),
      ),
    );
  }

  // Front side with the certificate image
  Widget _buildFrontCard(AppProvider appProvider, double width, double height) {
    return Container(
      margin: Space.v,
      padding: Space.all(),
      width: AppDimensions.normalize(130),
      height: AppDimensions.normalize(88),
      decoration: BoxDecoration(
        color: appProvider.isDark ? Colors.grey[200] : Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: (isHover ? Colors.cyanAccent : AppTheme.c!.primary)!
                .withAlpha(100),
            blurRadius: 12.0,
            offset: const Offset(0.0, 0.0),
          ),
        ],
      ),
      child: FittedBox(
        fit: BoxFit.contain,
        child: widget.certificate != null
            ? Image.asset(
                widget.certificate!,
              )
            : Container(),
      ),
    );
  }

  // Back side with the certificate title
  Widget _buildBackCard(AppProvider appProvider, double width, double height) {
    return Container(
      margin: Space.v,
      padding: Space.all(),
      width: AppDimensions.normalize(130),
      height: AppDimensions.normalize(88),
      decoration: BoxDecoration(
        color: appProvider.isDark ? Colors.grey[200] : Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: (isHover ? Colors.cyanAccent : AppTheme.c!.primary)!
                .withAlpha(100),
            blurRadius: 12.0,
            offset: const Offset(0.0, 0.0),
          ),
        ],
      ),
      child: Center(
        child: Text(
          widget.certificateTitle,
          style: AppText.b2b,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
