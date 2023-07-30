
import 'package:flutter/material.dart';
import 'package:ui_task/constant/const_color.dart';

import 'constants.dart';




screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

screenHeight(BuildContext context) => MediaQuery.of(context).size.height;


Widget buildChip(String label) {
  return Chip(
    labelPadding: const EdgeInsets.all(2.0),
    label: Text(
      label,
      style: chiptextStyle,
    ),
    shape: const StadiumBorder(
        side: BorderSide(
          width: 1,
          color: chipBordercolor,
        )),
    backgroundColor: chipBackgroundcolor,
    elevation: 1.0,
    padding: const EdgeInsets.all(8.0),
  );
}
Widget buildLikecomment(String likecount, String msgcount, double size) {
  return Row(
    children: [
      buildLike(likecount, size),
      const SizedBox(width: 3,),
      Image.asset(
        constImage.replyImage,
        width: size,
        height: size,
      ),
      Text(
        msgcount,
        style: smalltextStyle,
      )

    ],
  );
}

Widget buildMore() {
  return  Image.asset(
    constImage.moreImage,
    width: 32,
    height: 32,
  );
}

Widget buildLike(String likecount, double size) {
  return Row(
    children: [
      Image.asset(
        constImage.likeImage,
        width: size,
        height: size,
      ),
      Text(
        likecount,
        style: smalltextStyle,
      ),

    ],
  );
}


Widget buildChatheader(String name,bool visiable) {
  return Row(
    children: [
       Text(
        name,
        style: headingStyle,
      ),
      visiable ?const SizedBox(width: 5,):SizedBox.shrink(),
      visiable ?Image.asset(
        constImage.expertImage,
        width: 14,
        height: 14,
      ):SizedBox.shrink(),
      const SizedBox(width: 3,),
      const Text(
        "1일전",
        style: extrasmalltextStyle,
      ),
      const Spacer(),
     buildMore(),
    ],
  );
}

Widget bbottomWidget() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
    const Divider(height: 1,color: chipBordercolor,),
      const SizedBox(height: 10,),

      Row(
      children: [
        const SizedBox(width: 10,),
        Image.asset(
          constImage.modeImage,
          width: 24,
          height: 24,
        ),
        const SizedBox(width: 10,),
        const Text(
          "댓글을 남겨주세요.",
          style: chattextStyle1,
        ),
        const Spacer(),
        const Text(
          "등록",
          style: chattextStyle1,
        ),
        const SizedBox(width: 10,),

      ],
    ),
      const SizedBox(height: 10,),

    ],);
}




