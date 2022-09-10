part of swagger.api;

class UserResponse {
  int? id = null;

  String? firstName = null;

  String? middleName = null;

  String? lastName = null;

  UserResponse();

  @override
  String toString() {
    return 'UserResponse[id=$id, firstName=$firstName, middleName=$middleName, lastName=$lastName, ]';
  }

  UserResponse.fromJson(Map<String, dynamic> json) {
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

  static List<UserResponse> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => new UserResponse.fromJson(value)).toList();
  }

  static Map<String, UserResponse> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, UserResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new UserResponse.fromJson(value));
    }
    return map;
  }
}
