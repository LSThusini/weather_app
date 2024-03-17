import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/daily_forecast_item.dart';
import 'package:weather_app/secrets.dart';

class NextDays extends StatefulWidget {
  const NextDays({super.key});

  @override
  State<NextDays> createState() => _NextDaysState();
}

class _NextDaysState extends State<NextDays> {
  String cityName = 'Durban';
  late Future<Map<String, dynamic>> weather;

  @override
  void initState() {
    super.initState();
    weather = getCurrenttWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cityName),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: weather,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          //Data as it comes from the function.
          final data = snapshot.data!;

          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(children: [
                  Icon(
                    Icons.calendar_month_outlined,
                    size: 36,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "This Week",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 600,
                child: ListView.builder(
                  itemCount: 7,
                  scrollDirection: Axis.vertical,
                  itemBuilder: ((context, index) {
                    final temparature =
                        data['list'][index]['main']['temp'] - 273.15;
                    final sky = '${data['list'][index]['weather'][0]['main']}';

                    DateTime now = new DateTime.now();
                    List<String> nextSevenDays = [];

                    for (int i = 0; i < 8; i++) {
                      DateTime nextDay = now.add(Duration(days: i));
                      String dayOfWeek = DateFormat('EEEE').format(nextDay);
                      nextSevenDays.add(dayOfWeek);
                    }
                    return DailyForecast(
                      day: nextSevenDays[index + 1],
                      currentSky: sky,
                      temp: temparature.toStringAsFixed(2) + '°C',
                    );
                  }),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
