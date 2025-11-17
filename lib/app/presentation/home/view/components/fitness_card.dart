import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget metricCard({
  required String title,
  required String value,
  required String icon,
  required double progress,
  required String goalText,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
    decoration: BoxDecoration(
      color: Get.theme.cardColor,
      borderRadius: BorderRadius.circular(22),
    ),
    child: Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "$title",
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                   //   color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "  $value",
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                     
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              LinearProgressIndicator(
                value: progress,
               // backgroundColor: Color.fromRGBO(196, 196, 196, 1),
               // color: Colors.black,
                minHeight: 16,
                borderRadius: BorderRadius.circular(100),
              ),

              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${value}",
                    style: GoogleFonts.nunito(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,

                    //  color: Colors.black,
                    ),
                  ),
                  Text(
                    goalText,
                    style: GoogleFonts.nunito(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,

                     // color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(width: 20),
        Image.asset(icon, color: Get.theme.canvasColor, height: 50),
      ],
    ),
  );
}
