import 'package:flutter/material.dart';
import 'package:wclimate/utils/frosted_glass.dart';
import 'package:wclimate/screens/location_screen.dart';

class PanelWidget extends StatefulWidget {
  final ScrollController controller;
  const PanelWidget({Key? key, required this.controller}) : super(key: key);

  @override
  State<PanelWidget> createState() => PanelWidgetState();
}
class PanelWidgetState extends State<PanelWidget> {
  LocationScreen locationScreen = const LocationScreen();

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
                    '26°C',
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
            child:  Column(
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
                  '36%',
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
            child:  Column(
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
                  '4 Km/h',
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
            child:  Column(
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
                  'Clear sky',
                  style: TextStyle(color: Colors.grey[100], fontSize: 34),
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
            child:  Column(
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
                  '10 km',
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
            child:  Column(
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
                  '1008 hPa',
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