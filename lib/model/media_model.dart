class MediaModel {
  int? id;
  String? fineName;
  String? fileType;
  String? fileUrl;

  MediaModel({this.id, this.fineName, this.fileType, this.fileUrl});

  MediaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fineName = json['file_name'];
    fileType = json['file_type'];
    fileUrl = json['file_url'];
  }
}
