import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:qtech_video_player_task/domain/core/model/trending_video_response_model.dart';
import 'package:video_player/video_player.dart';

class VideoPlayController extends GetxController {
  TrendingVideosData? video;

  final videoPlayerController = VideoPlayerController.network(
      'https://bycwknztmq.gpcdn.net/7d2317e1-51e2-4afc-9936-e4fa8342c66d/playlist.m3u8');
  late ChewieController chewieController;

  @override
  void onInit() async {
    video = Get.arguments['video'];


    chewieController = ChewieController(
      videoPlayerController: VideoPlayerController.network(
          'https://bycwknztmq.gpcdn.net/7d2317e1-51e2-4afc-9936-e4fa8342c66d/playlist.m3u8'),
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
    );

    super.onInit();
  }

}
