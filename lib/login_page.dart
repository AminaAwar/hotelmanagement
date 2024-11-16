import 'package:flutter/material.dart';
import 'package:hotel_menu/table_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 8, 95, 246), Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login to your Account',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 40),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                  ),
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 24.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
                    padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                  ),
                  onPressed: () {
                    String email = emailController.text;
                    String password = passwordController.text;
                    print('Email: $email, Password: $password');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CustomerDetails()),
                    );
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 16.0),
                TextButton(
                  onPressed: () {
                    print('Navigate to Sign Up');
                  },
                  child: Text(
                    'Don’t have an account? Sign Up',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomerDetails extends StatefulWidget {
  @override
  _CustomerDetailsState createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Details'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: dobController,
              decoration: InputDecoration(
                labelText: 'Date of Birth (YYYY-MM-DD)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.datetime,
            ),
            SizedBox(height: 16.0),
            DropdownButton<String>(
              value: selectedGender,
              hint: Text('Select Gender'),
              isExpanded: true,
              items: ['Male', 'Female', 'Others'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedGender = newValue;
                });
              },
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blueAccent,
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LocationDetailsPage()),
                );
              },
              child: Text(
                'Next',
                style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LocationDetailsPage extends StatefulWidget {
  @override
  _LocationDetailsState createState() => _LocationDetailsState();
}

class _LocationDetailsState extends State<LocationDetailsPage> {
  String? selectedVisitType;
  String? selectedLocation1;
  String? selectedLocation2;
  String? selectedLocation3;
  String? selectedLocation4;

  final List<String> visitTypes = ['Tour', 'Adventure', 'Business'];
  final List<String> locations = ['Location 1', 'Location 2', 'Location 3', 'Location 4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Details'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Where do you want to visit?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            _buildDropdownField(
              value: selectedVisitType,
              hint: 'Select Visit Type',
              items: visitTypes,
              onChanged: (newValue) {
                setState(() {
                  selectedVisitType = newValue;
                });
              },
            ),
            SizedBox(height: 24.0),
            Text(
              'Which locations?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            _buildDropdownField(
              value: selectedLocation1,
              hint: 'Country',
              items: locations,
              onChanged: (newValue) {
                setState(() {
                  selectedLocation1 = newValue;
                });
              },
            ),
            SizedBox(height: 16.0),
            _buildDropdownField(
              value: selectedLocation2,
              hint: 'State',
              items: locations,
              onChanged: (newValue) {
                setState(() {
                  selectedLocation2 = newValue;
                });
              },
            ),
            SizedBox(height: 16.0),
            _buildDropdownField(
              value: selectedLocation3,
              hint: 'District',
              items: locations,
              onChanged: (newValue) {
                setState(() {
                  selectedLocation3 = newValue;
                });
              },
            ),
            SizedBox(height: 16.0),
            _buildDropdownField(
              value: selectedLocation4,
              hint: 'Place',
              items: locations,
              onChanged: (newValue) {
                setState(() {
                  selectedLocation4 = newValue;
                });
              },
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blueAccent,
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TablePage()),
                );
              },
              child: Text(
                'Next',
                style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownField({
  String? value,
  required String hint,
  required List<String> items,
  required ValueChanged<String?> onChanged,
}) {
  return InputDecorator(
    decoration: InputDecoration(
      labelText: hint,
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0), // Adjusted padding
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: value,
        isExpanded: true,
        hint: Text(hint),
        items: items.map<DropdownMenuItem<String>>((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    ),
  );
}

}
