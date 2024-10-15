import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:mock_app_post/cosnt/color_const.dart';
import 'package:mock_app_post/cosnt/image_const.dart';
import 'package:mock_app_post/model/post_data_model.dart';
import 'package:mock_app_post/utils/app_text.dart';
import 'package:mock_app_post/utils/spacers.dart';
import 'package:mock_app_post/view/post%20card/post_card_view.dart';

class PostCardTile extends StatelessWidget {
  final PostData data;
  const PostCardTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return OpenContainer(closedBuilder: (context, onclose) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            border: const Border(
                bottom: BorderSide(color: colors.disableColor, width: 2))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceRegular,
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: colors.gradientColor)),
                ),
                horizontalSpaceSmall,
                AppText(
                  text: "User${data.userId}",
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
                const Spacer(),
                AppText(
                  text: data.publishedAt,
                  color: Theme.of(context).primaryColor,
                  size: 10.0,
                ),
              ],
            ),
            verticalSpaceSmall,
            AppText(
              text: data.title,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
            verticalSpaceSmall,
            ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child:
                    Image.network(data.image ?? ImageConst.placeHolderImage)),
            verticalSpaceSmall
          ],
        ),
      );
    }, openBuilder: (context, onOpen) {
      return PostCardView(
        post: data,
      );
    });
  }
}
