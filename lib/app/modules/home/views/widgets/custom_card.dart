import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qtech_video_player_task/app/data/constants/app_text_style.dart';
import 'package:qtech_video_player_task/app/utilities/extensions/widget.extensions.dart';

class CustomCard extends StatelessWidget {
  final String thumbnail;
  final String title;
  final String views;
  final String date;
  final String duration;
  final String channelImage;
  final Function()? onTap;

  const CustomCard({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.views,
    required this.date,
    required this.duration,
    required this.channelImage,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: InkWell(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Thumbnail
              Stack(
                children: [
                  Image.network(
                    thumbnail,
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                  ),
                  Positioned(
                    bottom: 8.0,
                    right: 8.0,
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                      color: Colors.black,
                      child: Text(
                        duration,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),

              /// Channel Name & Title
              10.verticalSpacing,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundImage: NetworkImage(channelImage),
                    ),
                    8.horizontalSpacing,
                    Expanded(
                      child: Text(
                        title,
                        style: AppTextStyle.textStyle15Bold,
                      ),
                    ),
                    const Icon(
                      Icons.more_vert,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),

              /// Date & Views
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 50.0, right: 50, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$views views   .',
                          style: AppTextStyle.textStyle13Grey,
                        ),
                        20.horizontalSpacing,
                        Text(
                          DateFormat('MMM d, yyyy').format(DateTime.tryParse(date) ?? DateTime.now()),
                          style: AppTextStyle.textStyle13Grey,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
