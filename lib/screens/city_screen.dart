import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  CityScreenState createState() => CityScreenState();
}

class CityScreenState extends State<CityScreen> {
  final _controller = TextEditingController();
  late String cityName;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title:  TextField(
            onChanged: (value){
              cityName =value;
            },
            onSubmitted: (String locationName){
              setState(() {
                locationName = cityName;
                Navigator.pop(context,locationName);
              });
            },
            controller: _controller,
            autofocus: true,
            style: const TextStyle(fontSize: 20),
            decoration: const InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
                focusedBorder: InputBorder.none
            ),
          ),
          actions: [
            IconButton(
                icon: const Icon(Icons.close),
                onPressed: () async{
                  _controller.clear();
                  //Navigator.pop(context,cityName);
                }
            )
          ],
        ),
      ),
    );
  }
}
