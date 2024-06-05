import 'package:flutter/material.dart';
import 'package:wclimate/utils/frosted_glass.dart';
import 'package:wclimate/screens/location_screen.dart';

class PanelWidget extends StatefulWidget {
  final ScrollController controller;
  final dynamic humidity;
  final dynamic feelTemp;
  final dynamic speed;
  final dynamic weatherDescription;
  final dynamic visibility;
  final dynamic pressure;
  const PanelWidget(
      {super.key,
      required this.controller,
      this.humidity,
      this.feelTemp,
      this.speed,
      this.weatherDescription,
      this.visibility,
      this.pressure});

  @override
  State<PanelWidget> createState() => PanelWidgetState();
}

class PanelWidgetState extends State<PanelWidget> {
  LocationScreen locationScreen = const LocationScreen();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.only(top: 50),
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FrostedGlass(
              width: 50,
              height: 50,
              child: Column(
                children: [
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    'Feels like',
                    style: TextStyle(color: Colors.grey[200], fontSize: 18),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Text(
                    '${widget.feelTemp}°C',
                    style: TextStyle(color: Colors.grey[100], fontSize: 40),
                  ),
                ],
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FrostedGlass(
            width: 50,
            height: 50,
            child: Column(
              children: [
                const SizedBox(
                  height: 18,
                ),
                Text(
                  'Humidity',
                  style: TextStyle(color: Colors.grey[200], fontSize: 18),
                ),
                const SizedBox(
                  height: 28,
                ),
                Text(
                  '${widget.humidity}%',
                  style: TextStyle(color: Colors.grey[100], fontSize: 40),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FrostedGlass(
            width: 50,
            height: 50,
            child: Column(
              children: [
                const SizedBox(
                  height: 18,
                ),
                Text(
                  'Wind',
                  style: TextStyle(color: Colors.grey[200], fontSize: 18),
                ),
                const SizedBox(
                  height: 28,
                ),
                Text(
                  '${widget.speed}Km/h',
                  style: TextStyle(color: Colors.grey[100], fontSize: 38),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FrostedGlass(
            width: 50,
            height: 50,
            child: Column(
              children: [
                const SizedBox(
                  height: 18,
                ),
                Text(
                  'Description',
                  style: TextStyle(color: Colors.grey[200], fontSize: 18),
                ),
                const SizedBox(
                  height: 28,
                ),
                Text(
                  '${widget.weatherDescription}',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[100], fontSize: 32),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FrostedGlass(
            width: 50,
            height: 50,
            child: Column(
              children: [
                const SizedBox(
                  height: 18,
                ),
                Text(
                  'Visibility',
                  style: TextStyle(color: Colors.grey[200], fontSize: 18),
                ),
                const SizedBox(
                  height: 28,
                ),
                Text(
                  '${widget.visibility}km',
                  style: TextStyle(color: Colors.grey[100], fontSize: 40),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FrostedGlass(
            width: 50,
            height: 50,
            child: Column(
              children: [
                const SizedBox(
                  height: 18,
                ),
                Text(
                  'Air Pressure',
                  style: TextStyle(color: Colors.grey[200], fontSize: 18),
                ),
                const SizedBox(
                  height: 28,
                ),
                Text(
                  '${widget.pressure} hPa',
                  style: TextStyle(color: Colors.grey[100], fontSize: 34),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
