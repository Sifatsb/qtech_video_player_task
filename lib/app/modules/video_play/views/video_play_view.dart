import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qtech_video_player_task/app/data/constants/app_colors.dart';
import 'package:qtech_video_player_task/app/data/constants/app_text_style.dart';
import 'package:qtech_video_player_task/app/modules/video_play/views/widgets/custom_button.dart';
import 'package:qtech_video_player_task/app/utilities/extensions/time_ago_calculation.dart';
import 'package:qtech_video_player_task/app/utilities/extensions/widget.extensions.dart';
import 'package:qtech_video_player_task/app/utilities/widgets/custom_divider.dart';
import 'package:qtech_video_player_task/app/utilities/widgets/custom_text_form_field.dart';
import 'package:video_player/video_player.dart';

import '../controllers/video_play_controller.dart';

class VideoPlayView extends GetView<VideoPlayController> {
  const VideoPlayView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              child: Chewie(controller: controller.chewieController),
            ),

            /// Channel Name & Title
            12.verticalSpacing,
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  controller.video?.title ?? '',
                  style: AppTextStyle.textStyle15Bold,
                )),

            /// Date & Views
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 50, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${controller.video?.viewers} views   .',
                        style: AppTextStyle.textStyle13Grey,
                      ),
                      20.horizontalSpacing,
                      Text(
                        Extensions().calculateTimeAgo(DateTime.tryParse(
                                controller.video?.createdAt ?? '') ??
                            DateTime.now()),
                        style: AppTextStyle.textStyle13Grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            /// Buttons
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CustomButton(
                    title: 'MASH ALLAH (12K)',
                    icon: Icons.favorite_border_outlined,
                  ),
                  CustomButton(
                    title: 'LIKE',
                    icon: Icons.thumb_up_alt_outlined,
                  ),
                  CustomButton(
                    title: 'SHARE',
                    icon: Icons.share,
                  ),
                  CustomButton(
                    title: 'REPORT',
                    icon: Icons.flag_outlined,
                  ),
                ],
              ),
            ),

            /// Comments
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        NetworkImage(controller.video?.channelImage ?? ''),
                  ),
                  10.horizontalSpacing,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.video?.channelName ?? '',
                        style: AppTextStyle.textStyle15Bold,
                      ),
                      const Text(
                        '3M Subscribers',
                        style: AppTextStyle.textStyle11Weight400,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: 33,
                    padding: const EdgeInsets.only(
                        top: 8, left: 12, right: 14, bottom: 8),
                    decoration: ShapeDecoration(
                      color: const Color(0xFF3898FC),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        8.horizontalSpacing,
                        const Text(
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
            20.verticalSpacing,

            /// Add Comment
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Comments   7.5K',
                    style: AppTextStyle.textStyle12Weight400Size12,
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.keyboard_arrow_up,
                        color: AppColors.greyColor,
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.greyColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            10.verticalSpacing,

            /// Users Comment
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextFormField(
                controller: controller.commentController,
                fillColor: const Color(0xFFFDFBFF),
                focusBorderActive: true,
                enableBorderActive: true,
                hintText: "Add Comment",
                textInputType: TextInputType.text,
                suffixIcon: const Icon(
                  Icons.send,
                  color: AppColors.greyColor,
                ),
              ),
            ),
            10.verticalSpacing,

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // Align content to the top
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundImage: NetworkImage(
                              controller.video?.channelImage ?? ''),
                        ),
                        10.horizontalSpacing,
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: const TextSpan(
                                  text: 'Fahmida Khanom     ',
                                  style: AppTextStyle.textStyle12Weight500,
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '2 days ago',
                                      style:
                                          AppTextStyle.textStyleWeight400Size8,
                                    ),
                                  ],
                                ),
                              ),
                              5.verticalSpacing,
                              Text(
                                  'হুজুরের বক্তব্য গুলো ইংরেজি তে অনুবাদ করে সারা পৃথিবীর মানুষদের কে শুনিয়ে দিতে হবে। কথা গুলো খুব দামি'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const CustomDivider(),
          ],
        ),
      ),
    );
  }
}
