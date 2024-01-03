import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:qtech_video_player_task/app/data/api_urls/api_urls.dart';
import 'package:qtech_video_player_task/app/utilities/message/snack_bars.dart';
import 'package:qtech_video_player_task/domain/base_client/base_client.dart';
import 'package:qtech_video_player_task/domain/core/model/trending_video_response_model.dart';

class HomeController extends GetxController {
  RxList<TrendingVideosData> videosList = <TrendingVideosData>[].obs;

  final ScrollController scrollController = ScrollController();
  RxBool isLoading = false.obs;
  RxBool isMoreLoader = false.obs;
  int? nextPage = 1;

  Future<TrendingVideoResponseModel> getTrendingVideos(
      {required int page}) async {
    try {
      isLoading.value = true;

      final response = await ApiBaseClient().getData(
        url: ApiUrls.getTrendingVideos(page: page),
      );

      TrendingVideoResponseModel responseModel =
          TrendingVideoResponseModel.fromJson(response);
      nextPage = responseModel.links?.next ?? 1;

      if (responseModel.results!.isNotEmpty) {
        for (var element in responseModel.results!) {
          videosList.add(element);
        }
      }
    } catch (e, t) {
      isLoading.value = false;
      showBasicFailedSnackBar(message: 'Something went wrong');
      debugPrint('$e');
      debugPrint('$t');
    } finally {
      isLoading.value = false;
    }

    return TrendingVideoResponseModel();
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      _loadMoreData();
    }
  }

  Future<void> _loadMoreData() async {
    if (!isMoreLoader.value) {
      isMoreLoader.value = true;

      if (nextPage != null) {
        try {
          isMoreLoader.value = true;

          final response = await ApiBaseClient().getData(
            url: ApiUrls.getTrendingVideos(page: nextPage!),
          );

          TrendingVideoResponseModel responseModel =
              TrendingVideoResponseModel.fromJson(response);
          nextPage = responseModel.links?.next;

          if (responseModel.results!.isNotEmpty) {
            for (var element in responseModel.results!) {
              videosList.add(element);
            }
          }
        } catch (e, t) {
          isMoreLoader.value = false;
          showBasicFailedSnackBar(message: 'Something went wrong');
          debugPrint('$e');
          debugPrint('$t');
        } finally {
          isMoreLoader.value = false;
        }
      } else {
        isMoreLoader.value = false;
      }
    }
  }

  @override
  void onInit() {
    getTrendingVideos(page: nextPage!);
    scrollController.addListener(_scrollListener);
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
