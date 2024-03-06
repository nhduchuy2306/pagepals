import 'package:flutter/material.dart';
import 'package:pagepals/screens/order_screen/canceled_tab_widgets/cancel_bottom.dart';
import 'package:pagepals/screens/order_screen/completed_tab_widgets/complete_bottom.dart';
import 'package:pagepals/screens/order_screen/completed_tab_widgets/completed_leading.dart';

import '../upcoming_tab_widgets/upcoming_body.dart';

class CanceledTab extends StatelessWidget {
  const CanceledTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 25, 20, 10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border:
              Border.all(width: 0.3, color: Colors.black.withOpacity(0.4)),
              // boxShadow: [
              //   BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 3),
              // ],
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.2),
                  // spreadRadius: 2,
                  blurRadius: 3,
                  offset: const Offset(0, 5),
                )
              ],
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CompletedLeading(),
                UpcomingBody(),
                CanceledBottom(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}