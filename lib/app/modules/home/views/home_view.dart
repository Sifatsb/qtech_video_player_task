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
                controller: controller.scrollController,
                physics: const BouncingScrollPhysics(),
                itemCount: controller.videosList.length+1,
                itemBuilder: (context, index) {

                  return index < controller.videosList.length ? CustomCard(
                    onTap: () => Get.toNamed(
                      Routes.VIDEO_PLAY,
                      arguments: {
                        'video': controller.videosList[index],
                      },
                    ),
                    thumbnail: controller.videosList[index].thumbnail ?? '',
                    title: controller.videosList[index].title ?? '',
                    views: controller.videosList[index].viewers ?? '0',
                    date: controller.videosList[index].dateAndTime ?? '',
                    duration: controller.videosList[index].duration ?? '0',
                    channelImage: controller.videosList[index].channelImage ?? '',
                  ) : buildLoadingIndicator();
                },
              ),
      ),
    );
  }
}


Widget buildLoadingIndicator() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
      child: Obx(() => Get.find<HomeController>().isMoreLoader.value ? const CircularProgressIndicator() : SizedBox()),
    ),
  );
}