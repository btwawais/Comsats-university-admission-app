import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cui_admission/utils/color.dart';
import 'package:cui_admission/widgets/text.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Texts(
          data: "Contact COMSATS",
          color: Appcolors().first,
          weight: FontWeight.bold,
          size: 20,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _buildContactCard(
              "Main Campus (Islamabad)",
              "Park Road, Tarlai Kalan, Islamabad",
              "+92-51-9247000",
              "admissions@comsats.edu.pk",
            ),
            SizedBox(height: 16),
            _buildContactCard(
              "Admission Office",
              "Ground Floor, Admin Block",
              "+92-51-9247000 (Ext. 234)",
              "admissions@comsats.edu.pk",
            ),
            SizedBox(height: 16),
            _buildContactCard(
              "Financial Aid Office",
              "First Floor, Admin Block",
              "+92-51-9247000 (Ext. 345)",
              "finaid@comsats.edu.pk",
            ),
            SizedBox(height: 16),
            _buildSocialMediaCard(),
            SizedBox(height: 16),
            _buildMapCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildContactCard(String title, String address, String phone, String email) {
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
            _buildContactRow(Icons.location_on, address),
            SizedBox(height: 8),
            _buildContactRow(Icons.phone, phone, isClickable: true),
            SizedBox(height: 8),
            _buildContactRow(Icons.email, email, isClickable: true),
          ],
        ),
      ),
    );
  }

  Widget _buildContactRow(IconData icon, String text, {bool isClickable = false}) {
    return GestureDetector(
      onTap: isClickable ? () {
        if (icon == Icons.phone) {
          _launchPhoneCall(text);
        } else if (icon == Icons.email) {
          _launchEmail(text);
        }
      } : null,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Appcolors().first),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: isClickable ? Colors.blue : Colors.black,
                decoration: isClickable ? TextDecoration.underline : null,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialMediaCard() {
    return Card(
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Connect With Us",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Appcolors().first,
              ),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildSocialIcon(Icons.facebook, "Facebook", () {
                  _launchURL("https://facebook.com/COMSATSOfficial");
                }),
                _buildSocialIcon(Icons.camera_alt, "Instagram", () {
                  _launchURL("https://instagram.com/comsats_official");
                }),
                _buildSocialIcon(Icons.link, "Website", () {
                  _launchURL("https://www.comsats.edu.pk");
                }),
                _buildSocialIcon(Icons.video_library, "YouTube", () {
                  _launchURL("https://youtube.com/COMSATSOfficial");
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String label, Function onTap) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon, size: 30, color: Appcolors().first),
          onPressed: onTap as void Function()?,
        ),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildMapCard(BuildContext context) {
    return Card(
      elevation: 3,
      child: Column(
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
            //  Center(
            //   child: Icon(Icons.map, size: 50, color: Colors.grey),
            // ),
          ),
        child:  Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  "Visit Our Campus",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Appcolors().first,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Park Road, Tarlai Kalan, Islamabad, Pakistan",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Appcolors().first,
                  ),
                  onPressed: () {
                    _launchMap();
                  },
                  child: Text("Open in Maps"),
                ),
              ],
            ),
          ),
       ) ],
      ),
    );
  }

  void _launchPhoneCall(String phoneNumber) async {
    final url = 'tel:${phoneNumber.replaceAll(RegExp(r'[^0-9+]'), '')}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchEmail(String email) async {
    final url = 'mailto:$email';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchMap() async {
    final url = 'https://maps.google.com/?q=COMSATS+University+Islamabad';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}