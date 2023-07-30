import 'package:cached_network_image/cached_network_image.dart';
import 'package:comment_tree/data/comment.dart';
import 'package:comment_tree/widgets/comment_tree_widget.dart';
import 'package:comment_tree/widgets/tree_theme_data.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import 'package:ui_task/constant/constants.dart';

import '../constant/common.dart';
import '../constant/const_color.dart';

class InfoWidget extends StatefulWidget {
  const InfoWidget({super.key, required this.chips});

  final List<String> chips;

  @override
  State<InfoWidget> createState() => _InfoWidgetState();
}

class _InfoWidgetState extends State<InfoWidget> {
  int currentPage = 0;
  int _currentPage = 0;
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.all(5),
      height: 8,
      width: _currentPage == index ? 8 : 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? Colors.white : Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 16,
                ),
                child: Text(
                  constString.mainText,
                  style: headingStyle,
                )),
            const SizedBox(
              height: 5,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 16,
                ),
                child: Text(
                  constString.subText,
                  style: smalltextStyle1black,
                )),
            const SizedBox(
              height: 3,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 16,
                ),
                child: Wrap(
                  spacing: 6.0,
                  runSpacing: 6.0,
                  children: List.generate(widget.chips.length, (index) {
                    return buildChip(
                      widget.chips[index],
                    );
                  }),
                )),
            Stack(children: [
              SizedBox(
                  height: screenHeight(context) / 2,
                  width: screenWidth(context),
                  child: PageView.builder(
                      onPageChanged: (value) {
                        setState(() {
                          _currentPage = value;
                        });
                      },
                      controller: _pageController,
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => SizedBox(
                            width: screenWidth(context),
                            child: const Image(
                              image: CachedNetworkImageProvider(
                                  'https://wjddnjs754.cafe24.com/web/product/small/202303/5b9279582db2a92beb8db29fa1512ee9.jpg'),
                              fit: BoxFit
                                  .fitWidth, //fill type of image inside aspectRatio
                            ),
                          ))),
              Positioned(
                  bottom: 20,
                  left: 10,
                  right: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                      (index) => buildDot(index: index),
                    ),
                  )),
            ]),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 20),
                buildLikecomment('2','3',32),
                const SizedBox(width: 3,),
                Image.asset(
                  constImage.bookmarkImage,
                  width: 32,
                  height: 32,
                ),
                const SizedBox(width: 3,),
                buildMore()
            ],),
            const SizedBox(height: 10),

            const Divider(height: 1,color: chipBordercolor,),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: CommentTreeWidget<Comment, Comment>(
                Comment(
                    avatar: 'null',
                    userName: 'null',
                    content: constString.chatText),
                [
                  Comment(
                      avatar: 'null',
                      userName: 'null',
                      content: constString.chatText1),
                ],
                treeThemeData:
                    const TreeThemeData(lineColor: Colors.white, lineWidth: 0),
                avatarRoot: (context, data) => const PreferredSize(
                  preferredSize: Size.fromRadius(18),
                  child: CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  ),
                ),
                avatarChild: (context, data) => const PreferredSize(
                  preferredSize: Size.fromRadius(12),
                  child: CircleAvatar(
                    radius: 12,
                    backgroundImage: AssetImage('assets/images/avatar1.png'),
                  ),
                ),
                contentChild: (context, data) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding:
                            const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                           buildChatheader("ㅇㅅㅇ",false),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              '${data.content}',
                              style: chattextStyle1,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child:buildLike('5', 25),
                      )
                    ],
                  );
                },
                contentRoot: (context, data) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding:
                            const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildChatheader("안녕 나 응애",true),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              '${data.content}',
                              style: chattextStyle1,
                            ),
                          ],
                        ),
                      ),
                    Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: buildLikecomment('2','3',25)
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ));
  }
}
