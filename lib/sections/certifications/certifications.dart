import 'package:flutter/material.dart';
import 'package:portfolio/responsive/responsive.dart';
import 'package:portfolio/sections/certifications/certificate_desktop.dart';
import 'package:portfolio/sections/certifications/certificate_mobile.dart';

class Certificate extends StatelessWidget {
  const Certificate({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: CertificateMobileTab(),
      tablet: CertificateDesktop(),
      desktop: CertificateDesktop(),
    );
  }
}
