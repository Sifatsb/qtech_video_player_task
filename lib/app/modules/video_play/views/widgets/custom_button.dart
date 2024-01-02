import 'package:flutter/material.dart';
import 'package:qtech_video_player_task/app/data/constants/app_text_style.dart';

class CustomButton extends StatelessWidget {

  final String title;
  final IconData icon;

  const CustomButton({
    required this.title,
    required this.icon,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // width: 150,
        height: 62,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFE2E8F0)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: const Color(0xFF718096),),
            Text(title, style: AppTextStyle.textStyle12Weight500,),
          ],
        ),
      ),
    );
  }
}
