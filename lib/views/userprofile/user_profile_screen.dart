import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:somenet/controller/provider/userprofile/user_profile.dart';
import 'package:somenet/utils/constants/colors/colors.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  UserProfileScreenState createState() => UserProfileScreenState();
}

class UserProfileScreenState extends State<UserProfileScreen> {
  final TextEditingController _nameController =
      TextEditingController(text: 'Muhsin Vivacom');
  final TextEditingController _dobController =
      TextEditingController(text: '11-01-1991');
  final TextEditingController _evcController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // ignore: use_build_context_synchronously
      Provider.of<UserProfileProvider>(context, listen: false)
          .setProfileImage(File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: sWhite,
        title: Text(
          "My Profile",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18.sp, // Responsive font size
          ),
        ),
      ),
      backgroundColor: appBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.sp),
          child: Column(
            children: [
              Container(
                height: 95.h,
                padding: EdgeInsets.all(16.sp),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(
                              radius: 30.sp,
                              backgroundImage: context
                                          .watch<UserProfileProvider>()
                                          .profileImage !=
                                      null
                                  ? FileImage(context
                                      .watch<UserProfileProvider>()
                                      .profileImage!)
                                  : const NetworkImage(
                                          'https://via.placeholder.com/150')
                                      as ImageProvider,
                            ),
                            Positioned(
                              bottom: 0,
                              right: 8.sp,
                              child: CircleAvatar(
                                backgroundColor: colorblue,
                                radius: 16.sp,
                                child: Icon(Icons.edit,
                                    size: 16.sp, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16.sp),
                    _buildLabelText('Name'),
                    _buildTextField(_nameController, 'Name'),
                    SizedBox(height: 16.sp),
                    Row(
                      children: [
                        Expanded(child: _buildLabelText('Gender')),
                        SizedBox(width: 16.sp),
                        Expanded(child: _buildLabelText('Date of Birth')),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: _buildDropdown(),
                        ),
                        SizedBox(width: 16.sp),
                        Expanded(
                          child:
                              _buildTextField(_dobController, 'Date of Birth'),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.sp),
                    _buildLabelText('EVC Number'),
                    _buildTextField(_evcController, 'EVC Number'),
                    SizedBox(height: 16.sp),
                    _buildLabelText('Email'),
                    _buildTextField(_emailController, 'Email'),
                    SizedBox(height: 16.sp),
                    _buildLabelText('Address'),
                    _buildTextField(_addressController, 'Address'),
                    SizedBox(height: 25.sp),
                    ElevatedButton(
                      onPressed: () {
                        // Handle edit profile button press
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorblue,
                        padding: EdgeInsets.symmetric(vertical: 16.sp),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.sp),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Edit Profile',
                          style:
                              TextStyle(color: Colors.white, fontSize: 16.sp),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabelText(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.h),
      child: Text(
        text,
        style: TextStyle(
          color: colorblue,
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: textfieldfilled,
        contentPadding:
            EdgeInsets.symmetric(vertical: 16.sp, horizontal: 16.sp),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.sp),
          borderSide: BorderSide.none,
        ),
      ),
      style: TextStyle(
        color: Colors.black,
        fontSize: 16.sp,
      ),
    );
  }

  Widget _buildDropdown() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 16.sp),
      decoration: BoxDecoration(
        color: textfieldfilled,
        borderRadius: BorderRadius.circular(8.sp),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: context.watch<UserProfileProvider>().selectedGender,
          items: const [
            DropdownMenuItem(value: 'Male', child: Text('Male')),
            DropdownMenuItem(value: 'Female', child: Text('Female')),
          ],
          onChanged: (value) {
            Provider.of<UserProfileProvider>(context, listen: false)
                .setSelectedGender(value!);
          },
        ),
      ),
    );
  }
}
