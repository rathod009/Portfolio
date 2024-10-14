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
  bool isFront = true;  // This will toggle between front and back sides
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
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

    return GestureDetector(
      onTap: _toggleCard,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(_animation.value * pi),
            child: _animation.value < 0.5
                ? _buildFrontCard(appProvider, width, height)
                : Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(pi),
                    child: _buildBackCard(appProvider, width, height),
                  ),
          );
        },
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
            color: AppTheme.c!.primary!.withAlpha(100),
            blurRadius: 12.0,
            offset: const Offset(0.0, 0.0),
          )
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
            color: AppTheme.c!.primary!.withAlpha(100),
            blurRadius: 12.0,
            offset: const Offset(0.0, 0.0),
          )
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
