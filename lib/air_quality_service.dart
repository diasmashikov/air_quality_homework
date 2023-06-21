import 'dart:convert';

import 'package:http/http.dart' as http;

class AirQualityService {
  // INSERT YOUR API KEY
  final accessKey = "";

  // ASTANA COORDINATES
  final lat = 51.169392;
  final lon = 71.449074;

  String url = "";

  AirQualityService() {
    url = "http://api.openweathermap.org/data/2.5/air_pollution";
  }

  Future<Map<String, dynamic>> getCurrentAQI() async {
    String currentAQIRoute = "$url?lat=$lat&lon=$lon&appid=$accessKey";

    final response = await http.get(Uri.parse(currentAQIRoute));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      return {
        'airquality': data['list'][0]['components']['pm2_5'],
        'timestamp': data['list'][0]['dt']
      };
    } else {
      throw Exception('Failed to load air quality data');
    }
  }

  // TODO - Uncomment this function and complete it
  // Future<Map<String, dynamic>> getCurrentAndNextHoursAQI() async {

  // }
}
