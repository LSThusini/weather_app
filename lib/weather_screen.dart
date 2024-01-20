import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/additional_info_item.dart';
import 'package:weather_app/hourly_forecast_item.dart';

//New comment
//Another comment
class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh)),
        ],
      ),
      //App Body begins
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              //Let the content take the maximum size of the card
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            '300°F',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          Icon(
                            Icons.cloud,
                            size: 64,
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Rain",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Weather Forecust",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyForecastItem(
                    time: '09:00',
                    icon: Icons.cloud,
                    temperature: '300.2',
                  ),
                  HourlyForecastItem(
                    time: '10:00',
                    icon: Icons.cloud,
                    temperature: '320.2',
                  ),
                  HourlyForecastItem(
                    time: '11:00',
                    icon: Icons.cloud,
                    temperature: '324',
                  ),
                  HourlyForecastItem(
                    time: '12:00',
                    icon: Icons.water_drop_sharp,
                    temperature: '334',
                  ),
                  HourlyForecastItem(
                    time: '13:00',
                    icon: Icons.sunny,
                    temperature: '300',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Additional Information",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AdditionalInforItem(
                    icon: Icons.water_drop,
                    label: "Humidity",
                    value: "94",
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  AdditionalInforItem(
                    icon: Icons.air,
                    label: "Wind speed",
                    value: "8.3",
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  AdditionalInforItem(
                    icon: Icons.beach_access,
                    label: "Pressure",
                    value: "1003",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
