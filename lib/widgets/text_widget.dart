import 'package:flutter/material.dart';
import 'package:pagepals/helpers/space_helper.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    this.length,
    this.fontSize,
    this.fontWeight,
    this.overflow,
    this.content,
    this.maxLines,
    this.softWrap,
    this.height,
  });

  final double? length;
  final double? height;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final String? content;
  final int? maxLines;
  final bool? softWrap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: length ?? 200.0,
      height: height ?? 50.0,
      child: Text(
        content ?? '',
        style: TextStyle(
          fontSize: fontSize ?? SpaceHelper.space16,
          fontWeight: fontWeight ?? FontWeight.normal,
        ),
        overflow: overflow ?? TextOverflow.visible,
        maxLines: maxLines ?? 1,
        softWrap: softWrap ?? true,
      ),
    );
  }
}
