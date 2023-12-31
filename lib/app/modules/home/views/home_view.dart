import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qtech_video_player_task/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Obx(
            () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: controller.videosList.length,
          itemBuilder: (context, index) {
            final video = controller.videosList[index];
            return ListTile(
              title: Text(video.title ?? ''),
              onTap: () {
                Get.toNamed(Routes.VIDEO_PLAY, arguments: video);
              },
            );
          },
        ),
      ),
    );
  }
}

