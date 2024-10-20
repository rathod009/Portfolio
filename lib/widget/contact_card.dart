import 'package:flutter/material.dart';
import 'package:portfolio/configs/configs.dart';
import 'package:portfolio/provider/app_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher

class ContactCard extends StatefulWidget {
  final String? contactIcon;
  final String contactTitle;
  final String contactDescription;
  final IconData? contactIconData;

  const ContactCard({
    super.key,
    this.contactIcon,
    required this.contactTitle,
    required this.contactDescription,
    this.contactIconData,
  });

  @override
  _ContactCardState createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  bool _isHovered = false;

  void _onHover(bool isHovering) {
    setState(() {
      _isHovered = isHovering;
    });
  }

  // Function to launch URLs
  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Handle different actions based on contact title
  void _handleTap() {
    switch (widget.contactTitle.toLowerCase()) {
      case 'location':
        _launchUrl('https://www.google.com/maps/search/?api=1&query=anandgujarat');
        break;
      case 'mail':
        _launchUrl('mailto:bhumikrathod09@gmail.com');
        break;
      case 'phone':
        _launchUrl('tel:+917046392688');
        break;
      default:
        print('${widget.contactTitle} card clicked!');
    }
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: GestureDetector(
        onTap: _handleTap, // Use the new tap handler
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: Space.v,
          padding: EdgeInsets.fromLTRB(0, 20, 0, 24),
          height: AppDimensions.normalize(80),
          width: AppDimensions.normalize(80),
          decoration: BoxDecoration(
            color: _isHovered
                ? AppTheme.c!.primary!.withOpacity(0.04)
                : (appProvider.isDark ? Colors.grey[200] : Colors.white),
            borderRadius: BorderRadius.circular(200),
            boxShadow: [
              BoxShadow(
                color: AppTheme.c!.primary!.withAlpha(100),
                blurRadius: 16.0,
                offset: const Offset(0.0, 0.0),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.contactIcon != null)
                Image.asset(
                  widget.contactIcon!,
                  height: AppDimensions.normalize(20),
                ),
              if (widget.contactIconData != null)
                Icon(
                  widget.contactIconData,
                  color: AppTheme.c!.primary!,
                  size: AppDimensions.normalize(20),
                ),
              const SizedBox(height: 8.0),
              Text(
                widget.contactTitle,
                style: AppText.b2b?.copyWith(color: Colors.black),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8.0),
              Text(
                widget.contactDescription,
                textAlign: TextAlign.center,
                style: AppText.b2?.copyWith(
                  color: Colors.black,
                  fontSize: 12.0,
                ),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
