class ApiUrls{

  static String domainName = 'https://test-ximit.mahfil.net/';

  static String baseApi = '${domainName}api/';

  static String getTrendingVideos({required int page}) {
    return "${baseApi}trending-video/1?page=$page";
  }

}