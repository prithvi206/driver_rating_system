import 'package:driver_profiling_system/screen/RadialGuage.dart';
import 'package:flutter/material.dart';

class Trip extends StatefulWidget {
  const Trip({super.key});

  @override
  State<Trip> createState() => _TripState();
}

class _TripState extends State<Trip> {
  @override
  Widget build(BuildContext context) {
    return SpeedometerScreen();
  }
}
