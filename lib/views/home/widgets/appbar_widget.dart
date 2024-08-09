import 'package:flutter/material.dart';
import 'package:somenet/utils/constants/colors/colors.dart';
import 'package:somenet/utils/constants/size/width.dart';
import 'package:somenet/utils/images/images.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: colorblue,
    automaticallyImplyLeading: false,
    flexibleSpace: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(
              profileimage,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Muhsin Vivacom',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  CircleAvatar(
                      radius: 8,
                      backgroundColor: sBlack.withOpacity(0.1),
                      child: Icon(
                        Icons.phone,
                        size: 10,
                        color: sWhite,
                      )),
                  sw10,
                  const Text(
                    '615 209444',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: sWhite, borderRadius: BorderRadius.circular(10)),
            child: IconButton(
              onPressed: () {
                // Handle message icon tap
              },
              icon: const Icon(Icons.message_outlined),
              color: colorblue,
            ),
          ),
        ],
      ),
    ),
  );
}
