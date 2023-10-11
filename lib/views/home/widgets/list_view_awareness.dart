import 'package:flutter/material.dart';

import '../../../config/screen_size.dart';
import '../../../utils/color_assets.dart';
import '../../../utils/font_style.dart';
import 'description_item.dart';
import 'list_awareness.dart';

class ListViewAwareness extends StatelessWidget {
  const ListViewAwareness({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) =>
                    DescriptionItem(nameImage: ListAwareness
                        .awarenessImage[index], title: ListAwareness.wordOfAwareness[index],
                      desc: ListAwareness.descOfAwareness[index],)));
          },
          child: Container(
            height: ScreenSize.height(context) * 0.5,
            width: ScreenSize.width(context) * 0.7,
            decoration: BoxDecoration(
                color: ColorAssets.secondaryColor,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              children: [
                Image.asset(ListAwareness.awarenessImage[index],
                  height: ScreenSize.height(context) * 0.4,
                  width: ScreenSize.width(context) * 0.7,),

                Text(ListAwareness.wordOfAwareness[index],
                  style: Styles.textStyle16.copyWith(
                      color: ColorAssets.backgroundColor),)
              ],
            ),
          ),
        ),
      );
    },
      itemCount: ListAwareness.awarenessImage.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
    );
  }
}
