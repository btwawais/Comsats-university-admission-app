import 'package:flutter/material.dart';

class MeassageScreen extends StatefulWidget {
  @override
  _MeassageScreenState createState() => _MeassageScreenState();
}

class _MeassageScreenState extends State<MeassageScreen> {
  List<Message> messages = [];
  TextEditingController _controller = TextEditingController();
  bool _showMainMenu = true;

  // @override
  // void initState() {
  //   super.initState();
  //   _showMainMenuMessage();
  // }
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _showMainMenuMessage();
  }

  void _showMainMenuMessage() {
    _addBotMessage("Welcome to COMSATS University Admission Assistant!\n\n"
        "Please select an option by entering the corresponding number:\n"
        "1. Scholarship Details\n"
        "2. Admission Requirements\n"
        "3. Fee Structure\n"
        "4. Offered Courses\n"
        "5. Marks Criteria\n"
        "6. Contact Information\n"
        "7. Application Process\n"
        "8. Important Dates");
    _showMainMenu = true;
  }

  void _addBotMessage(String text) {
    setState(() {
      messages.add(Message(
        text: text,
        isUser: false,
        timestamp: DateTime.now(),
      ));
    });
  }

  void _addUserMessage(String text) {
    setState(() {
      messages.add(Message(
        text: text,
        isUser: true,
        timestamp: DateTime.now(),
      ));
    });
  }

  void _handleOptionSelection(String input) {
    int? option = int.tryParse(input);

    if (option == null || option < 0 || option > 8) {
      _addBotMessage("Invalid option. Please enter a number between 1-8.");
      _showMainMenuMessage();
      return;
    }

    _addUserMessage(input);

    if (_showMainMenu) {
      _handleMainMenuOption(option);
    } else {
      _handleSubMenuOption(option);
    }
  }

  void _handleMainMenuOption(int option) {
    switch (option) {
      case 1:
        _addBotMessage("COMSATS University Scholarship Details:\n\n"
            "1. Need-Based Scholarships\n"
            "2. Merit Scholarships\n"
            "3. HEC Need-Based Scholarships\n"
            "4. Sports Scholarships\n"
            "5. Faculty Scholarships\n\n"
            "Please select a scholarship type for more details (1-5):");
        _showMainMenu = false;
        break;
      case 2:
        _addBotMessage("Admission Requirements:\n\n"
            "1. Undergraduate Programs\n"
            "2. Graduate Programs\n"
            "3. PhD Programs\n"
            "4. International Students\n\n"
            "Please select a program type for specific requirements (1-4):");
        _showMainMenu = false;
        break;
      case 3:
        _addBotMessage("Fee Structure for 2023-2024:\n\n"
            "1. Undergraduate Programs\n"
            "2. Graduate Programs\n"
            "3. PhD Programs\n"
            "4. Additional Charges\n\n"
            "Please select a category for detailed fee structure (1-4):");
        _showMainMenu = false;
        break;
      case 4:
        _addBotMessage("COMSATS University offers the following programs:\n\n"
            "1. Engineering Programs\n"
            "2. Computer Science Programs\n"
            "3. Business Administration\n"
            "4. Architecture\n"
            "5. Social Sciences\n\n"
            "Please select a category for detailed programs (1-5):");
        _showMainMenu = false;
        break;
      case 5:
        _addBotMessage("Marks Criteria:\n\n"
            "1. Undergraduate Programs\n"
            "2. Graduate Programs\n"
            "3. PhD Programs\n\n"
            "Please select a program type for marks criteria (1-3):");
        _showMainMenu = false;
        break;
      case 6:
        _addBotMessage("Contact Information:\n\n"
            "Admission Office: +92-51-9247000\n"
            "Email: admissions@comsats.edu.pk\n"
            "Website: www.comsats.edu.pk\n"
            "Address: Park Road, Tarlai Kalan, Islamabad\n\n"
            "Press any key to return to main menu.");
        _showMainMenuMessage();
        break;
      case 7:
        _addBotMessage("Application Process:\n\n"
            "1. Online Application Steps\n"
            "2. Required Documents\n"
            "3. Application Deadlines\n"
            "4. Application Fee Payment\n\n"
            "Please select an option for details (1-4):");
        _showMainMenu = false;
        break;
      case 8:
        _addBotMessage("Important Dates for Fall 2023 Admissions:\n\n"
            "- Application Start Date: June 1, 2023\n"
            "- Application Deadline: July 15, 2023\n"
            "- Entry Test Date: July 25, 2023\n"
            "- First Merit List: August 10, 2023\n"
            "- Classes Begin: September 1, 2023\n\n"
            "Press any key to return to main menu.");
        _showMainMenuMessage();
        break;
      default:
        _addBotMessage("Invalid option. Please select a number between 1-8.");
    }
  }

  void _handleSubMenuOption(int option) {
    // Get the last bot message to determine which sub-menu we're in
    String lastBotMessage = "";
    for (var i = messages.length - 1; i >= 0; i--) {
      if (!messages[i].isUser) {
        lastBotMessage = messages[i].text;
        break;
      }
    }

    if (lastBotMessage.contains("Scholarship Details")) {
      _handleScholarshipOption(option);
    } else if (lastBotMessage.contains("Admission Requirements")) {
      _handleAdmissionRequirementsOption(option);
    } else if (lastBotMessage.contains("Fee Structure")) {
      _handleFeeStructureOption(option);
    } else if (lastBotMessage.contains("Offered Courses")) {
      _handleOfferedCoursesOption(option);
    } else if (lastBotMessage.contains("Marks Criteria")) {
      _handleMarksCriteriaOption(option);
    } else if (lastBotMessage.contains("Application Process")) {
      _handleApplicationProcessOption(option);
    } else {
      _showMainMenuMessage();
    }
  }

  void _handleScholarshipOption(int option) {
    switch (option) {
      case 1:
        _addBotMessage("Need-Based Scholarships:\n\n"
            "- Available for students with financial need\n"
            "- Covers 25% to 75% of tuition fee\n"
            "- Requires family income proof\n"
            "- Minimum CGPA of 2.5 required to maintain\n"
            "- Application deadline: July 15 each year\n\n"
            "Press any key to return to main menu.");
        break;
      case 2:
        _addBotMessage("Merit Scholarships:\n\n"
            "- Awarded to top 5% of each batch\n"
            "- Covers 50% of tuition fee\n"
            "- Requires minimum CGPA of 3.8\n"
            "- Renewable each semester\n"
            "- Automatically awarded, no application needed\n\n"
            "Press any key to return to main menu.");
        break;
      case 3:
        _addBotMessage("HEC Need-Based Scholarships:\n\n"
            "- Funded by Higher Education Commission\n"
            "- Covers 100% of tuition and living expenses\n"
            "- Extremely competitive\n"
            "- Requires comprehensive documentation\n"
            "- Separate application through HEC portal\n\n"
            "Press any key to return to main menu.");
        break;
      case 4:
        _addBotMessage("Sports Scholarships:\n\n"
            "- For students with outstanding sports achievements\n"
            "- Covers 25% to 100% of tuition\n"
            "- Requires proof of participation in national/international events\n"
            "- Must maintain participation in university teams\n\n"
            "Press any key to return to main menu.");
        break;
      case 5:
        _addBotMessage("Faculty Scholarships:\n\n"
            "- For children of COMSATS faculty members\n"
            "- Covers 50% of tuition\n"
            "- Requires employment verification\n"
            "- Minimum CGPA of 2.8 required to maintain\n\n"
            "Press any key to return to main menu.");
        break;
      default:
        _addBotMessage("Invalid scholarship option.");
    }
    _showMainMenuMessage();
  }

  void _handleAdmissionRequirementsOption(int option) {
    switch (option) {
      case 1:
        _addBotMessage("Undergraduate Programs Requirements:\n\n"
            "- Minimum 60% marks in FSc/HSSC/A-Levels\n"
            "- Entry test (conducted by COMSATS)\n"
            "- Original academic certificates\n"
            "- CNIC/B-Form copy\n"
            "- 4 passport-sized photographs\n"
            "- Migration certificate (if applicable)\n\n"
            "Press any key to return to main menu.");
        break;
      case 2:
        _addBotMessage("Graduate Programs Requirements:\n\n"
            "- 16 years of education (BS/BSc/BBA etc.)\n"
            "- Minimum 2.5 CGPA or 60% marks\n"
            "- GAT (General) with minimum 50% score\n"
            "- Statement of Purpose\n"
            "- Two recommendation letters\n"
            "- Original degree and transcripts\n\n"
            "Press any key to return to main menu.");
        break;
      case 3:
        _addBotMessage("PhD Programs Requirements:\n\n"
            "- 18 years of education (MS/MPhil)\n"
            "- Minimum 3.0 CGPA in MS/MPhil\n"
            "- GAT (Subject) with minimum 60% score\n"
            "- Research proposal\n"
            "- Three recommendation letters\n"
            "- Interview with department\n\n"
            "Press any key to return to main menu.");
        break;
      case 4:
        _addBotMessage("International Students Requirements:\n\n"
            "- Equivalent qualifications verified by IBCC\n"
            "- Valid student visa\n"
            "- English proficiency (TOEFL/IELTS if applicable)\n"
            "- Health insurance coverage\n"
            "- Financial support proof\n"
            "- Equivalence certificate from HEC\n\n"
            "Press any key to return to main menu.");
        break;
      default:
        _addBotMessage("Invalid option.");
    }
    _showMainMenuMessage();
  }

  void _handleFeeStructureOption(int option) {
    switch (option) {
      case 1:
        _addBotMessage("Undergraduate Program Fees (per semester):\n\n"
            "- Engineering: PKR 85,000\n"
            "- Computer Science: PKR 75,000\n"
            "- Business Administration: PKR 65,000\n"
            "- Architecture: PKR 80,000\n"
            "- Social Sciences: PKR 60,000\n\n"
            "Additional one-time charges:\n"
            "- Admission Fee: PKR 20,000\n"
            "- Security Deposit: PKR 10,000 (refundable)\n\n"
            "Press any key to return to main menu.");
        break;
      case 2:
        _addBotMessage("Graduate Program Fees (per semester):\n\n"
            "- MS Computer Science: PKR 90,000\n"
            "- MBA: PKR 75,000\n"
            "- MS Engineering: PKR 95,000\n"
            "- MS Mathematics: PKR 70,000\n\n"
            "Additional one-time charges:\n"
            "- Admission Fee: PKR 25,000\n"
            "- Thesis Fee: PKR 30,000 (for final semester)\n\n"
            "Press any key to return to main menu.");
        break;
      case 3:
        _addBotMessage("PhD Program Fees (per semester):\n\n"
            "- All Disciplines: PKR 120,000\n\n"
            "Additional charges:\n"
            "- Admission Fee: PKR 30,000\n"
            "- Thesis Evaluation Fee: PKR 50,000\n"
            "- Publication Fee: PKR 20,000 (after thesis completion)\n\n"
            "Press any key to return to main menu.");
        break;
      case 4:
        _addBotMessage("Additional Charges:\n\n"
            "- Library Security: PKR 5,000 (refundable)\n"
            "- Lab Charges: PKR 2,000 per lab course\n"
            "- Late Fee: PKR 500 per day after due date\n"
            "- Transcript Fee: PKR 1,000 per copy\n"
            "- Degree Fee: PKR 5,000 (upon graduation)\n\n"
            "Press any key to return to main menu.");
        break;
      default:
        _addBotMessage("Invalid option.");
    }
    _showMainMenuMessage();
  }

  void _handleOfferedCoursesOption(int option) {
    switch (option) {
      case 1:
        _addBotMessage("Engineering Programs:\n\n"
            "- Electrical Engineering (BS)\n"
            "- Computer Engineering (BS)\n"
            "- Civil Engineering (BS)\n"
            "- Mechanical Engineering (BS)\n"
            "- Chemical Engineering (BS)\n\n"
            "Press any key to return to main menu.");
        break;
      case 2:
        _addBotMessage("Computer Science Programs:\n\n"
            "- Computer Science (BS)\n"
            "- Software Engineering (BS)\n"
            "- Artificial Intelligence (BS)\n"
            "- Data Science (BS)\n"
            "- Cyber Security (MS)\n\n"
            "Press any key to return to main menu.");
        break;
      case 3:
        _addBotMessage("Business Administration:\n\n"
            "- BBA (Bachelor's)\n"
            "- MBA (Master's)\n"
            "- MS Management Sciences\n"
            "- PhD Management Sciences\n"
            "- Executive MBA (Weekend Program)\n\n"
            "Press any key to return to main menu.");
        break;
      case 4:
        _addBotMessage("Architecture:\n\n"
            "- Bachelor of Architecture (5 years)\n"
            "- MS Architecture\n"
            "- Urban Planning (MS)\n"
            "- Interior Design (BS)\n\n"
            "Press any key to return to main menu.");
        break;
      case 5:
        _addBotMessage("Social Sciences:\n\n"
            "- Psychology (BS)\n"
            "- Economics (BS/MS)\n"
            "- Mass Communication (BS)\n"
            "- International Relations (BS)\n"
            "- Development Studies (MS)\n\n"
            "Press any key to return to main menu.");
        break;
      default:
        _addBotMessage("Invalid option.");
    }
    _showMainMenuMessage();
  }

  void _handleMarksCriteriaOption(int option) {
    switch (option) {
      case 1:
        _addBotMessage("Undergraduate Programs Criteria:\n\n"
            "- Minimum 60% in FSc/HSSC or equivalent\n"
            "- Entry Test: Minimum 50% score\n"
            "- Weightage: 70% academic + 30% test\n"
            "- Additional 20 marks for Hafiz-e-Quran\n"
            "- 10 marks for outstanding sports achievements\n\n"
            "Press any key to return to main menu.");
        break;
      case 2:
        _addBotMessage("Graduate Programs Criteria:\n\n"
            "- Minimum 2.5 CGPA or 60% in Bachelor's\n"
            "- GAT (General) with 50% minimum\n"
            "- Departmental test/interview for some programs\n"
            "- Work experience preferred for MBA\n"
            "- Research publications add weight for MS\n\n"
            "Press any key to return to main menu.");
        break;
      case 3:
        _addBotMessage("PhD Programs Criteria:\n\n"
            "- Minimum 3.0 CGPA in MS/MPhil\n"
            "- GAT (Subject) with 60% minimum\n"
            "- Strong research proposal\n"
            "- Publications in HEC recognized journals\n"
            "- Interview with research committee\n\n"
            "Press any key to return to main menu.");
        break;
      default:
        _addBotMessage("Invalid option.");
    }
    _showMainMenuMessage();
  }

  void _handleApplicationProcessOption(int option) {
    switch (option) {
      case 1:
        _addBotMessage("Online Application Steps:\n\n"
            "1. Create account on admissions.comsats.edu.pk\n"
            "2. Fill personal and academic information\n"
            "3. Upload required documents\n"
            "4. Pay application fee (PKR 2,000)\n"
            "5. Submit application\n"
            "6. Print application form and fee challan\n\n"
            "Press any key to return to main menu.");
        break;
      case 2:
        _addBotMessage("Required Documents:\n\n"
            "- Copies of all academic certificates\n"
            "- CNIC/B-Form copy\n"
            "- Recent passport-sized photographs\n"
            "- Entry test fee challan\n"
            "- Migration certificate (if applicable)\n"
            "- Equivalence certificate for foreign qualifications\n\n"
            "Press any key to return to main menu.");
        break;
      case 3:
        _addBotMessage("Application Deadlines:\n\n"
            "- Fall Semester: July 15\n"
            "- Spring Semester: December 15\n"
            "- Late applications with additional fee: +7 days\n"
            "- No applications accepted after late deadline\n\n"
            "Press any key to return to main menu.");
        break;
      case 4:
        _addBotMessage("Application Fee Payment:\n\n"
            "- Fee: PKR 2,000 (non-refundable)\n"
            "- Payment methods:\n"
            "  * Online through portal\n"
            "  * Bank challan (Allied/UBL/HBL)\n"
            "  * EasyPaisa/JazzCash\n"
            "- Keep payment receipt for reference\n\n"
            "Press any key to return to main menu.");
        break;
      default:
        _addBotMessage("Invalid option.");
    }
    _showMainMenuMessage();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Admission Assistant',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFF2E5BFF),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: ListView.builder(
                  controller: _scrollController,
                  padding: EdgeInsets.only(top: 20, left: 16, right: 16),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return MessageBubble(
                      message: messages[index],
                      isFirst: index == 0,
                      isLast: index == messages.length - 1,
                    );
                  },
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, -5),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F7FA),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Type option number...",
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      keyboardType: TextInputType.number,
                      onSubmitted: (text) {
                        if (text.isNotEmpty) {
                          _handleOptionSelection(text);
                          _controller.clear();
                        }
                      },
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF2E5BFF),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.send, color: Colors.white),
                    onPressed: () {
                      if (_controller.text.isNotEmpty) {
                        _handleOptionSelection(_controller.text);
                        _controller.clear();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final Message message;
  final bool isFirst;
  final bool isLast;

  const MessageBubble({
    required this.message,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: isLast ? 20 : 8,
        top: isFirst ? 0 : 8,
      ),
      child: Align(
        alignment:
            message.isUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.8,
          ),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: message.isUser ? Color(0xFF2E5BFF) : Color(0xFFEDF1F7),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(message.isUser ? 20 : 0),
              topRight: Radius.circular(message.isUser ? 0 : 20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 6,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.text,
                style: TextStyle(
                  color: message.isUser ? Colors.white : Colors.black,
                  fontSize: 15,
                  height: 1.4,
                ),
              ),
              SizedBox(height: 4),
              Text(
                _formatTime(message.timestamp),
                style: TextStyle(
                  color: message.isUser
                      ? Colors.white.withOpacity(0.7)
                      : Colors.grey[600],
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatTime(DateTime time) {
    return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
  }
}

class Message {
  final String text;
  final bool isUser;
  final DateTime timestamp;

  Message({required this.text, required this.isUser, required this.timestamp});
}
