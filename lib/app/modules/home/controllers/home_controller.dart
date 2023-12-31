import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:qtech_video_player_task/app/data/api_urls/api_urls.dart';
import 'package:qtech_video_player_task/app/utilities/message/snack_bars.dart';
import 'package:qtech_video_player_task/domain/base_client/base_client.dart';
import 'package:qtech_video_player_task/domain/core/model/trending_video_response_model.dart';

class HomeController extends GetxController {
  RxList<TrendingVideosData> videosList = <TrendingVideosData>[].obs;

  RxBool isLoading = false.obs;


  Future<TrendingVideoResponseModel> getTrendingVideos({required int page}) async {

    try{
      print('objecttttttt');
      isLoading.value = true;
      
      final response = await ApiBaseClient().getData(url: ApiUrls.getTrendingVideos(page: page),);

      TrendingVideoResponseModel responseModel = TrendingVideoResponseModel.fromJson(response);

      if(responseModel.results!.isNotEmpty){
        
        for(var element in responseModel.results!){
          videosList.add(element);
        }
      }
      
    }catch(e, t){
      print('object::::::');
      isLoading.value = false;
      showBasicFailedSnackBar(message: 'Something went wrong');
      debugPrint('$e');
      debugPrint('$t');

    }finally{
      isLoading.value = false;
    }

    return TrendingVideoResponseModel();
  }


  @override
  void onInit() {
    getTrendingVideos(page: 1);
    super.onInit();
  }

}
