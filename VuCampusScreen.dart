import 'package:flutter/material.dart';
import 'package:cui_admission/utils/color.dart';
import 'package:cui_admission/widgets/text.dart';

class VuCampusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Texts(
          data: "Virtual University Campus",
          color: Appcolors().first,
          weight: FontWeight.bold,
          size: 16,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _buildInfoCard(
              "About Virtual Campus",
              "images/vu_images.jpg",
              "COMSATS Virtual Campus provides online learning resources, lecture recordings, and digital library access to all enrolled students.",
            ),
            SizedBox(height: 16),
            _buildFeatureCard("Virtual Campus Features", [
              "24/7 access to course materials",
              "Online lecture recordings",
              "Digital library with 50,000+ resources",
              "Discussion forums with faculty",
              "Online assignment submission",
              "Virtual labs for engineering students",
            ]),
            SizedBox(height: 16),
            _buildContactCard(
              "Virtual Campus Support",
              "support@comsats.edu.pk",
              "+92-51-9247000 (Ext. 123)",
              "Monday-Friday: 8AM to 8PM",
            ),
            SizedBox(height: 16),
            _buildLoginButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String imagePath, String description) {
    return Card(
      elevation: 3,
      child: Column(
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Appcolors().first,
                  ),
                ),
                SizedBox(height: 8),
                Text(description, style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(String title, List<String> features) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Appcolors().first,
              ),
            ),
            SizedBox(height: 8),
            Column(
              children:
                  features
                      .map(
                        (feature) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: Colors.green,
                                size: 18,
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  feature,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactCard(
    String title,
    String email,
    String phone,
    String hours,
  ) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Appcolors().first,
              ),
            ),
            SizedBox(height: 12),
            _buildContactRow(Icons.email, email),
            SizedBox(height: 8),
            _buildContactRow(Icons.phone, phone),
            SizedBox(height: 8),
            _buildContactRow(Icons.access_time, hours),
          ],
        ),
      ),
    );
  }

  Widget _buildContactRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Appcolors().first),
        SizedBox(width: 12),
        Text(text, style: TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Appcolors().first,
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () {},
      child: Text(
        "Access Virtual Campus",
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
