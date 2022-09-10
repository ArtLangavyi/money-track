part of swagger.api;

class WeatherForecast {
  DateTime? date = null;

  int? temperatureC = null;

  int? temperatureF = null;

  String? summary = null;

  WeatherForecast();

  @override
  String toString() {
    return 'WeatherForecast[date=$date, temperatureC=$temperatureC, temperatureF=$temperatureF, summary=$summary, ]';
  }

  WeatherForecast.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    date = json['date'] == null ? null : DateTime.parse(json['date']);
    temperatureC = json['temperatureC'];
    temperatureF = json['temperatureF'];
    summary = json['summary'];
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date == null ? '' : date!.toUtc().toIso8601String(),
      'temperatureC': temperatureC,
      'temperatureF': temperatureF,
      'summary': summary
    };
  }

  static List<WeatherForecast> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => new WeatherForecast.fromJson(value)).toList();
  }

  static Map<String, WeatherForecast> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, WeatherForecast>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new WeatherForecast.fromJson(value));
    }
    return map;
  }
}
