
class PicturesModel {
  bool? success;
  int? totalPhotos;
  String? message;
  int? offset;
  int? limit;
  List<Photos>? photos;

  PicturesModel({this.success, this.totalPhotos, this.message, this.offset, this.limit, this.photos});

  PicturesModel.fromJson(Map<String, dynamic> json) {
    if(json["success"] is bool) {
      success = json["success"];
    }
    if(json["total_photos"] is int) {
      totalPhotos = json["total_photos"];
    }
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["offset"] is int) {
      offset = json["offset"];
    }
    if(json["limit"] is int) {
      limit = json["limit"];
    }
    if(json["photos"] is List) {
      photos = json["photos"] == null ? null : (json["photos"] as List).map((e) => Photos.fromJson(e)).toList();
    }
  }

  static List<PicturesModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(PicturesModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    _data["total_photos"] = totalPhotos;
    _data["message"] = message;
    _data["offset"] = offset;
    _data["limit"] = limit;
    if(photos != null) {
      _data["photos"] = photos?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Photos {
  String? url;
  String? title;
  int? user;
  String? description;
  int? id;

  Photos({this.url, this.title, this.user, this.description, this.id});

  Photos.fromJson(Map<String, dynamic> json) {
    if(json["url"] is String) {
      url = json["url"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["user"] is int) {
      user = json["user"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["id"] is int) {
      id = json["id"];
    }
  }

  static List<Photos> fromList(List<Map<String, dynamic>> list) {
    return list.map(Photos.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["url"] = url;
    _data["title"] = title;
    _data["user"] = user;
    _data["description"] = description;
    _data["id"] = id;
    return _data;
  }
}