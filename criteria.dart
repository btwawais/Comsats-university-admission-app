import 'package:flutter/material.dart';
import 'package:cui_admission/utils/color.dart';
import 'package:cui_admission/widgets/text.dart';

class CriteriaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Texts(
          data: "Admission Criteria",
          color: Appcolors().first,
          weight: FontWeight.bold,
          size: 20,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCriteriaCard(
              "Undergraduate Programs",
              [
                "Minimum 60% marks in FSc/HSSC or equivalent",
                "Entry test (conducted by COMSATS)",
                "70% weightage to academic marks, 30% to entry test",
                "Additional marks for Hafiz-e-Quran and sports achievements"
              ],
            ),
            SizedBox(height: 16),
            _buildCriteriaCard(
              "Graduate Programs (MS/MPhil)",
              [
                "16 years of education with minimum 2.5 CGPA",
                "GAT (General) with minimum 50% score",
                "Departmental test/interview for some programs",
                "Statement of Purpose and recommendation letters"
              ],
            ),
            SizedBox(height: 16),
            _buildCriteriaCard(
              "PhD Programs",
              [
                "18 years of education with minimum 3.0 CGPA",
                "GAT (Subject) with minimum 60% score",
                "Research publications in HEC recognized journals",
                "Interview with research committee"
              ],
            ),
            SizedBox(height: 16),
            _buildCriteriaCard(
              "International Students",
              [
                "Equivalent qualifications verified by IBCC",
                "Valid student visa",
                "English proficiency (TOEFL/IELTS if applicable)",
                "Equivalence certificate from HEC"
              ],
            ),
            SizedBox(height: 24),
            Text(
              "Important Notes:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Appcolors().first,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "- Admission criteria may vary slightly by program\n"
              "- All documents must be attested\n"
              "- Application deadlines are strictly enforced\n"
              "- Entry test exemptions available for some qualifications",
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCriteriaCard(String title, List<String> points) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Appcolors().first,
              ),
            ),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: points.map((point) => Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("• ", style: TextStyle(fontSize: 16)),
                    Expanded(child: Text(point, style: TextStyle(fontSize: 14))),
                  ],
                ),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }
}