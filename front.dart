import 'package:cui_admission/authentication/signin.dart';
import 'package:cui_admission/courses/bio.dart';
import 'package:cui_admission/courses/business.dart';
import 'package:cui_admission/courses/cs.dart';
import 'package:cui_admission/courses/eng.dart';
import 'package:cui_admission/screens/ContactScreen.dart';
import 'package:cui_admission/screens/VuCampusScreen.dart';
import 'package:cui_admission/screens/criteria.dart';

import 'package:cui_admission/screens/see_all.dart';
import 'package:cui_admission/statemanagement/auth_prov.dart';
import 'package:cui_admission/widgets/text.dart';

import 'package:flutter/material.dart';
import 'package:cui_admission/utils/color.dart';
import 'package:provider/provider.dart';
import 'dart:async';

class Front extends StatefulWidget {
  @override
  State<Front> createState() => _FrontState();
}

Future<void> _logout(BuildContext context, EmailAuthProv authProvider) async {
  try {
    await authProvider.auth.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Signin()),
    );
  } catch (e) {}
}

List<String> buttons = ['Courses', 'Criteria', 'VU Campus', 'Contact'];

class _FrontState extends State<Front> {
  int? selectedIndex;
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Map<String, String>> faqs = [
    {
      "question": "What are the admission requirements?",
      "answer":
          "Minimum 60% marks in intermediate or equivalent for undergraduate programs.",
    },
    {
      "question": "When does the admission process start?",
      "answer":
          "Admissions typically open twice a year in Spring and Fall semesters.",
    },
    {
      "question": "What programs does CUI offer?",
      "answer":
          "CUI offers programs in Engineering, Computer Science, Business, and Biosciences.",
    },
    {
      "question": "Is there any scholarship available?",
      "answer": "Yes, CUI offers merit-based and need-based scholarships.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF2E5BFF),
        title: Texts(
          data: "Welcome to CUI",
          color: Colors.white,
          weight: FontWeight.bold,
          size: 20,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          ),
        ],
      ),
      drawer: _buildDrawer(context),
      body: FrontContent(),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    final emailauthprov = Provider.of<EmailAuthProv>(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(""),
            accountEmail: Text(emailauthprov.signupemail.text),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 40, color: Color(0xFF2E5BFF)),
            ),
            decoration: BoxDecoration(color: Color(0xFF2E5BFF)),
          ),
          ExpansionTile(
            leading: Icon(Icons.help_outline, color: Color(0xFF2E5BFF)),
            title: Text('FAQs'),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: faqs.map((faq) => _buildFaqItem(faq)).toList(),
                ),
              ),
            ],
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.feedback, color: Color(0xFF2E5BFF)),
            title: Text('Feedback'),
            onTap: () {
              Navigator.pop(context);
              _showFeedbackDialog(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Color(0xFF2E5BFF)),
            title: Text('Logout'),
            onTap: () {
              _logout(context, emailauthprov);
            },
          ),
        ],
      ),
    );
  }

  void _showFeedbackDialog(BuildContext context) {
    final TextEditingController _feedbackController = TextEditingController();
    final List<String> sampleFeedback = [
      "Great admission process! Very smooth.",
      "The website could use more information about scholarships.",
      "Very helpful staff during campus visit.",
      "Application deadline was too short this year.",
    ];

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("Feedback System"),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Recent Feedback from others:"),
                  SizedBox(height: 10),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.all(8),
                    child: ListView(
                      children:
                          sampleFeedback
                              .map(
                                (feedback) => Text(
                                  "• $feedback",
                                  style: TextStyle(fontSize: 12),
                                ),
                              )
                              .toList(),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Your Feedback:"),
                  TextField(
                    controller: _feedbackController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: "Enter your feedback here...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_feedbackController.text.isNotEmpty) {
                    // In a real app, you would save this to your database
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Thank you for your feedback!")),
                    );
                    Navigator.pop(context);
                  }
                },
                child: Text("Submit"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2E5BFF),
                ),
              ),
            ],
          ),
    );
  }
}

Widget _buildFaqItem(Map<String, String> faq) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        faq["question"]!,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
      SizedBox(height: 4),
      Text(
        faq["answer"]!,
        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
      ),
      Divider(),
    ],
  );
}

class FrontContent extends StatefulWidget {
  @override
  _FrontContentState createState() => _FrontContentState();
}

class _FrontContentState extends State<FrontContent> {
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();
  final PageController _pageController = PageController();
  final List<String> _carouselImages = [
    'images/slider1.jpg',
    'images/slider.jpg',
    'images/slider2.jpg',
  ];
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < _carouselImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  final List<Map<String, dynamic>> _searchableItems = [
    {
      'title': 'Engineering',
      'description': 'Engineering programs at CUI',
      'page': Eng(),
      'category': 'Courses',
    },
    {
      'title': 'BioScience',
      'description': 'Bioscience programs at CUI',
      'page': Bio(),
      'category': 'Courses',
    },
    {
      'title': 'Computer Science',
      'description': 'CS programs at CUI',
      'page': Discipline(),
      'category': 'Courses',
    },
    {
      'title': 'Business',
      'description': 'Business programs at CUI',
      'page': Business(),
      'category': 'Courses',
    },
    {
      'title': 'Admission Criteria',
      'description': 'View admission requirements',
      'page': CriteriaScreen(),
      'category': 'Criteria',
    },
    {
      'title': 'Virtual Campus',
      'description': 'Explore CUI campus',
      'page': VuCampusScreen(),
      'category': 'VU Campus',
    },
    {
      'title': 'Contact Us',
      'description': 'Get in touch with admission office',
      'page': ContactScreen(),
      'category': 'Contact',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final emailauthprov = Provider.of<EmailAuthProv>(context);
    List<Map<String, dynamic>> filterItems(String query) {
      if (query.isEmpty) return [];

      return _searchableItems.where((item) {
        try {
          final title = (item['title']?.toString() ?? '').toLowerCase();
          final description =
              (item['description']?.toString() ?? '').toLowerCase();
          final lowerQuery = query.toLowerCase();

          return title.contains(lowerQuery) || description.contains(lowerQuery);
        } catch (e) {
          debugPrint('Error filtering item: $e');
          return false;
        }
      }).toList();
    }

    final filteredItems = filterItems(_searchQuery);

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Appcolors().first),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon:
                    _searchQuery.isNotEmpty
                        ? IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            _searchController.clear();
                            setState(() => _searchQuery = '');
                          },
                        )
                        : null,
              ),
              onChanged: (value) => setState(() => _searchQuery = value),
            ),
          ),

          // Show search results if query exists
          _searchQuery.isNotEmpty
              ? _buildSearchResults(filteredItems)
              : _buildDefaultContent(),
        ],
      ),
    );
  }

  Widget _buildSearchResults(List<Map<String, dynamic>> results) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Search Results',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          if (results.isEmpty)
            Text('No results found for "$_searchQuery"')
          else
            Column(
              children:
                  results.map((item) => _buildSearchResultItem(item)).toList(),
            ),
        ],
      ),
    );
  }

  Widget _buildSearchResultItem(Map<String, dynamic> item) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Text(item['title']),
        subtitle: Text(item['description']),
        trailing: Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => item['page']),
          );
        },
      ),
    );
  }

  Widget _buildDefaultContent() {
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemCount: buttons.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  switch (index) {
                    case 0:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllCoursesScreen(),
                        ),
                      );
                      break;
                    case 1:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CriteriaScreen(),
                        ),
                      );
                      break;
                    case 2:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VuCampusScreen(),
                        ),
                      );
                      break;
                    case 3:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ContactScreen(),
                        ),
                      );
                      break;
                  }
                },
                child: Card(
                  elevation: 2,
                  color: Appcolors().forth,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Center(
                      child: Text(
                        buttons[index],
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        // Image Slider (replaces the static image)
        _buildImageSlider(),

        Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Text(
                'Course Categories',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AllCoursesScreen()),
                  );
                },
                child: Text(
                  'SEE ALL',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Appcolors().forth,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Course Categories Grid
        Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  _buildCourseCard(
                    context,
                    'Engineering',
                    'images/imagec1.png',
                    Eng(),
                  ),
                  SizedBox(width: 10),
                  _buildCourseCard(
                    context,
                    'BioScience',
                    'images/imagec2.png',
                    Bio(),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  _buildCourseCard(
                    context,
                    'Computer Science',
                    'images/imagec4.png',
                    Discipline(),
                  ),
                  SizedBox(width: 10),
                  _buildCourseCard(
                    context,
                    'Business',
                    'images/imagec3.png',
                    Business(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildImageSlider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: SizedBox(
        width: double.infinity,
        height: 200,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: _carouselImages.length,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    _carouselImages[index],
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
            Positioned(
              bottom: 10,
              child: Row(
                children: List.generate(
                  _carouselImages.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          _currentPage == index
                              ? Colors.white
                              : Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseCard(
    BuildContext context,
    String title,
    String imagePath,
    Widget page,
  ) {
    return Expanded(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
            height: 100,
          ),
          SizedBox(height: 8),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => page),
              );
            },
            child: Text(
              title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Text(
              'Lorem ipsum dolor sit amet cons',
              style: TextStyle(fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}
