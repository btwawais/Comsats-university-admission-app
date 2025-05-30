import 'package:flutter/material.dart';
import 'package:cui_admission/screens/admission.dart';
import 'package:cui_admission/utils/color.dart';
import 'package:cui_admission/widgets/text.dart';

class Discipline extends StatefulWidget {
  const Discipline({super.key});

  @override
  State<Discipline> createState() => _DisciplineState();
}

class _DisciplineState extends State<Discipline> {
  int _selectedTab = 0; // 0 for Discipline, 1 for Scope
  String _selectedDiscipline = 'Computer Science'; // Default selection

  // Scope information for each discipline
  final Map<String, String> _scopeInfo = {
    'Computer Science': '''
Computer Science graduates from COMSATS have excellent career prospects in:
• Software Development
• Artificial Intelligence
• Data Science & Analytics
• Cybersecurity
• Cloud Computing
• Database Administration
• IT Consulting
• Research & Development

Average starting salary: PKR 80,000 - 120,000
Top employers: Systems Ltd, Techlogix, Arbisoft, Careem, Afiniti
''',
    'Software Engineering': '''
Software Engineering graduates from COMSATS can work in:
• Full-Stack Development
• Mobile App Development
• Software Architecture
• Quality Assurance
• DevOps Engineering
• Game Development
• Embedded Systems
• Project Management

Average starting salary: PKR 85,000 - 130,000
Top employers: Telenor, Jazz, Netsol, 10Pearls, Contour Software
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
                  // Discipline Button
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedTab = 0;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedTab == 0
                          ? Appcolors().forth
                          : Colors.white,
                      foregroundColor: _selectedTab == 0
                          ? Colors.white
                          : Colors.black,
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                    ),
                    child: Text('Discipline'),
                  ),
                  
                  // Scope Button
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedTab = 1;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedTab == 1
                          ? Appcolors().forth
                          : Colors.white,
                      foregroundColor: _selectedTab == 1
                          ? Colors.white
                          : Colors.black,
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
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
              // Discipline View
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    // Computer Science Card
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedDiscipline = 'Computer Science';
                          });
                        },
                        child: Card(
                          color: _selectedDiscipline == 'Computer Science'
                              ? Appcolors().forth.withOpacity(0.1)
                              : Colors.white,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: _selectedDiscipline == 'Computer Science'
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
                                      image: AssetImage('images/imaged1.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Computer Science',
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
                                          builder: (context) => AdmissionForm()),
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
                    // Software Engineering Card
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedDiscipline = 'Software Engineering';
                          });
                        },
                        child: Card(
                          color: _selectedDiscipline == 'Software Engineering'
                              ? Appcolors().forth.withOpacity(0.1)
                              : Colors.white,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: _selectedDiscipline == 'Software Engineering'
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
                                      image: AssetImage('images/imaged2.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Software Engineering',
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
                                          builder: (context) => AdmissionForm()),
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
                          'Scope of $_selectedDiscipline',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Appcolors().forth,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          _scopeInfo[_selectedDiscipline] ?? '',
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
                      'Need more information?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Contact our admission office at:',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'admissions@comsats.edu.pk\n+92-51-9247000',
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