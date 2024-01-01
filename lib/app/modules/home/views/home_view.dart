import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:qtech_video_player_task/app/data/constants/app_text_style.dart';
import 'package:qtech_video_player_task/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';
import 'widgets/custom_card.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Trending Videos',
          style: AppTextStyle.textStyle20Bold,
        ),
        centerTitle: false,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: controller.videosList.length,
                itemBuilder: (context, index) {
                  final video = controller.videosList[index];
                  DateTime originalDate =
                      DateTime.parse(video.dateAndTime ?? '');
                  String formattedDate =
                      DateFormat('MMM d, yyyy').format(originalDate);
                  return VideoCard(
                    onTap: () => Get.toNamed(
                      Routes.VIDEO_PLAY,
                      arguments: {
                        'video': video,
                      },
                    ),
                    thumbnail: video.thumbnail ?? '',
                    title: video.title ?? '',
                    views: video.viewers ?? '0',
                    date: formattedDate,
                    duration: video.duration ?? '0',
                    channelImage: video.channelImage ?? '',
                  );
                },
              ),
      ),
    );
  }
}
