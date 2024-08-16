import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:somenet/utils/constants/colors/colors.dart';

class RatingForm extends StatefulWidget {
  const RatingForm({super.key});

  @override
  RatingFormState createState() => RatingFormState();
}

class RatingFormState extends State<RatingForm> {
  String? selectedCity;
  String? selectedDistrict;
  String? selectedAgency;
  String? selectedService;
  int selectedRating = 4;
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.w),
      child: Container(
        height: 120.h,
        decoration: BoxDecoration(
          color: sWhite,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListView(
          padding: EdgeInsets.all(3.w),
          children: [
            buildLabel('City'),
            buildDropdownButtonFormField(
              hint: 'Select City',
              value: selectedCity,
              items: ['City 1', 'City 2', 'City 3'],
              onChanged: (value) {
                setState(() {
                  selectedCity = value;
                });
              },
            ),
            SizedBox(height: 2.h),
            buildLabel('District'),
            buildDropdownButtonFormField(
              hint: 'Select District',
              value: selectedDistrict,
              items: ['District 1', 'District 2', 'District 3'],
              onChanged: (value) {
                setState(() {
                  selectedDistrict = value;
                });
              },
            ),
            SizedBox(height: 2.h),
            buildLabel('Agency'),
            buildDropdownButtonFormField(
              hint: 'Select Agency',
              value: selectedAgency,
              items: ['Agency 1', 'Agency 2', 'Agency 3'],
              onChanged: (value) {
                setState(() {
                  selectedAgency = value;
                });
              },
            ),
            SizedBox(height: 2.h),
            buildLabel('Service'),
            buildDropdownButtonFormField(
              hint: 'Select Service',
              value: selectedService,
              items: ['Service 1', 'Service 2', 'Service 3'],
              onChanged: (value) {
                setState(() {
                  selectedService = value;
                });
              },
            ),
            SizedBox(height: 2.h),
            buildLabel('Rating'),
            Row(
              children: [
                Row(
                  children: List.generate(5, (index) {
                    return IconButton(
                      icon: Icon(
                        index < selectedRating ? Icons.star : Icons.star_border,
                        color: index < selectedRating
                            ? raringStarColor
                            : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          selectedRating = index + 1;
                        });
                      },
                    );
                  }),
                ),
                SizedBox(width: 2.w),
                Text(
                  selectedRating == 4
                      ? 'Very Good'
                      : selectedRating == 3
                          ? 'Good'
                          : selectedRating == 2
                              ? 'Average'
                              : selectedRating == 1
                                  ? 'Bad'
                                  : 'Awsome',
                  style: TextStyle(fontSize: 17.sp),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            buildLabel('Description'),
            TextFormField(
              controller: descriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Description',
                hintStyle: TextStyle(color: sGrey.withOpacity(0.7)),
                filled: true,
                fillColor: Colors.blue[50],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDropdownButtonFormField({
    required String hint,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.blue[50],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
      ),
      icon: const Icon(Icons.arrow_drop_down, color: Colors.blue),
      hint: Text(
        hint,
        style: TextStyle(color: sGrey.withOpacity(0.7)),
      ),
      items: items.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }

  Widget buildLabel(String label) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.w),
      child: Text(
        label,
        style: TextStyle(
          color: colorblue,
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
