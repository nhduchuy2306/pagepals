import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pagepals/helpers/color_helper.dart';
import 'package:pagepals/helpers/space_helper.dart';
import 'package:pagepals/screens/dash_board/dash_board_screen.dart';

class ProfileOverviewScreen extends StatefulWidget {
  const ProfileOverviewScreen({super.key});

  @override
  State<ProfileOverviewScreen> createState() => _ProfileOverviewScreenState();
}

class _ProfileOverviewScreenState extends State<ProfileOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorHelper.getColor(ColorHelper.white),
          // backgroundColor: ColorHelper.getColor(ColorHelper.lightActive),
          // title: const Text(
          //   'Create account',
          //   style: TextStyle(
          //     color: Colors.black,
          //     fontSize: SpaceHelper.space24,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 0.0),
              child: IconButton(
                icon: const Icon(Icons.more_horiz_outlined),
                iconSize: 30,
                onPressed: () {
                  // Handle the first action
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: IconButton(
                icon: const Icon(Icons.favorite_border_outlined),
                iconSize: 30,
                onPressed: () {
                  // Handle the second action
                },
              ),
            ),
          ],
        ),
        backgroundColor: ColorHelper.getColor('#F2F2F2'),
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            controller: ScrollController(),
            // padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // width: double.infinity,
                  height: 200,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    // image: DecorationImage(
                    //   image: AssetImage('assets/your_image_file_name.png'), // Provide the correct path
                    //   fit: BoxFit.cover, // You can adjust the BoxFit based on your needs
                    // ),
                  ),
                ),
                Container(
                  height: 75,
                  decoration: BoxDecoration(
                      color: ColorHelper.getColor(ColorHelper.transparent)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              child: const DashBoardScreen(),
                              type: PageTransitionType.bottomToTop,
                              duration: const Duration(milliseconds: 200),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 25, right: 10),
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('assets/google.png'),
                                fit: BoxFit.fitHeight),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'User name',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Northern dialect Vietnamese',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: ColorHelper.getColor('#6C6C6C')),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: 230,
                  decoration: const BoxDecoration(color: Colors.white),
                  padding: const EdgeInsets.fromLTRB(25, 1, 25, 10),
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'My book collection',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'See All',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: ColorHelper.getColor(ColorHelper.green),
                                fontSize: 14,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 150,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                  margin: const EdgeInsets.only(right: 23),
                                  // Adjust the right margin as needed
                                  child: InkWell(
                                    onTap: () {},
                                    child: const Row(
                                      children: [
                                        SizedBox(
                                          height: 150,
                                          width: 100,
                                          child: Image(
                                            image: AssetImage(
                                                'assets/thobaymau.png'),
                                            fit: BoxFit.fitHeight,
                                          ),
                                        )
                                      ],
                                    ),
                                  ));
                            }),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 410,
                  decoration: const BoxDecoration(color: Colors.white),
                  padding: const EdgeInsets.fromLTRB(25, 1, 25, 10),
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.star_rounded,
                              color: ColorHelper.getColor('#FFA800'),
                              size: 23,
                            ),
                            Icon(
                              Icons.star_rounded,
                              color: ColorHelper.getColor('#FFA800'),
                              size: 23,
                            ),
                            Icon(
                              Icons.star_rounded,
                              color: ColorHelper.getColor('#FFA800'),
                              size: 23,
                            ),
                            Icon(
                              Icons.star_rounded,
                              color: ColorHelper.getColor('#FFA800'),
                              size: 23,
                            ),
                            Icon(
                              Icons.star_rounded,
                              color: ColorHelper.getColor('#FFA800'),
                              size: 23,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 5),
                              child: const Text(
                                '5.0',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 15),
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Reader communication level',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: SpaceHelper.fontSize14),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star_rounded,
                                color: ColorHelper.getColor('#FFA800'),
                                size: 16,
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 2),
                                child: const Text(
                                  '5.0',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Clear and easy to understand explanation',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: SpaceHelper.fontSize14),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star_rounded,
                                  color: ColorHelper.getColor('#FFA800'),
                                  size: 16,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 2),
                                  child: const Text(
                                    '5.0',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Service as described',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: SpaceHelper.fontSize14),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star_rounded,
                                  color: ColorHelper.getColor('#FFA800'),
                                  size: 16,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 2),
                                  child: const Text(
                                    '5.0',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '138 reviews',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'See All',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color:
                                      ColorHelper.getColor(ColorHelper.green),
                                  fontSize: 14,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                  width: 300,
                                  margin:
                                      const EdgeInsets.fromLTRB(2, 10, 25, 10),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 0,
                                    vertical: 15,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black45,
                                          blurRadius: 5,
                                          offset: Offset(0, 3),
                                        )
                                      ]),
                                  child: InkWell(
                                      onTap: () {},
                                      child: Stack(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                        right: 8,
                                                      ),
                                                      width: 35,
                                                      height: 35,
                                                      decoration:
                                                          const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'assets/google.png'),
                                                            fit: BoxFit
                                                                .fitHeight),
                                                      ),
                                                    ),
                                                    const Text(
                                                      'User name',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 16,
                                                      vertical: 3),
                                                  child: const Text(
                                                    'Giọng đọc hay, lôi cuốn, '
                                                    'nghe không biết chán, '
                                                    'đẹp trai, có múi, da ngăm'
                                                    ' giọng trầm đeo kính cận, lịch sự, '
                                                    'take care tốt khách hàng',
                                                    textAlign: TextAlign.start,
                                                    maxLines: 3,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      // wordSpacing: 1,
                                                      height: 2.2,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.bottomCenter,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      Icons.star_rounded,
                                                      color:
                                                          ColorHelper.getColor(
                                                              '#FFA800'),
                                                      size: 16,
                                                    ),
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              left: 2),
                                                      child: const Text(
                                                        '5.0',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 12),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const Text(
                                                  'January, 24',
                                                  style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      )));
                            }),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(40, 15, 40, 30),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.of(context).push(
                        //   PageTransition(
                        //     child: VerifyCodeScreen(email: _emailController.text),
                        //     type: PageTransitionType.rightToLeft,
                        //     duration: const Duration(milliseconds: 300),
                        //   ),
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor:
                            ColorHelper.getColor(ColorHelper.white),
                        backgroundColor:
                            ColorHelper.getColor(ColorHelper.green),
                        padding: const EdgeInsets.symmetric(
                          horizontal: SpaceHelper.space16,
                          vertical: 9,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Start Booking',
                        style: TextStyle(
                          fontSize: SpaceHelper.fontSize16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 230,
                  decoration: const BoxDecoration(color: Colors.white),
                  padding: const EdgeInsets.fromLTRB(25, 1, 25, 10),
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20, bottom: 10),
                        child: const Text(
                          'People also view',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 150,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                  margin: const EdgeInsets.only(right: 23),
                                  // Adjust the right margin as needed
                                  child: InkWell(
                                    onTap: () {},
                                    child: const Row(
                                      children: [
                                        SizedBox(
                                          height: 150,
                                          width: 100,
                                          child: Image(
                                            image: AssetImage(
                                                'assets/thobaymau.png'),
                                            fit: BoxFit.fitHeight,
                                          ),
                                        )
                                      ],
                                    ),
                                  ));
                            }),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
