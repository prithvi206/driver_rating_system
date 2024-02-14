// ignore_for_file: library_private_types_in_public_api
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:url_launcher/url_launcher.dart';

class SpeedometerScreen extends StatefulWidget {
  @override
  _SpeedometerScreenState createState() => _SpeedometerScreenState();
}

class _SpeedometerScreenState extends State<SpeedometerScreen> {
  Stopwatch _stopwatch = Stopwatch();
  late Timer _timer;
  String _elapsedTime = '00:00:00';
  final Uri _origin = Uri.parse("https://maps.app.goo.gl/BB8W4RL3Jj99R9W79");
  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  void initState() {
    super.initState();
    _startStopwatch();
  }

  void _startStopwatch() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_stopwatch.isRunning) {
        setState(() {
          _elapsedTime = _formatDuration(_stopwatch.elapsed);
        });
      }
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  void _resetStopwatch() {
    setState(() {
      _stopwatch.reset();
      _elapsedTime = '00:00:00';
    });
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  // Replace this with your time data stream
  final List<List<dynamic>> Guages = [
    ['Speed', 90.0, 0.0, 240.0],
    ['EngineTemp', 100.0, 0.0, 125.0],
    ['Mass Air Flow', 35.6, 0.0, 100.0],
    ['Engine RPM', 4000.0, 0.0, 8000.0],
    ['Throttle Position', 48.0, 0.0, 100.0],
    ['O2 sensor', 23.4, 0.0, 100.0]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
       
        title: const Text(
          'Trip',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _elapsedTime,
                  style: TextStyle(fontSize: 36),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (_stopwatch.isRunning) {
                            _stopwatch.stop();
                          } else {
                            _stopwatch.start();
                          }
                        });
                      },
                      child:
                          Text(_stopwatch.isRunning ? 'Pause' : 'Start Trip'),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: _resetStopwatch,
                      child: Text('End Trip'),
                    )
                  ],
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Flexible(
                  child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 300,
                        childAspectRatio: 1,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: Guages.length,
                      itemBuilder: (_, index) {
                        double value = Guages[index][1];
                        double min = Guages[index][2];
                        double max = Guages[index][3];
                        return SfRadialGauge(
                            enableLoadingAnimation: true,
                            animationDuration: 4500,
                            title: GaugeTitle(
                                text: Guages[index][0],
                                textStyle: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)),
                            axes: <RadialAxis>[
                              RadialAxis(
                                  minimum: min,
                                  maximum: max,
                                  axisLineStyle: const AxisLineStyle(
                                    thickness: 0.1,
                                    thicknessUnit: GaugeSizeUnit.factor,
                                  ),
                                  pointers: <GaugePointer>[
                                    RangePointer(
                                      enableAnimation: true,
                                      value: Guages[index][1],
                                      width: 0.1,
                                      sizeUnit: GaugeSizeUnit.factor,
                                      gradient: const SweepGradient(
                                        colors: <Color>[
                                          Colors.green,
                                          Colors.orange,
                                          Colors.red
                                        ],
                                        stops: <double>[0.50, 0.75, 1.0],
                                      ),
                                    )
                                  ],
                                  annotations: <GaugeAnnotation>[
                                    GaugeAnnotation(
                                        widget: Column(
                                          children: [
                                            Container(
                                                margin:
                                                    const EdgeInsets.all(10),
                                                child: Text('$value',
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                          ],
                                        ),
                                        angle: 90,
                                        positionFactor: 0.5)
                                  ])
                            ]);
                      }),
                )),
            Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  color: Colors.indigo[300],
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: const Text(
                    "General",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Trip Id:',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo[900]),
                        ),
                        const SizedBox(
                            width: 10), // Add some space between the texts
                        const Text(
                          '5',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Date",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Start Date:",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.indigo[900]),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        const Text(
                          "9-12-2023",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Origin",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Departure Time:",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.indigo[900]),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        const Text(
                          "12:30 PM",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Origin Location:",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.indigo[900]),
                        ),
                      ],
                    ),
                    InkWell(
                      child: const Text(
                        "https://maps.app.goo.gl/BB8W4RL3Jj99R9W79",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () => _launchUrl(_origin),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Destination",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Car Details",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Car Number Plate:",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.indigo[900]),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        const Text(
                          "KA 09 MC 6996",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Car Company:",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.indigo[900]),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        const Text(
                          "Nissan",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Car Model:",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.indigo[900]),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        const Text(
                          "Magnite",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Build Year:",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.indigo[900]),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        const Text(
                          "2021",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Driver Details",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Driver Name:",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.indigo[900]),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        const Text(
                          "Akhil Rasheed",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Phone Number:",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.indigo[900]),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        const Text(
                          "7026521395",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 300,
                    )
                  ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
