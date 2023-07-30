import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import 'package:ui_task/constant/constants.dart';

import '../constant/const_color.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5.0),
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 16,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
           CircleAvatar(
            radius: 18,
              backgroundImage : AssetImage(constImage.avatorImage)
          ),
          const SizedBox(width: 5,),

          Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  <Widget>[
          const Text(
          "안녕 나 응애",
            style: headingStyle,
          ),
                  const SizedBox(height: 3,),

                  Row(children:  [
                    const Text(
                      "165cm ",
                      style: smalltextStyle,
                    ),
                    Image.asset(
                      constImage.dotImage,
                      width: 2,
                      height: 2,
                    ),
                    const Text(
                      " 53kg",
                      style: smalltextStyle,
                    ),
                  ],),

                ],
            ),
          const SizedBox(width: 5,),
          Image.asset(
            constImage.expertImage,
            width: 14,
            height: 14,
          ),
          const SizedBox(width: 3,),
          const Text(
            "1일전",
            style: extrasmalltextStyle,
          ),
          const Spacer(),
          Container(
              decoration: const BoxDecoration(
                color: buttoncolor,
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: const Center(child:Padding(padding: EdgeInsets.only(left: 7.0,right: 7.0,top: 5.0,bottom: 5.0),
              child:
              Text(
                "팔로우",
                style: smalltextStyle1,
              )),)
          )
        ],
      ),
    );
  }
}
