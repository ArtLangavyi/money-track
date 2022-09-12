part of swagger.api;

class UserRequest {
  int? id = null;

  String? firstName = null;

  String? middleName = null;

  String? lastName = null;

  UserRequest();

  @override
  String toString() {
    return 'UserRequest[id=$id, firstName=$firstName, middleName=$middleName, lastName=$lastName, ]';
  }

  UserRequest.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName
    };
  }

  static List<UserRequest> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => new UserRequest.fromJson(value)).toList();
  }

  static Map<String, UserRequest> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, UserRequest>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new UserRequest.fromJson(value));
    }
    return map;
  }
}
