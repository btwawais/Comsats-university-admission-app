import 'package:cui_admission/screens/admission.dart';
import 'package:flutter/material.dart';

class AllCoursesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> courses = [
    {
      'title': 'Computer Engineering',
      'description':
          'Comprehensive program combining hardware design and software development principles',
      'image': 'images/imagec4.png',
      'duration': '4 Years',
      'credits': '140 Credits',
      'degree': 'BS',
      'faculty': 'Engineering',
    },
    {
      'title': 'Electrical Engineering',
      'description':
          'Focuses on power systems, electronics, and electrical circuit design',
      'image': 'images/imagec1.png',
      'duration': '4 Years',
      'credits': '140 Credits',
      'degree': 'BS',
      'faculty': 'Engineering',
    },
    {
      'title': 'Business Administration',
      'description':
          'Covers management strategies, financial analysis, and marketing techniques',
      'image': 'images/imagec3.png',
      'duration': '4 Years',
      'credits': '130 Credits',
      'degree': 'BBA',
      'faculty': 'Business',
    },
    {
      'title': 'Computer Science',
      'description':
          'In-depth study of algorithms, software development, and system architecture',
      'image': 'images/imagec4.png',
      'duration': '4 Years',
      'credits': '140 Credits',
      'degree': 'BS',
      'faculty': 'Computing',
    },
    {
      'title': 'Bioinformatics',
      'description':
          'Interdisciplinary program merging biology with computational analysis',
      'image': 'images/imagec2.png',
      'duration': '4 Years',
      'credits': '140 Credits',
      'degree': 'BS',
      'faculty': 'Sciences',
    },
    {
      'title': 'Architecture',
      'description':
          'Professional degree focusing on architectural design and urban planning',
      'image': 'images/imagec1.png',
      'duration': '5 Years',
      'credits': '170 Credits',
      'degree': 'B.Arch',
      'faculty': 'Architecture',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF2E5BFF),
        title: Text(
          'COMSATS University Programs',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdmissionForm()),
              );
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: AssetImage(courses[index]['image']),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                courses[index]['title'],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[900],
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                courses[index]['faculty'],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.blue[700],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Text(
                      courses[index]['description'],
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                        height: 1.4,
                      ),
                    ),
                    SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildInfoChip(
                            Icons.school,
                            courses[index]['degree'],
                          ),
                          SizedBox(width: 8),
                          _buildInfoChip(
                            Icons.schedule,
                            courses[index]['duration'],
                          ),
                          SizedBox(width: 8),
                          _buildInfoChip(
                            Icons.assignment,
                            courses[index]['credits'],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Keep your existing _buildInfoChip method
  Widget _buildInfoChip(IconData icon, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.blue[800]),
          SizedBox(width: 6),
          Text(text, style: TextStyle(fontSize: 14, color: Colors.blue[900])),
        ],
      ),
    );
  }
}
