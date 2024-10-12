import 'package:assignment/projectcard.dart';
import 'package:assignment/tabbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812), // Example design size
      builder: (context, child) {
        return MaterialApp(
          home: PortfolioPage(),
        );
      },
    );
  }
}

class PortfolioPage extends StatefulWidget {
  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  int _selectedTabIndex = 0; // Default selected index for the TabButton
  int _selectedBottomNavIndex =
      1; // Default selected index for BottomNavigationBar

  void _onTabTapped(int index) {
    setState(() {
      _selectedTabIndex = index; // Change only the selected tab index
    });
  }

  void _onBottomNavTapped(int index) {
    setState(() {
      _selectedBottomNavIndex =
          index; // Change only the selected bottom nav index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Portfolio',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Icon(Icons.shopping_bag,
              color: Color.fromRGBO(223, 85, 49, 1)), // Shopping bag icon
          SizedBox(width: 15.w),
          Icon(Icons.notifications,
              color: Color.fromRGBO(223, 85, 49, 1)), // Bell icon
          SizedBox(width: 15.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 8.h), // Reduced top margin
        child: Column(
          children: [
            // Tab bar for navigation
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TabButton(
                      title: 'Project',
                      isSelected: _selectedTabIndex == 0,
                      onTap: () => _onTabTapped(0)),
                  TabButton(
                      title: 'Saved',
                      isSelected: _selectedTabIndex == 1,
                      onTap: () => _onTabTapped(1)),
                  TabButton(
                      title: 'Shared',
                      isSelected: _selectedTabIndex == 2,
                      onTap: () => _onTabTapped(2)),
                  TabButton(
                      title: 'Achievement',
                      isSelected: _selectedTabIndex == 3,
                      onTap: () => _onTabTapped(3)),
                ],
              ),
            ),
            // Search Bar with right-aligned icon and curved orange border
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: TextField(
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                  suffixIcon:
                      Icon(Icons.search, color: Color.fromRGBO(223, 85, 49, 1)),
                  hintText: 'Search a project',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(223, 85, 49, 1), width: 2.w),
                  ),
                ),
              ),
            ),
            // Project List
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: 5, // Number of projects
                itemBuilder: (context, index) {
                  // List of image paths for each project
                  List<String> imagePaths = [
                    'lib/assets/trail.jpeg',
                    'lib/assets/man-working.webp',
                    'lib/assets/cropped-image-of-business-woman-hand-working-laptop-computer-in-home-office.webp',
                    'lib/assets/trail.jpeg',
                    'lib/assets/man-working.webp',
                  ];

                  return ProjectCard(
                      imagePath: imagePaths[index]); // Pass the image path
                },
              ),
            ),
            // Filter button with pill shape
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Container(
                height: 40.h,
                width: 120.w,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.filter_list),
                  label: Text('Filter'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(
                        223, 85, 49, 1), // Custom filter button color
                    foregroundColor: Colors.white,
                    shape: StadiumBorder(), // Pill shape button
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar with 4 items
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedBottomNavIndex,
        onTap: _onBottomNavTapped, // Use separate function for bottom nav
        selectedItemColor:
            Color.fromRGBO(223, 85, 49, 1), // Custom selected color
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.work), label: 'Portfolio'), // Suitcase icon
          BottomNavigationBarItem(icon: Icon(Icons.input), label: 'Input'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
