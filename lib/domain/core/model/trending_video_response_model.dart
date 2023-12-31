class TrendingVideoResponseModel {
  Links? links;
  int? total;
  int? page;
  int? pageSize;
  List<TrendingVideosData>? results;

  TrendingVideoResponseModel(
      {this.links, this.total, this.page, this.pageSize, this.results});

  TrendingVideoResponseModel.fromJson(Map<String, dynamic> json) {
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    total = json['total'];
    page = json['page'];
    pageSize = json['page_size'];
    if (json['results'] != null) {
      results = <TrendingVideosData>[];
      json['results'].forEach((v) {
        results!.add(TrendingVideosData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (links != null) {
      data['links'] = links!.toJson();
    }
    data['total'] = total;
    data['page'] = page;
    data['page_size'] = pageSize;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Links {
  int? next;
  int? previous;

  Links({this.next, this.previous});

  Links.fromJson(Map<String, dynamic> json) {
    next = json['next'];
    previous = json['previous'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['next'] = next;
    data['previous'] = previous;
    return data;
  }
}

class TrendingVideosData {
  String? thumbnail;
  int? id;
  String? title;
  String? dateAndTime;
  String? slug;
  String? createdAt;
  String? manifest;
  int? liveStatus;
  String? liveManifest;
  bool? isLive;
  String? channelImage;
  String? channelName;
  String? channelUsername;
  bool? isVerified;
  String? channelSlug;
  String? channelSubscriber;
  int? channelId;
  String? type;
  String? viewers;
  String? duration;
  String? objectType;

  TrendingVideosData(
      {this.thumbnail,
        this.id,
        this.title,
        this.dateAndTime,
        this.slug,
        this.createdAt,
        this.manifest,
        this.liveStatus,
        this.liveManifest,
        this.isLive,
        this.channelImage,
        this.channelName,
        this.channelUsername,
        this.isVerified,
        this.channelSlug,
        this.channelSubscriber,
        this.channelId,
        this.type,
        this.viewers,
        this.duration,
        this.objectType});

  TrendingVideosData.fromJson(Map<String, dynamic> json) {
    thumbnail = json['thumbnail'];
    id = json['id'];
    title = json['title'];
    dateAndTime = json['date_and_time'];
    slug = json['slug'];
    createdAt = json['created_at'];
    manifest = json['manifest'];
    liveStatus = json['live_status'];
    liveManifest = json['live_manifest'];
    isLive = json['is_live'];
    channelImage = json['channel_image'];
    channelName = json['channel_name'];
    channelUsername = json['channel_username'];
    isVerified = json['is_verified'];
    channelSlug = json['channel_slug'];
    channelSubscriber = json['channel_subscriber'];
    channelId = json['channel_id'];
    type = json['type'];
    viewers = json['viewers'];
    duration = json['duration'];
    objectType = json['object_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['thumbnail'] = thumbnail;
    data['id'] = id;
    data['title'] = title;
    data['date_and_time'] = dateAndTime;
    data['slug'] = slug;
    data['created_at'] = createdAt;
    data['manifest'] = manifest;
    data['live_status'] = liveStatus;
    data['live_manifest'] = liveManifest;
    data['is_live'] = isLive;
    data['channel_image'] = channelImage;
    data['channel_name'] = channelName;
    data['channel_username'] = channelUsername;
    data['is_verified'] = isVerified;
    data['channel_slug'] = channelSlug;
    data['channel_subscriber'] = channelSubscriber;
    data['channel_id'] = channelId;
    data['type'] = type;
    data['viewers'] = viewers;
    data['duration'] = duration;
    data['object_type'] = objectType;
    return data;
  }
}
