import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:qtech_video_player_task/domain/core/model/trending_video_response_model.dart';
import 'package:video_player/video_player.dart';

class VideoPlayController extends GetxController {
  TrendingVideosData? video;

  VideoPlayerController? videoPlayerController;
  late ChewieController chewieController;

  @override
  void onInit() async {

    video = Get.arguments['video'];


    chewieController = ChewieController(
      videoPlayerController: VideoPlayerController.networkUrl(Uri.parse(video?.manifest ?? '')),
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: false,
    );

    super.onInit();
  }

  @override
  void dispose() {
    videoPlayerController?.dispose();
    chewieController.dispose();
    super.dispose();
  }

}
