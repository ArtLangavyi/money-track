part of swagger.api;

class SaveResponse {
  String? typeName = null;

  int? id = null;

  bool? saved = null;

  SaveResponse();

  @override
  String toString() {
    return 'SaveResponse[typeName=$typeName, id=$id, saved=$saved, ]';
  }

  SaveResponse.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    typeName = json['typeName'];
    id = json['id'];
    saved = json['saved'];
  }

  Map<String, dynamic> toJson() {
    return {'typeName': typeName, 'id': id, 'saved': saved};
  }

  static List<SaveResponse> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => new SaveResponse.fromJson(value)).toList();
  }

  static Map<String, SaveResponse> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, SaveResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new SaveResponse.fromJson(value));
    }
    return map;
  }
}
