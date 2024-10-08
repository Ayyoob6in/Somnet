import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:somenet/utils/constants/colors/colors.dart';
import 'package:somenet/utils/images/images.dart';
import 'package:somenet/views/customersfeedback/customers_feed_back.dart';
import 'package:somenet/views/pinpuk/pin_puk_screen.dart';
import 'package:somenet/views/selfsupport/widgets/self_supportcard_widget.dart';
import 'package:somenet/views/ticket/ticket_screen.dart';
import 'package:somenet/views/widgets/custom_heading_widget.dart';

class SelfSupportScreen extends StatelessWidget {
  const SelfSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List title = ["PIN/PUK Code", "Customer Feedbacks", "Tickets"];
    final List icon = [selfsupportkey, customfeedbackIcon, ticketicon];
    final List ontap = [
      () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const PinPukScreen()));
      },
      () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const CustomersFeedBAckScreen()));
      },
      () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const TicketsScreen()));
      }
    ];
    return Scaffold(
        backgroundColor: appBackgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 7.h, left: 5.w),
              child: const CustomHeadingWidget("Self Support"),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: title.length,
                    padding: EdgeInsets.only(top: 2.h),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            EdgeInsets.only(left: 5.w, right: 5.w, top: 1.h),
                        child: selfSupportCard(
                            title[index], icon[index], ontap[index]),
                      );
                    }))
          ],
        ));
  }
}
