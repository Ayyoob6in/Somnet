import 'package:flutter/material.dart';
import 'package:somenet/utils/constants/colors/colors.dart';
import 'package:somenet/utils/images/images.dart';

class PackageCardNormalQuanciyePro extends StatelessWidget {
  final String data;
  final String subData;
  final String packageType;
  final String duration;
  final String price;
  final VoidCallback onTap;

  const PackageCardNormalQuanciyePro({
    super.key,
    required this.data,
    required this.packageType,
    required this.duration,
    required this.price,
    required this.onTap,
    required this.subData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Image.asset(
                    buybunldelistnormallogo,
                    height: 30,
                    width: 30,
                  ),
                  title: Text(
                    data,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: colorblue,
                    ),
                  ),
                  subtitle: Text(
                    subData,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: colorblue,
                    ),
                  ),
                  trailing: Text(
                    packageType,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                ),
                // Row(
                //   children: [
                //     Image.asset(buybunldelistnormallogo),
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       children: [
                //         Text(
                //           data,
                //           style: TextStyle(
                //             fontSize: 18,
                //             fontWeight: FontWeight.bold,
                //             color: colorblue,
                //           ),
                //         ),
                //         Text(
                //           subData,
                //           style: TextStyle(
                //             fontSize: 12,
                //             fontWeight: FontWeight.w600,
                //             color: colorblue,
                //           ),
                //         ),
                //       ],
                //     ),
                //     Spacer(),
                //     Text(
                //       packageType,
                //       style: TextStyle(
                //         fontSize: 12,
                //         fontWeight: FontWeight.w600,
                //         color: Colors.grey,
                //       ),
                //     ),
                //   ],
                // ),
                const Divider(
                  thickness: 0.5,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.schedule,
                          color: Colors.orange,
                          size: 16.0,
                        ),
                        SizedBox(width: 5),
                        Text(
                          duration,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: colorblue,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Icon(
                      Icons.arrow_forward,
                      color: colorblue,
                      size: 15,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
