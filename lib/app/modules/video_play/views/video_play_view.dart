import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qtech_video_player_task/app/data/constants/app_text_style.dart';
import 'package:qtech_video_player_task/app/modules/video_play/views/widgets/custom_button.dart';
import 'package:qtech_video_player_task/app/utilities/extensions/time_ago_calculation.dart';
import 'package:qtech_video_player_task/app/utilities/widgets/custom_divider.dart';
import 'package:video_player/video_player.dart';

import '../controllers/video_play_controller.dart';

class VideoPlayView extends GetView<VideoPlayController> {
  const VideoPlayView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VideoPlayView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              child: Chewie(controller: controller.chewieController),
            ),

            /// Channel Name & Title
            const SizedBox(height: 12.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                controller.video?.title ?? '',
                style: AppTextStyle.textStyle15Bold,
              )
            ),

            /// Date & Views
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 50, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${controller.video?.viewers} views   .',
                        style: AppTextStyle.textStyle13Grey,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        Extensions().calculateTimeAgo(DateTime.tryParse(controller.video?.createdAt ?? '') ?? DateTime.now()),
                        style: AppTextStyle.textStyle13Grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),


            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CustomButton(title: 'MASH ALLAH (12K)', icon: Icons.favorite_border_outlined,),
                  CustomButton(title: 'LIKE', icon: Icons.thumb_up_alt_outlined,),
                  CustomButton(title: 'SHARE', icon: Icons.share,),
                  CustomButton(title: 'REPORT', icon: Icons.flag_outlined,),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [

                  CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage(controller.video?.channelImage ?? ''),
                  ),
                  const SizedBox(width: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.video?.channelName ?? '',
                        style: AppTextStyle.textStyle15Bold,
                      ),
                      const Text('3M Subscribers', style: AppTextStyle.textStyle11Weight400,),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: 33,
                    padding: const EdgeInsets.only(top: 8, left: 12, right: 14, bottom: 8),
                    decoration: ShapeDecoration(
                      color: const Color(0xFF3898FC),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    ),
                    child: const Row(

                      children: [
                        Icon(Icons.add, color: Colors.white,),
                        SizedBox(width: 8),
                        Text(
                          'Subscribe',
                          style: AppTextStyle.textStyle12Weight500Size12,
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),

            const CustomDivider(),

            Row(
              children: [

              ],
            ),


          ],
        ),
      ),
    );
  }
}

