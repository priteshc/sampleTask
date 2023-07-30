
import 'package:flutter/material.dart';
import 'package:ui_task/constant/common.dart';

import 'common_widget/header_widget.dart';
import 'common_widget/info_widget.dart';
import 'constant/const_color.dart';
import 'constant/constants.dart';

class PostDetailsPage extends StatefulWidget {
  const PostDetailsPage({super.key});


  @override
  State<PostDetailsPage> createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends State<PostDetailsPage> {
  int _counter = 0;

  Widget appBarTitle = const Text(
    "자유톡",
    style: commonHeaderStyle,
  );

  List<String> chips=['#2023','#TODAYISMONDAY','#TOP','#POPS!','#WOW','#ROW'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: appBarTitle,
        backgroundColor: Colors.white,
        leading:IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            size: 24,
            color: kTextcolor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: <Widget>[
      Padding(padding: const EdgeInsets.only(right: 15.0),
        child:
        Image.asset(
          constImage.bellImage,
          width: 24,
          height: 24,
        )),
    ],
      ),
      bottomNavigationBar: bbottomWidget(),
      body: SafeArea(
          child: SingleChildScrollView(

          child: Column(
          children:  <Widget>[
            const HeaderWidget(),
            InfoWidget(chips: chips)
          ],
        )),
      ),
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}