import 'package:flutter/material.dart';
import 'package:kid_starter/src/styles/k_text_style.dart';

import '../../styles/b_style.dart';

class VideoCard extends StatelessWidget {
  final String name;
  final String time;
  final String thumbImage;
  final VoidCallback tap;

  const VideoCard({
    Key? key,
    required this.name,
    required this.time,
    required this.thumbImage,
    required this.tap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: SizedBox(
        height: 150,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                leading: Image.asset(thumbImage, width: 150, fit: BoxFit.cover),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    name,
                    style: KTextStyle.subtitle3.copyWith(color: KColor.orange),
                  ),
                ),
                subtitle: Text(
                  time,
                  style: KTextStyle.subtitle4
                      .copyWith(color: KColor.kPrimaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
