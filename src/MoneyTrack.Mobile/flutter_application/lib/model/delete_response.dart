part of swagger.api;

class DeleteResponse {
  String? typeName;

  int? id;

  bool? deleted;

  DeleteResponse();

  @override
  String toString() {
    return 'DeleteResponse[typeName=$typeName, id=$id, deleted=$deleted, ]';
  }

  DeleteResponse.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    typeName = json['typeName'];
    id = json['id'];
    deleted = json['deleted'];
  }

  Map<String, dynamic> toJson() {
    return {'typeName': typeName, 'id': id, 'deleted': deleted};
  }

  static List<DeleteResponse> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => DeleteResponse.fromJson(value)).toList();
  }

  static Map<String, DeleteResponse> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = <String, DeleteResponse>{};
    if (json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = DeleteResponse.fromJson(value));
    }
    return map;
  }
}
