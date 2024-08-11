import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:somenet/controller/provider/createticket/create_ticket_prrovider.dart';
import 'package:somenet/utils/constants/colors/colors.dart';

class CreateTicketScreen extends StatelessWidget {
  const CreateTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CreateTicketProvider(),
      child: Scaffold(
        backgroundColor: appBackgroundColor,
        appBar: AppBar(
          backgroundColor: sWhite,
          title: Text(
            "Create New Ticket",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.spa),
          ),
        ),
        body: Center(
          child: Consumer<CreateTicketProvider>(
            builder: (context, provider, child) {
              return Container(
                padding: EdgeInsets.all(16.sp),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.sp),
                ),
                child: Column(
                  children: [
                    _buildTextField(
                      controller: provider.subjectController,
                      label: "Subject",
                      hintText: "Subject",
                    ),
                    SizedBox(height: 16.sp),
                    _buildTextField(
                      controller: provider.descriptionController,
                      label: "Description",
                      hintText: "Text here",
                      maxLines: 5,
                    ),
                    SizedBox(height: 16.sp),
                    _buildDropdown(
                      label: "Location",
                      value: provider.selectedLocation,
                      hint: "Select Location",
                      items: ['Location 1', 'Location 2', 'Location 3'],
                      onChanged: provider.updateLocation,
                    ),
                    SizedBox(height: 16.sp),
                    _buildDropdown(
                      label: "Services",
                      value: provider.selectedService,
                      hint: "Select Services",
                      items: ['Service 1', 'Service 2', 'Service 3'],
                      onChanged: provider.updateService,
                    ),
                    SizedBox(height: 32.sp),
                    ElevatedButton(
                      onPressed: provider.submitTicket,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorblue,
                        padding: EdgeInsets.symmetric(
                            vertical: 16.sp, horizontal: 35.w),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.sp),
                        ),
                      ),
                      child: const Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 16.sp),
                    OutlinedButton(
                      onPressed: provider.clearForm,
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: 16.sp, horizontal: 35.w),
                        side: BorderSide(color: colorblue),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.sp),
                        ),
                      ),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Color(0xFF42A5F5)),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: TextStyle(
              color: colorblue,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
            children: const [
              TextSpan(
                text: ' *',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.sp),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.blue[200]),
            filled: true,
            fillColor: textfieldfilled,
            contentPadding: EdgeInsets.all(16.sp),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.sp),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required String hint,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: TextStyle(
              color: colorblue,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
            children: const [
              TextSpan(
                text: ' *',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.sp),
        Container(
          padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 16.sp),
          decoration: BoxDecoration(
            color: textfieldfilled,
            borderRadius: BorderRadius.circular(8.sp),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              icon: Icon(
                Icons.arrow_drop_down,
                color: sBlue,
              ),
              hint: Text(hint, style: TextStyle(color: Colors.blue[200])),
              isExpanded: true,
              items: items.map((item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item, style: TextStyle(color: Colors.blue[300])),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
