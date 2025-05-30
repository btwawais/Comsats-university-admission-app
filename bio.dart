import 'package:flutter/material.dart';
import 'package:cui_admission/screens/admission.dart';
import 'package:cui_admission/utils/color.dart';


class Bio extends StatefulWidget {
  const Bio({super.key});

  @override
  State<Bio> createState() => _BioState();
}

class _BioState extends State<Bio> {
  int _selectedTab = 0; // 0 for Bio, 1 for Scope
  String _selectedDiscipline = 'BioScience'; // Default selection

  // Scope information for each bio discipline
  final Map<String, String> _scopeInfo = {
    'BioScience': '''
BioScience graduates from COMSATS have excellent career prospects in:

• Pharmaceutical Industry (Getz Pharma, Hilton Pharma)
• Biotechnology Firms
• Research Laboratories
• Environmental Conservation
• Food Science & Technology
• Healthcare & Diagnostics
• Agriculture Development
• Academic Research

Average starting salary: PKR 70,000 - 110,000
Top employers: Aga Khan Hospital, Shaukat Khanum, NIH, PARCO
''',
    'BioInformatics': '''
BioInformatics graduates from COMSATS can work in:

• Genomic Data Analysis
• Drug Discovery & Development
• Biomedical Research
• Computational Biology
• Healthcare IT Solutions
• Biotechnology Startups
• Academic Research
• Pharmaceutical Analytics

Average starting salary: PKR 80,000 - 130,000
Top employers: NIBGE, CEMB, PCSIR, BIONET
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
                    // BioScience Card
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedDiscipline = 'BioScience';
                          });
                        },
                        child: Card(
                          color: _selectedDiscipline == 'BioScience'
                              ? Appcolors().forth.withOpacity(0.1)
                              : Colors.white,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: _selectedDiscipline == 'BioScience'
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
                                      image: AssetImage('images/imageb1.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'BioScience',
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
                    // BioInformatics Card
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedDiscipline = 'BioInformatics';
                          });
                        },
                        child: Card(
                          color: _selectedDiscipline == 'BioInformatics'
                              ? Appcolors().forth.withOpacity(0.1)
                              : Colors.white,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: _selectedDiscipline == 'BioInformatics'
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
                                      image: AssetImage('images/imagec2.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'BioInformatics',
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
                      'Biological Sciences Department',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'For admission queries contact:',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'biosciences@comsats.edu.pk\n+92-51-9247222',
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
