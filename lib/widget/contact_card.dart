import 'package:flutter/material.dart';
import 'package:portfolio/configs/configs.dart';
import 'package:portfolio/provider/app_provider.dart';
import 'package:provider/provider.dart';

class ContactCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return Container(
      margin: Space.v,
      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      width: AppDimensions.normalize(100),
      decoration: BoxDecoration(
        color: appProvider.isDark ? Colors.grey[200] : Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppTheme.c!.primary!.withAlpha(100),
            blurRadius: 12.0,
            offset: const Offset(0.0, 0.0),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (contactIcon != null)
            Image.asset(
              contactIcon!,
              height: AppDimensions.normalize(30),
            ),
          if (contactIconData != null)
            Icon(
              contactIconData,
              color: AppTheme.c!.primary!,
              size: AppDimensions.normalize(30),
            ),
          SizedBox(height: 8.0),
          Text(
            contactTitle,
            style: AppText.b2b?.copyWith(color: Colors.black),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.0),
          Text(
            contactDescription,
            textAlign: TextAlign.center,
            style: AppText.b2?.copyWith(
              color: Colors.black,
              fontSize: 12.0,
            ),
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
