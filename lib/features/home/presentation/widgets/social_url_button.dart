import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialUrlButton extends StatelessWidget {
  const SocialUrlButton({
    super.key,
    required this.color,
    required this.svg,
    required this.url,
  });

  final String url;
  final String svg;
  final Color color;

  Future<void> _launchURL() async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'URL ochib bo‘lmadi: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: _launchURL,
        child: Container(
          width: 32.w,
          height: 32.h,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: SvgPicture.network(
              svg,
            ),
          ),
        ),
      ),
    );
  }
}
