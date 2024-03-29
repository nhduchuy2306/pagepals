import 'package:flutter/material.dart';
import 'package:pagepals/helpers/color_helper.dart';

class RequestScheduleWidget extends StatelessWidget {
  const RequestScheduleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 30),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          // width: 350,
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: const BorderRadius.all(Radius.circular(50))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Want a custom schedule?',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.black),
              ),
              InkWell(
                  onTap: () {},
                  child: Text(
                    'Request Schedule',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ColorHelper.getColor(ColorHelper.green)),
                  )),
            ],
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
