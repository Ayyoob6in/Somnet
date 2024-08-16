import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:somenet/controller/provider/home/home_provider.dart';
import 'package:somenet/utils/constants/colors/colors.dart';
import 'package:somenet/utils/constants/size/height.dart';
import 'package:somenet/utils/images/images.dart';
import 'package:somenet/views/home/widgets/appbar_widget.dart';
import 'package:somenet/views/home/widgets/quick_shortcut_widget.dart';
import 'package:somenet/views/home/widgets/user_info_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen size for responsiveness
    final screenWidth = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (context) => HomeState(),
      child: Scaffold(
        backgroundColor: appBackgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(10.sh),
          child: buildAppBar(context),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildTopUserInfoSection(screenWidth),
              _buildPromotionSlider(context),
              Padding(
                padding: const EdgeInsets.all(18),
                child: buildQuickShortcutSection(screenWidth, context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // AppBar Widget

  // Top User Info Section Widget

  // Balance and Recharge Widget

  // Promotion Slider Widget
  Widget _buildPromotionSlider(BuildContext context) {
    return Consumer<HomeState>(
      builder: (context, pageNotifier, child) {
        return Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              SizedBox(
                height: 147,
                child: PageView(
                  onPageChanged: (index) {
                    pageNotifier.setPage(index);
                  },
                  children: [
                    _buildPromotionPage(),
                    _buildPromotionPage(),
                  ],
                ),
              ),
              sh10,
              _buildDotIndicator(pageNotifier.currentPage),
            ],
          ),
        );
      },
    );
  }

  // Quick Shortcut Section Widget

  // Info Card Widget

  // Promotion Page Widget
  Widget _buildPromotionPage() {
    return Container(
      margin: EdgeInsets.only(right: 1.w),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          homescreenBanner,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  // Dot Indicator Widget
  Widget _buildDotIndicator(int currentPage) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        2,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentPage == index ? Colors.blue : Colors.grey.shade300,
          ),
        ),
      ),
    );
  }

  // Shortcut Card Widget
  // Widget _buildShortcutCard(String title, IconData icon, Function()? ontap) {
  //   return GestureDetector(
  //     onTap: ontap,
  //     child: Container(
  //       padding: const EdgeInsets.all(12),
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(16),
  //         boxShadow: const [
  //           BoxShadow(
  //             color: Colors.black12,
  //             blurRadius: 10,
  //             offset: Offset(0, 4),
  //           ),
  //         ],
  //       ),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         children: [
  //           Container(
  //               height: 40,
  //               width: 40,
  //               decoration: BoxDecoration(
  //                   gradient: const LinearGradient(
  //                     begin: Alignment.topCenter,
  //                     end: Alignment.bottomCenter,
  //                     colors: [
  //                       Color(0xFF279AD2), // #279AD2
  //                       Color(0xFF52BBE8), // #52BBE8
  //                     ],
  //                   ),
  //                   borderRadius: BorderRadius.circular(10)),
  //               child: Icon(icon, color: sWhite, size: 24)),
  //           const SizedBox(width: 8),
  //           Text(
  //             title,
  //             overflow: TextOverflow.fade,
  //             maxLines: 2,
  //             style: const TextStyle(
  //               fontSize: 12,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
