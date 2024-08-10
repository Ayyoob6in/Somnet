import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:somenet/controller/provider/estatement/estatement_provider.dart';
import 'package:somenet/utils/constants/colors/colors.dart';
import 'package:somenet/views/widgets/custom_button_widget.dart';
import 'package:somenet/views/widgets/custom_heading_widget.dart';

class EStatementScreen extends StatelessWidget {
  const EStatementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appBackgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 11.h, left: 7.w),
              child: const CustomHeadingWidget("E - Statement"),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(5.w),
                child: Container(
                  padding: EdgeInsets.all(5.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.sp),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      buildDateSelector(context, "From Date", true),
                      SizedBox(height: 1.h),
                      Divider(color: Colors.grey[200]),
                      SizedBox(height: 1.h),
                      buildDateSelector(context, "To Date", false),
                      SizedBox(height: 1.h),
                    ],
                  ),
                ),
              ),
            ),
            customButton(
                context: context, onPress: () {}, text: "Submit Request")
          ],
        ));
  }

  Widget buildDateSelector(
      BuildContext context, String label, bool isFromDate) {
    final dateProvider = Provider.of<EstatementState>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 2.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(15.sp),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: buildDropdown(
                  value:
                      isFromDate ? dateProvider.fromDate : dateProvider.toDate,
                  onChanged: (String? newValue) {
                    if (isFromDate) {
                      dateProvider.setFromDate(newValue!);
                    } else {
                      dateProvider.setToDate(newValue!);
                    }
                  },
                  items: List.generate(31, (index) => "${index + 1}"),
                  context: context,
                ),
              ),
              customVerticalDivider(),
              Expanded(
                child: buildDropdown(
                  value: isFromDate
                      ? dateProvider.fromMonth
                      : dateProvider.toMonth,
                  onChanged: (String? newValue) {
                    if (isFromDate) {
                      dateProvider.setFromMonth(newValue!);
                    } else {
                      dateProvider.setToMonth(newValue!);
                    }
                  },
                  items: const [
                    'January',
                    'February',
                    'March',
                    'April',
                    'May',
                    'June',
                    'July',
                    'August',
                    'September',
                    'October',
                    'November',
                    'December'
                  ],
                  context: context,
                ),
              ),
              customVerticalDivider(),
              Expanded(
                child: buildDropdown(
                  value:
                      isFromDate ? dateProvider.fromYear : dateProvider.toYear,
                  onChanged: (String? newValue) {
                    if (isFromDate) {
                      dateProvider.setFromYear(newValue!);
                    } else {
                      dateProvider.setToYear(newValue!);
                    }
                  },
                  items: List.generate(30, (index) => "${2000 + index}"),
                  context: context,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildDropdown({
    required String value,
    required void Function(String?)? onChanged,
    required List<String> items,
    required BuildContext context,
  }) {
    return DropdownButton<String>(
      value: value,
      onChanged: onChanged,
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      dropdownColor: textfieldfilled,
      underline: const SizedBox(),
      icon: Icon(Icons.arrow_drop_down_sharp, color: sBlue),
      style: TextStyle(color: colorblue, fontSize: 15.sp),
      isExpanded: true,
    );
  }

  Widget customVerticalDivider() {
    return Container(
      width: 1, // Width of the divider
      height: 5.h, // Height of the divider
      color: sBlue, // Color of the divider
      margin: EdgeInsets.symmetric(horizontal: 2.w), // Add some spacing
    );
  }
}
