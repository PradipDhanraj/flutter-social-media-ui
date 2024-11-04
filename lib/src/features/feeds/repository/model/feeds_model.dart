// To parse this JSON data, do
//
//     final feed = feedFromJson(jsonString);

import 'dart:convert';

FeedData feedFromJson(String str) => FeedData.fromJson(json.decode(str));

String? feedToJson(FeedData data) => json.encode(data.toJson());

class FeedData {
  int statusCode;
  String? message;
  Feed feed;

  FeedData({
    required this.statusCode,
    required this.message,
    required this.feed,
  });

  factory FeedData.fromJson(Map<String, dynamic> json) => FeedData(
        statusCode: json["statusCode"],
        message: json["message"],
        feed: Feed.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "data": feed.toJson(),
      };
}

class Feed {
  List<Datum> data;
  MetaData metaData;

  Feed({
    required this.data,
    required this.metaData,
  });

  factory Feed.fromJson(Map<String, dynamic> json) => Feed(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        metaData: MetaData.fromJson(json["meta_data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta_data": metaData.toJson(),
      };
}

class Datum {
  int id;
  String? title;
  String? url;
  String? cdnUrl;
  String? thumbCdnUrl;
  int userId;
  Status status;
  String? slug;
  EncodeStatus encodeStatus;
  int priority;
  int categoryId;
  int totalViews;
  int totalLikes;
  int totalComments;
  int totalShare;
  int totalWishlist;
  int duration;
  DateTime byteAddedOn;
  DateTime byteUpdatedOn;
  String? bunnyStreamVideoId;
  String? language;
  int bunnyEncodingStatus;
  dynamic deletedAt;
  int videoHeight;
  int videoWidth;
  dynamic location;
  int isPrivate;
  int isHideComment;
  dynamic description;
  User user;
  bool isLiked;
  bool isWished;
  bool isFollow;
  String? _videoAspectRatio;

  double get videoAspectRatio {
    double value = 1;
    if (_videoAspectRatio != null) {
      var lst = _videoAspectRatio!.split(':');
      var height = int.parse(lst.first);
      var width = int.parse(lst.last);
      value = width / height;
    }
    return value;
  }

  Datum({
    required this.id,
    required this.title,
    required this.url,
    required this.cdnUrl,
    required this.thumbCdnUrl,
    required this.userId,
    required this.status,
    required this.slug,
    required this.encodeStatus,
    required this.priority,
    required this.categoryId,
    required this.totalViews,
    required this.totalLikes,
    required this.totalComments,
    required this.totalShare,
    required this.totalWishlist,
    required this.duration,
    required this.byteAddedOn,
    required this.byteUpdatedOn,
    required this.bunnyStreamVideoId,
    required this.language,
    required this.bunnyEncodingStatus,
    required this.deletedAt,
    required this.videoHeight,
    required this.videoWidth,
    required this.location,
    required this.isPrivate,
    required this.isHideComment,
    required this.description,
    required this.user,
    required this.isLiked,
    required this.isWished,
    required this.isFollow,
    required String? videoAspectRatio,
  }) : _videoAspectRatio = videoAspectRatio;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        url: json["url"],
        cdnUrl: json["cdn_url"],
        thumbCdnUrl: json["thumb_cdn_url"],
        userId: json["user_id"],
        status: statusValues.map[json["status"]]!,
        slug: json["slug"],
        encodeStatus: encodeStatusValues.map[json["encode_status"]]!,
        priority: json["priority"],
        categoryId: json["category_id"],
        totalViews: json["total_views"],
        totalLikes: json["total_likes"],
        totalComments: json["total_comments"],
        totalShare: json["total_share"],
        totalWishlist: json["total_wishlist"],
        duration: json["duration"],
        byteAddedOn: DateTime.parse(json["byte_added_on"]),
        byteUpdatedOn: DateTime.parse(json["byte_updated_on"]),
        bunnyStreamVideoId: json["bunny_stream_video_id"],
        language: json["language"],
        bunnyEncodingStatus: json["bunny_encoding_status"],
        deletedAt: json["deleted_at"],
        videoHeight: json["video_height"],
        videoWidth: json["video_width"],
        location: json["location"],
        isPrivate: json["is_private"],
        isHideComment: json["is_hide_comment"],
        description: json["description"],
        user: User.fromJson(json["user"]),
        isLiked: json["is_liked"],
        isWished: json["is_wished"],
        isFollow: json["is_follow"],
        videoAspectRatio: json["video_aspect_ratio"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "url": url,
        "cdn_url": cdnUrl,
        "thumb_cdn_url": thumbCdnUrl,
        "user_id": userId,
        "status": statusValues.reverse[status],
        "slug": slug,
        "encode_status": encodeStatusValues.reverse[encodeStatus],
        "priority": priority,
        "category_id": categoryId,
        "total_views": totalViews,
        "total_likes": totalLikes,
        "total_comments": totalComments,
        "total_share": totalShare,
        "total_wishlist": totalWishlist,
        "duration": duration,
        "byte_added_on": byteAddedOn.toIso8601String(),
        "byte_updated_on": byteUpdatedOn.toIso8601String(),
        "bunny_stream_video_id": bunnyStreamVideoId,
        "language": language,
        "bunny_encoding_status": bunnyEncodingStatus,
        "deleted_at": deletedAt,
        "video_height": videoHeight,
        "video_width": videoWidth,
        "location": location,
        "is_private": isPrivate,
        "is_hide_comment": isHideComment,
        "description": description,
        "user": user.toJson(),
        "is_liked": isLiked,
        "is_wished": isWished,
        "is_follow": isFollow,
        "video_aspect_ratio": _videoAspectRatio,
      };
}

enum EncodeStatus { PENDING }

final encodeStatusValues = EnumValues({"pending": EncodeStatus.PENDING});

enum Status { APPROVED }

final statusValues = EnumValues({"approved": Status.APPROVED});

class User {
  int userId;
  String? fullname;
  String? username;
  String? profilePicture;
  String? profilePictureCdn;
  String? designation;

  User({
    required this.userId,
    required this.fullname,
    required this.username,
    required this.profilePicture,
    required this.profilePictureCdn,
    required this.designation,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"],
        fullname: json["fullname"],
        username: json["username"],
        profilePicture: json["profile_picture"],
        profilePictureCdn: json["profile_picture_cdn"],
        designation: json["designation"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "fullname": fullname,
        "username": username,
        "profile_picture": profilePicture,
        "profile_picture_cdn": profilePictureCdn,
        "designation": designation,
      };
}

class MetaData {
  int total;
  int page;
  int limit;

  MetaData({
    required this.total,
    required this.page,
    required this.limit,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
        total: json["total"],
        page: json["page"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "page": page,
        "limit": limit,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
