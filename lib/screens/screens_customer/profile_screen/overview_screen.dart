import 'package:flutter/material.dart';
import 'package:pagepals/helpers/color_helper.dart';
import 'package:pagepals/models/book_model.dart';
import 'package:pagepals/models/reader_models/reader_profile_model.dart';
import 'package:pagepals/screens/screens_customer/home_screen/video_player/intro_video.dart';
import 'package:pagepals/screens/screens_customer/profile_screen/profile_widgets/book_collection.dart';
import 'package:pagepals/screens/screens_customer/profile_screen/profile_widgets/booking_button.dart';
import 'package:pagepals/screens/screens_customer/profile_screen/profile_widgets/info_line.dart';
import 'package:pagepals/screens/screens_customer/profile_screen/profile_widgets/review_widgets/review_widget.dart';
import 'package:pagepals/services/book_service.dart';
import 'package:pagepals/services/reader_service.dart';

class ProfileOverviewScreen extends StatefulWidget {
  final String readerId;

  const ProfileOverviewScreen({
    super.key,
    required this.readerId,
  });

  @override
  State<ProfileOverviewScreen> createState() => _ProfileOverviewScreenState();
}

class _ProfileOverviewScreenState extends State<ProfileOverviewScreen> {
  GlobalKey<IntroVideoState> mainIntroVideoKey = GlobalKey<IntroVideoState>();

  void pauseVideo() {
    final IntroVideoState? mainIntroVideoState = mainIntroVideoKey.currentState;
    if (mainIntroVideoState != null) {
      mainIntroVideoState.pauseVideo();
    }
  }

  // late String readerId;
  ReaderProfile? reader = ReaderProfile();
  List<BookModel> bookModels = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // readerId = widget.readerId;
    getReaderProfile(widget.readerId);
    getReaderBooks(widget.readerId);
  }

  @override
  void dispose() {
    pauseVideo(); // Call the pauseVideo method here
    super.dispose();
  }

  Future<void> getReaderProfile(String id) async {
    var result = await ReaderService.getReaderProfile(id);
    setState(() {
      reader = result;
    });
  }

  Future<void> getReaderBooks(String id) async {
    var result = await BookService.getReaderBooks(id);
    setState(() {
      bookModels = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    // List<Book> books = bookModels.map((e) => e.book!).toList();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorHelper.getColor(ColorHelper.white),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            // iconSize: 30,
            onPressed: () {
              pauseVideo();
              Navigator.of(context).pop();
            },
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 0.0),
              child: DropdownButton(
                icon: const Icon(Icons.more_vert_outlined),
                iconSize: 30,
                items: const [
                  DropdownMenuItem(
                    value: 'Main Page',
                    child: Text('Go to Main Page'),
                  ),
                  DropdownMenuItem(
                    value: 'Report',
                    child: Text('Report'),
                  ),
                ],
                onChanged: (value) {
                  if(value == 'Report') {
                    // Handle the first action
                  } else if(value == 'Main Page') {
                    Navigator.of(context).pop();
                  }
                },
                underline: Container(),
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
          physics: const AlwaysScrollableScrollPhysics(),
          controller: ScrollController(),
          // padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: reader?.profile == null
              ? SizedBox(
                  height: MediaQuery.of(context).size.height - 100,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IntroVideo(
                      key: mainIntroVideoKey,
                      videoUrl: reader!.profile!.introductionVideoUrl!,
                      width: MediaQuery.of(context).size.width,
                    ),
                    ProfileInfoLine(reader: reader, pauseVideo: pauseVideo),
                    ProfileBookCollection(books: bookModels.map((e) => e.book!).toList()),
                    ProfileReviewWidget(reader: reader),
                    ProfileBookingButton(
                      reader: reader,
                      pauseVideo: pauseVideo,
                      bookModels: bookModels,
                    ),
                    // const ProfileReaderCollection(),
                  ],
                ),
        ),
      ),
    );
  }
}
