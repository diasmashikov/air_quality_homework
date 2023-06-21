import 'package:air_quality_homework/decorator.dart';
import 'package:flutter/material.dart';

import 'air_quality_service.dart';

class AirQualityScreen extends StatefulWidget {
  final AirQualityService airQualityService;

  const AirQualityScreen({super.key, required this.airQualityService});

  @override
  State<AirQualityScreen> createState() => _AirQualityScreenState();
}

class _AirQualityScreenState extends State<AirQualityScreen> {
  // Futures to retrieve your air quality data through FutureBuilders
  late Future<Map<String, dynamic>> _airQualityDataFuture;
  late Future<Map<String, dynamic>> _airQualityHoursDataFuture;

  Color backgroundColorMain = const Color.fromRGBO(10, 9, 51, 1);
  Color backgroundColorLower = const Color.fromRGBO(6, 6, 30, 1);
  Color blocksColor = const Color.fromRGBO(17, 17, 41, 1);
  Color cornerColor = const Color.fromRGBO(6, 110, 143, 0.5);

  @override
  void initState() {
    _airQualityDataFuture = widget.airQualityService.getCurrentAQI();
    // _airQualityHoursDataFuture =
    //     widget.airQualityService.getCurrentAndNextHoursAQI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColorMain,
        body: Container(
          decoration: Decorator.mainScreenDecoration,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
          child: FutureBuilder<Map<String, dynamic>>(
            future: _airQualityDataFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                double airQuality = snapshot.data!['airquality'];
                print("The air quality in the city of Astana is $airQuality");
                final formattedDate = formatDate(DateTime.now());
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Placeholder(),
                    ]);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ));
  }

  Widget _buildCityTitle() {
    return const Placeholder();
  }

  Widget _buildFormattedDate(String formattedDate) {
    return const Placeholder();
  }

  // !!!!!!!!!!!!!!!!!!!!!!!!!!!!
  // TODO - Complete the function
  // !!!!!!!!!!!!!!!!!!!!!!!!!!!!
  Widget _buildAirQualityTitle() {
    return Container(
        width: 150,
        height: 50,
        decoration: BoxDecoration(
          color: cornerColor.withOpacity(0.6),
        ),
        child: const Placeholder());
  }

  // !!!!!!!!!!!!!!!!!!!!!!!!!!!!
  // TODO - Complete the function
  // !!!!!!!!!!!!!!!!!!!!!!!!!!!!
  Widget _buildShowAirQuality(int airQuality) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDoubleCircle(
          textAQIWidget: Text(
            '$airQuality\nAQI',
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  // !!!!!!!!!!!!!!!!!!!!!!!!!!!!
  // DO NOT MODIFY
  // !!!!!!!!!!!!!!!!!!!!!!!!!!!!
  Widget _buildDoubleCircle({required Text textAQIWidget}) {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            backgroundColorLower,
            backgroundColorMain,
          ],
          center: Alignment.center,
          radius: 0.3,
        ),
      ),
      child: Center(
        child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: cornerColor.withOpacity(0.3)),
            child: Center(child: textAQIWidget)),
      ),
    );
  }

  // !!!!!!!!!!!!!!!!!!!!!!!!!!!!
  // TODO - Complete the function
  // !!!!!!!!!!!!!!!!!!!!!!!!!!!!
  Widget _buildNextAirQualityHours() {
    return FutureBuilder<Map<String, dynamic>>(
      future: _airQualityHoursDataFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data!['airqualityhours']);
          return const Placeholder();
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  // !!!!!!!!!!!!!!!!!!!!!!!!!!!!
  // TODO - Complete the function
  // !!!!!!!!!!!!!!!!!!!!!!!!!!!!
  Widget _buildNextAirQualityHoursList(List<dynamic> airQualityHours) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [Placeholder()],
    );
  }

  // !!!!!!!!!!!!!!!!!!!!!!!!!!!!
  // TODO - Complete the function
  // !!!!!!!!!!!!!!!!!!!!!!!!!!!!
  Widget _buildHoursAndAQIContainer(String hour, String airQualityIndex) {
    return Container(
        width: 150,
        height: 25,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: blocksColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_buildHoursAndAQIColumn(hour, airQualityIndex)],
        ));
  }

  // !!!!!!!!!!!!!!!!!!!!!!!!!!!!
  // TODO - Complete the function
  // !!!!!!!!!!!!!!!!!!!!!!!!!!!!
  Widget _buildHoursAndAQIColumn(String hour, String airQualityIndex) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [Placeholder()],
    );
  }

  // !!!!!!!!!!!!!!!!!!!!!!!!!!!!
  // Do not worry about the functions below
  // !!!!!!!!!!!!!!!!!!!!!!!!!!!!
  int convertTimestampToHours(num timestamp) {
    int seconds = timestamp.toInt();
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(seconds * 1000);
    int hour = dateTime.hour;
    return hour;
  }

  String formatDate(DateTime date) {
    final monthName = _getMonthName(date.month);
    final formattedDate = '$monthName ${date.day}, ${date.year}';
    return formattedDate;
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }
}
