import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectCard extends StatelessWidget {
  final String imagePath; // New parameter to accept image path

  const ProjectCard({Key? key, required this.imagePath})
      : super(key: key); // Constructor

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: Container(
        height: 130.h, // Increased height of the card
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image section (30% of the width)
            Flexible(
              flex: 3, // 30% of the width
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.r),
                  bottomLeft: Radius.circular(8.r),
                ),
                child: Image.asset(
                  imagePath, // Use the imagePath parameter
                  width: double.infinity, // Full width of the flexible widget
                  height: 130.h, // Set the height to match the card
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 8.w), // Space between image and text
            // Text and grade section (70% of the width)
            Flexible(
              flex: 7, // 70% of the width
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 12.h,
                    horizontal: 12.w), // Added more vertical padding here
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kemampuan Merangkum Tulisan',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'BAHASA SUNDA',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 1.h),
                        Text(
                          'Oleh Al-Baiqi Samaan',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    // Grade section at the bottom right with gradient background
                    Positioned(
                      bottom: 8.h,
                      right: 8.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 6.h),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.orange.shade700,
                              Colors.orange.shade300,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          'A',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
