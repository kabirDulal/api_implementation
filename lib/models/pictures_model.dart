
class PicturesModel {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  PicturesModel({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  PicturesModel.fromJson(Map<String, dynamic> json) {
    if(json["albumId"] is int) {
      albumId = json["albumId"];
    }
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["url"] is String) {
      url = json["url"];
    }
    if(json["thumbnailUrl"] is String) {
      thumbnailUrl = json["thumbnailUrl"];
    }
  }

  static List<PicturesModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(PicturesModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["albumId"] = albumId;
    _data["id"] = id;
    _data["title"] = title;
    _data["url"] = url;
    _data["thumbnailUrl"] = thumbnailUrl;
    return _data;
  }
}