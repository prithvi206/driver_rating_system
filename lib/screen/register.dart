import 'package:flutter/material.dart';
import 'package:driver_profiling_system/screen/dashboard.dart';
import 'package:driver_profiling_system/screen/login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _carCompanyController = TextEditingController();
  TextEditingController _carModelController = TextEditingController();
  TextEditingController _numberPlateController = TextEditingController();
  TextEditingController _registerPasswordController = TextEditingController();
  TextEditingController _rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
             
              const SizedBox(height: 20),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person, color: Colors.indigo),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone, color: Colors.indigo),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _carCompanyController,
                decoration: InputDecoration(
                  labelText: 'Car Company',
                  border: const OutlineInputBorder(),
                  prefixIcon: Icon(Icons.directions_car_filled_sharp, color: Colors.indigo),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _carModelController,
                decoration: const InputDecoration(
                  labelText: 'Car Model',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.directions_car, color: Colors.indigo),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _numberPlateController,
                decoration: const InputDecoration(
                  labelText: 'Number Plate',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.format_list_numbered, color: Colors.indigo),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _registerPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock, color: Colors.indigo),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _rePasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Re-enter Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock, color: Colors.indigo),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Perform registration logic here
                  String name = _nameController.text;
                  String phone = _phoneController.text;
                  String carCompany = _carCompanyController.text;
                  String carModel = _carModelController.text;
                  String numberPlate = _numberPlateController.text;
                  String password = _registerPasswordController.text;
                  String rePassword = _rePasswordController.text;

                  // For now, navigate to the dashboard
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Dashboard()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  elevation: 5, // Add elevation
                ),
                child: const Text('Register',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  // Navigate to the login page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: const Text(
                  'Already have an account? Login',
                  style: TextStyle(color: Colors.indigo),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
