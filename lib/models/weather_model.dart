class WeatherModel {
    final double latitude;
    final double longitude;
    final String timezone;

    WeatherModel({
        required this.latitude,
        required this.longitude,
        required this.timezone,
    });

    factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        timezone: json["timezone"],
    );
}
