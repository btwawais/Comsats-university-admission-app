import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List<String> values = ["Courses", "Criteria", "VU Campus"];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Text(
                "  Welcome",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                " Hina",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: [
            Image.asset("images/setting.png"),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.notifications),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: "Search Here",
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ListView.builder(
                    itemCount: values.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(top: 20, right: 20),
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            values[index],
                          ),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor:
                                CupertinoColors.systemBlue.withOpacity(0.1),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  width: double.infinity,
                  height: 160,
                  child: ClipRRect(
                    child: Image.asset(
                      "images/istockphoto-1148850956-1024x1024 1.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "course Categories",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 130,
                          width: 130,
                          child: Image.asset(
                              "images/3d-rendering-futuristic-computer 1.png"),
                        ),
                        Text(
                          "Computer Science",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          textAlign: TextAlign.left,
                          "Lorem ipsum dolor sit\namet cons koju",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 130,
                          width: 130,
                          child: Image.asset(
                              "images/freepik__resize-width-and-hight-151__22234 1.png"),
                        ),
                        Text(
                          "Bio Science",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          textAlign: TextAlign.left,
                          "Lorem ipsum dolor sit\namet cons koju",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 130,
                          width: 130,
                          child: Image.asset(
                              "images/freepik__resize-image-hight-15067-and-width-15067__35206 1.png"),
                        ),
                        Text(
                          "Engineering",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          textAlign: TextAlign.left,
                          "Lorem ipsum dolor sit\namet cons koju",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 130,
                          width: 130,
                          child: Image.asset(
                              "images/agent-couple-signing-contract-close-up-dark-backgrounds 1.png"),
                        ),
                        Text(
                          "Business",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          textAlign: TextAlign.left,
                          "Lorem ipsum dolor sit\namet cons koju",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.file_copy_rounded,
                        size: 35,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.person,
                        size: 35,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.home,
                        size: 35,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.message,
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
