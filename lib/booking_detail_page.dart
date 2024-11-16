import 'package:flutter/material.dart';
import 'package:hotel_menu/login_page.dart';

class BookingDetailPage extends StatelessWidget {
  final String tableName;

  BookingDetailPage({required this.tableName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Details'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today, color: Colors.black),
            onPressed: () {
              print('Calendar icon pressed');
            },
          ),
          IconButton(
            icon: Icon(Icons.person, color: Colors.black),
            onPressed: () {
              print('Profile icon pressed');
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Booking Details for $tableName',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              Container(
                width: 200, // Increased width
                height: 120, // Increased height
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Name: $tableName',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Description of booking.',
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Select Date',
                  border: OutlineInputBorder(),
                ),
                items: [
                  DropdownMenuItem(value: '2024-10-28', child: Text('October 28, 2024')),
                  DropdownMenuItem(value: '2024-10-29', child: Text('October 29, 2024')),
                ],
                onChanged: (value) {
                  print('Selected date: $value');
                },
              ),
              SizedBox(height: 30),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Select Time',
                  border: OutlineInputBorder(),
                ),
                items: [
                  DropdownMenuItem(value: '12:00 PM', child: Text('12:00 PM')),
                  DropdownMenuItem(value: '1:00 PM', child: Text('1:00 PM')),
                ],
                onChanged: (value) {
                  print('Selected time: $value');
                },
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the availability page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AvailabilityPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Set the button color to blue
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Curved corners
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32), // Increased padding
                  minimumSize: Size(250, 65), // Minimum size for the button
                ),
                child: Text(
                  'Check Availability',
                  style: TextStyle(color: Colors.white, fontSize: 20), // Set text color to white
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AvailabilityPage extends StatefulWidget {
  @override
  _AvailabilityPageState createState() => _AvailabilityPageState();
}

class _AvailabilityPageState extends State<AvailabilityPage> {
  final String selectedHotelName = "Hotel"; // Example hotel name
  final String selectedLocationName = "New York"; // Example location name
  final IconData hotelIcon = Icons.hotel; // Icon for hotel
  final IconData locationIcon = Icons.location_on; // Icon for location
  final IconData calendarIcon = Icons.calendar_today; // Icon for date selection
  final IconData clockIcon = Icons.access_time; // Icon for time selection

  bool _isLoading = false; // Loading state
  bool? _isAvailable; // Availability state

  void _checkAvailability() async {
    setState(() {
      _isLoading = true;
      _isAvailable = null; // Reset availability state
    });

    // Simulate a network call
    await Future.delayed(Duration(seconds: 2));

    // Simulate availability check (true or false)
    bool availability = DateTime.now().second % 2 == 0; // Just an example

    setState(() {
      _isLoading = false;
      _isAvailable = availability;
    });
  }

  void _bookAppointment() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PaymentDetailPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Availability'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today, color: Colors.black),
            onPressed: () {
              print('Calendar icon pressed');
            },
          ),
          IconButton(
            icon: Icon(Icons.person, color: Colors.black),
            onPressed: () {
              print('Profile icon pressed');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Availability Checking',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: _buildInputField(hotelIcon, 'Selected Hotel', selectedHotelName),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: _buildInputField(locationIcon, 'Selected Location', selectedLocationName),
                ),
              ],
            ),
            SizedBox(height: 16),
            _buildDateTimeField(calendarIcon, 'Selected Date', 'Select Date'),
            SizedBox(height: 16),
            _buildDateTimeField(clockIcon, 'Selected Time', 'Select Time'),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: _buildInfoCard('Hotel'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    print('Change info pressed');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  child: Text(
                    'Change',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Book Later Button
            Center(
              child: SizedBox(
                width: 250,
                height: 65,
                child: ElevatedButton(
                  onPressed: () {
                    print('Book Later pressed');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Add to Book Later',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Availability Button
            Center(
              child: SizedBox(
                width: 250,
                height: 65,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _checkAvailability,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Check Availability',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            if (_isLoading)
              Center(child: CircularProgressIndicator())
            else if (_isAvailable != null)
              _isAvailable!
                  ? Column(
                      children: [
                        Text(
                          'Your time slot is available.',
                          style: TextStyle(fontSize: 20, color: Colors.green),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16),
                        SizedBox(
                          width: 180,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: _bookAppointment,
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              'Book Appointment',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Text(
                          'Your time slot is not available.',
                          style: TextStyle(fontSize: 20, color: Colors.red),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            print('Back to select another time slot');
                            // Logic to go back or select another time slot
                          },
                          child: Text('Select Another Time Slot'),
                        ),
                      ],
                    ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(IconData icon, String label, String hint) {
    return Row(
      children: [
        Icon(icon, size: 24),
        SizedBox(width: 8),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              labelText: label,
              border: OutlineInputBorder(),
              hintText: hint,
              contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateTimeField(IconData icon, String label, String hint) {
    return Row(
      children: [
        Icon(icon, size: 24),
        SizedBox(width: 8),
        Expanded(
          child: TextField(
            readOnly: true,
            decoration: InputDecoration(
              labelText: label,
              border: OutlineInputBorder(),
              hintText: hint,
              contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
            ),
          ),
        ),
        SizedBox(width: 8),
        ElevatedButton(
          onPressed: () {
            print('Change $label pressed');
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
          ),
          child: Text(
            'Change',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard(String title) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}


class PaymentDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Details'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today, color: Colors.black),
            onPressed: () {
              // Handle calendar icon tap
            },
          ),
          IconButton(
            icon: Icon(Icons.person, color: Colors.black),
            onPressed: () {
              // Handle profile icon tap
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInputField(
                  icon: Icons.hotel,
                  label: 'Selected Hotel',
                ),
                _buildInputField(
                  icon: Icons.location_on,
                  label: 'Selected Location',
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInputField(
                  icon: Icons.calendar_today,
                  label: 'Selected Date',
                ),
                _buildInputField(
                  icon: Icons.access_time,
                  label: 'Selected Time',
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.person),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Selected Table',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                    ),
                    style: TextStyle(height: 1.2),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildChargeRow('Booking Charge:', 'INR500'),
                _buildChargeRow('Service Charge:', 'INR500'),
                _buildChargeRow('Coupon Code:', '10% discount'),
                _buildChargeRow('Discount Amount:', 'INR100'),
                _buildChargeRow('Total Amount:', 'INR400'),
              ],
            ),
            SizedBox(height: 30),
            Column(
              children: [
                _buildButton('Add to Book Later', onPressed: () {
                  // Handle the "Add to Book Later" action
                }),
                SizedBox(height: 20),
                _buildButton('Proceed to Payment', onPressed: () {
                  // Navigate to Booking Done page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BookingDonePage()),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({required IconData icon, required String label}) {
    return Expanded(
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                labelText: label,
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
              ),
              style: TextStyle(height: 1.2),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChargeRow(String title, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(width: 4),
          Text(amount, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildButton(String title, {VoidCallback? onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}


class BookingDonePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today, color: Colors.black),
            onPressed: () {
              // Handle calendar icon press
            },
          ),
          IconButton(
            icon: Icon(Icons.person, color: Colors.black),
            onPressed: () {
              // Handle profile icon press
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Booking confirmed!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoBox('Selected Hotel', Icons.hotel),
                _buildInfoBox('Selected Location', Icons.location_on),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoBox('Selected Date', Icons.calendar_today),
                _buildInfoBox('Selected Time', Icons.access_time),
              ],
            ),
            SizedBox(height: 20),
            _buildSingleFieldBox('Selected Table', Icons.person),
            SizedBox(height: 20),
            Center(
              child: _buildQrCodeCard('Your QR Code Here'),
            ),
            SizedBox(height: 20),
            _buildBookingInfo(),
            SizedBox(height: 20), // Space before the button
            Center(
              child: _buildBackHomeButton(context), // Centered button
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBox(String title, IconData icon) {
    return Expanded(
      child: Row(
        children: [
          Icon(icon, size: 24),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 0.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              constraints: BoxConstraints(
                minHeight: 48.0,
              ),
              child: Text(
                title,
                style: TextStyle(fontSize: 18),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSingleFieldBox(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 24),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 0.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            constraints: BoxConstraints(
              minHeight: 48.0,
            ),
            child: Text(
              title,
              style: TextStyle(fontSize: 18),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQrCodeCard(String qrCodeText) {
    return Card(
      color: Colors.green,
      child: Container(
        width: 150,
        height: 150,
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            qrCodeText,
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
      ),
    );
  }

  Widget _buildBookingInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Booking reference ID: DMM141020240001',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          'Kindly report to reception at least 15 minutes before.',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

 Widget _buildBackHomeButton(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: Colors.blue, // Blue background color
      onPrimary: Colors.white, // White text color
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 32.0), // Increased padding
      fixedSize: Size(200, 60), // Set a fixed size for the button
      shape: RoundedRectangleBorder( // Change the shape to a rounded rectangle
        borderRadius: BorderRadius.circular(8), // Set a curvature for the corners
      ),
    ),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>LoginPage()), // Navigate to LocationDetailPage
      );
    },
    child: Text(
      'Go Back Home',
      style: TextStyle(fontSize: 18), // Increase text size if needed
    ),
  );
}


}


