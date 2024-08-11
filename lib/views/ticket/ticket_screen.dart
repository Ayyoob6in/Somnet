import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:somenet/utils/constants/colors/colors.dart';

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: AppBar(
        backgroundColor: sWhite,
        title: Text(
          "Buy Bundle",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18.sp, // Responsive font size
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: 6, // Number of tickets
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Card(
                  color: sWhite,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              index % 2 == 0 ? "Slow internet" : "4G",
                              style: TextStyle(
                                color: colorblue,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 4.0,
                              ),
                              decoration: BoxDecoration(
                                color: textfieldfilled,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                index % 2 == 0 ? "New" : "Requires Reply",
                                style: TextStyle(
                                  color: Colors.green.shade500,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          "17-05-2021 20:52",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 16,
            left: MediaQuery.of(context).size.width / 2 -
                28, // Adjusting to center the button
            child: FloatingActionButton(
              shape: const CircleBorder(),
              onPressed: () {
                // Handle the button press
              },
              backgroundColor: colorblue,
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
