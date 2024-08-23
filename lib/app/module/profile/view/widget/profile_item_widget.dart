import 'package:donate_blood/app/utils/app_color.dart';
import 'package:flutter/material.dart';

class ProfileItemWidget extends StatelessWidget {
  final VoidCallback onPress;
  final String title;
  final IconData icon;
  const ProfileItemWidget({
    super.key,
    required this.onPress,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 60,
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 2,
          shadowColor: Colors.white70,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          children: [
            Container(
              // height: 40,
              // width: 40,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColor.redColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                title,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
          ],
        ),
      ),
    );
  }
}
