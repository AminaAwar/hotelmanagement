import 'package:flutter/material.dart';
import 'package:hotel_menu/booking_detail_page.dart';
 

class TablePage extends StatefulWidget {
  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Table'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () {
              print('Calendar icon pressed');
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              print('Profile icon pressed');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(16.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 0.75,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigate to booking details page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookingDetailPage(tableName: 'Table ${index + 1}'),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Table ${index + 1}',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Description for Table ${index + 1}',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
