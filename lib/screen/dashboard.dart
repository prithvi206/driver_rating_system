import 'package:driver_profiling_system/screen/Help.dart';
import 'package:driver_profiling_system/screen/NewTripPage.dart';
import 'package:driver_profiling_system/screen/PreviousTripPage.dart';
import 'package:driver_profiling_system/screen/register.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List _previousTrips = ['4', '3', '2', '1'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          'Dashboard',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
         actions: [
          IconButton(
            icon: Icon(Icons.help,color: Colors.white,),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HelpPage()));
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            margin: const EdgeInsets.all(8.0),
            width: double.infinity,
            child: GestureDetector(
              onTap: () {
                  Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Trip()));
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      const Column(
                        children: [
                          Text('Start A Trip',
                              style: TextStyle(
                                  fontSize: 35, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_circle_right,
                          color: Colors.green,
                          size: 72,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Trip()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(children: [
            Container(
              child: const Text(
                "Previous Trips",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _previousTrips.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PreviousTripPage()));
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(26.0),
                      child: Column(
                        children: [
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
                  const SizedBox(width: 10), // Add some space between the texts
                   Text(
                    _previousTrips[index],
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
                          Row(
                            children: [Column(
                              children: [  Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Distance Covered:',
                                              style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo[900]),
                                            ),
                                            const SizedBox(width: 10), // Add some space between the texts
                                            const Text(
                                              '6.9 Km',
                                              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Driver Rating:',
                                              style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo[900]),
                                            ),
                                            const SizedBox(width: 10), // Add some space between the texts
                                            const Text(
                                              '6.9',
                                              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),],
                            ),
                            SizedBox(width: 10,),
                            Column(children: [
                              Row(
                                          children: [
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Start Date:",
                                              style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.indigo[900]),
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            const Text(
                                              "9-12-2023",
                                              style: TextStyle(
                          fontSize: 10,
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
                                              "Car Number Plate:",
                                              style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.indigo[900]),
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            const Text(
                                              "KA 09 MC 6996",
                                              style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                            ],)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ])
        ]),
      ),
    );
  }
}
