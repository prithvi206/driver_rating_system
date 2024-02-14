import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PreviousTripPage extends StatelessWidget {
  const PreviousTripPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Uri _origin = Uri.parse("https://maps.app.goo.gl/BB8W4RL3Jj99R9W79");
    Future<void> _launchUrl(Uri url) async {
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    }

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: const Text(
            "Trip Summary",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          )),
      body: SingleChildScrollView(
        child: Column(children: [
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
                  color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
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
                  const SizedBox(width: 10), // Add some space between the texts
                  const Text(
                    '4',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Duration",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.indigo[900]),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  const Text(
                    "3569 seconds",
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
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Arrival Time:",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.indigo[900]),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  const Text(
                    "1:30 PM",
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
                    "Destination Location:",
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
                  "Car Details",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
            ]),
          ),
          const SizedBox(height: 30,),
           Container(
            padding: const EdgeInsets.all(5.0),
            color: Colors.indigo[300],
            alignment: Alignment.center,
            width: double.infinity,
            child: const Text(
              "Trip Analytics",
              style: TextStyle(
                  color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
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
                    'Distance Covered:',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo[900]),
                  ),
                  const SizedBox(width: 10), // Add some space between the texts
                  const Text(
                    '6.9 Km',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Driver Rating:',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo[900]),
                  ),
                  const SizedBox(width: 10), // Add some space between the texts
                  const Text(
                    '6.9',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Speed",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Maximum Speed:",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.indigo[900]),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  const Text(
                    "72 Km/h",
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
                    "Average Speed:",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.indigo[900]),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  const Text(
                    "48 Km/h",
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
                  "Engine RPM",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Maximum RPM:",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.indigo[900]),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  const Text(
                    "4000 RPM",
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
                    "Average RPM:",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.indigo[900]),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  const Text(
                    "2093 RPM",
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
                  "Engine Temperature",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Maximum Engine Temperature:",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.indigo[900]),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  const Text(
                    "110 C",
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
                    "Average Engine Temperature:",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.indigo[900]),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  const Text(
                    "97 C",
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
                  "Throttle",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Maximum Throttle:",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.indigo[900]),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  const Text(
                    "15%",
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
                    "Average Throttle:",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.indigo[900]),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  const Text(
                    "9%",
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
                  "Mass Air Flow",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Maximum Mass Air Flow:",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.indigo[900]),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  const Text(
                    "79 g/s",
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
                    "Average Mass Air Flow:",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.indigo[900]),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  const Text(
                    "57 g/s",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 280,)
            ],),),
          
        ]),
      ),
    );
  }
}
