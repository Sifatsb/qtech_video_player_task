import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
      body: const Center(
        child: Text(
          'VideoPlayView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
