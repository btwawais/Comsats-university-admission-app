import 'package:flutter/material.dart';
import 'package:cui_admission/screens/admission.dart';
import 'package:cui_admission/utils/color.dart';
import 'package:cui_admission/widgets/text.dart';

class Business extends StatefulWidget {
  const Business({super.key});

  @override
  State<Business> createState() => _BusinessState();
}

class _BusinessState extends State<Business> {
  int _selectedTab = 0; // 0 for Bio, 1 for Scope
  String _selectedProgram = 'MBA'; // Default selection

  // Scope information for each business program
  final Map<String, String> _scopeInfo = {
    'MBA': '''
MBA graduates from COMSATS have excellent career prospects in:

• Corporate Management (CEOs, Directors, Managers)
• Financial Services (Banks, Investment Firms)
• Marketing & Brand Management
• Entrepreneurship & Startups
• Consulting Services
• Human Resource Management
• Supply Chain & Operations
• International Business

Average starting salary: PKR 120,000 - 200,000
Top employers: Unilever, Nestle, Jazz, Telenor, McKinsey
''',
    'BBA': '''
BBA graduates from COMSATS can work in:

• Business Administration
• Sales & Marketing
• Banking & Finance
• Retail Management
• Customer Relationship Management
• Small Business Management
• Human Resources
• Operations Management

Average starting salary: PKR 60,000 - 100,000
Top employers: Banks, Telecom Companies, FMCG, Retail Chains
'''
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Image
            Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  child: Image.asset(
                    'images/main.png',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              
              ],
            ),

            // Tab Buttons
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Bio Button
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedTab = 0;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _selectedTab == 0 ? Appcolors().forth : Colors.white,
                      foregroundColor:
                          _selectedTab == 0 ? Colors.white : Colors.black,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                    ),
                    child: Text('Bio'),
                  ),

                  // Scope Button
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedTab = 1;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _selectedTab == 1 ? Appcolors().forth : Colors.white,
                      foregroundColor:
                          _selectedTab == 1 ? Colors.white : Colors.black,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                    ),
                    child: Text('Scope'),
                  ),
                ],
              ),
            ),

            // Content Area
            if (_selectedTab == 0) ...[
              // Bio View (Programs)
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    // MBA Card
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedProgram = 'MBA';
                          });
                        },
                        child: Card(
                          color: _selectedProgram == 'MBA'
                              ? Appcolors().forth.withOpacity(0.1)
                              : Colors.white,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: _selectedProgram == 'MBA'
                                  ? Appcolors().forth
                                  : Colors.grey.shade300,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: AssetImage('images/busines.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'MBA',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AdmissionForm()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Appcolors().forth,
                                    foregroundColor: Colors.white,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text('Apply Now'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    // BBA Card
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedProgram = 'BBA';
                          });
                        },
                        child: Card(
                          color: _selectedProgram == 'BBA'
                              ? Appcolors().forth.withOpacity(0.1)
                              : Colors.white,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: _selectedProgram == 'BBA'
                                  ? Appcolors().forth
                                  : Colors.grey.shade300,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: AssetImage('images/busines2.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'BBA',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AdmissionForm()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Appcolors().forth,
                                    foregroundColor: Colors.white,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text('Apply Now'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ] else ...[
              // Scope View
              Padding(
                padding: EdgeInsets.all(16),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Scope of $_selectedProgram',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Appcolors().forth,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          _scopeInfo[_selectedProgram] ?? '',
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],

            // Footer Information
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: Appcolors().forth),
                ),
                child: Column(
                  children: [
                    Text(
                      'Business School Contact',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'For admission queries contact our business school:',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'business.school@comsats.edu.pk\n+92-51-9247333',
                      style: TextStyle(
                        fontSize: 14,
                        color: Appcolors().forth,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
    ),
    );
  }
}
