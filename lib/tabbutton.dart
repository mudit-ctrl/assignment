import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const TabButton({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: isSelected ? Color.fromRGBO(223, 85, 49, 1) : Colors.grey,
            ),
          ),
          // Underline for the selected tab
          Container(
            margin: EdgeInsets.only(top: 4.h),
            height: 2.h,
            width: 40.w, // You can adjust the width
            color: isSelected
                ? Color.fromRGBO(223, 85, 49, 1)
                : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
