// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'mydropdown.dart';
import 'triangle_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
  String selectedValue = 'Item 1';
  // String? selectedValue =
  //     'Op1'; // Make sure to initialize with null or use late keyword
  // Map<String, String> optionImages = {
  //   'Option 1': 'assets/pix1.png',
  //   'Option 2': 'assets/rectangle.png',
  //   'Option 3': 'assets/pix1.png',
  //   'Option 4': 'assets/arrow1.png',
  // };

  // List<String> options = ['Op1', 'Op2', 'Op3', 'Op4'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 70, right: 10, left: 10, bottom: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.asset(
                    'assets/profile_pix.png',
                    width: 45.0,
                    height: 45.0,
                    fit: BoxFit.cover,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.settings),
                  color: Color(0xFF888888),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width -
                  20, // Adjusted width of the main container
              decoration: BoxDecoration(
                color: Color(0xFFC4C4C4),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: double.infinity,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.search,
                      color: Color(0xFF888888),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5 - 20,
                    height: double.infinity,
                    alignment: Alignment.centerLeft,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Currency',
                        hintStyle: TextStyle(
                          color: Color(0xFF888888),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3 - 20,
                    height: double.infinity,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 2.0,
                          height: 20.0,
                          color: Color(0xFF888888), // Set your desired color
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Positioned(
                          child: TriangleContainer(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //todo third
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 20,
              decoration: BoxDecoration(
                color: Color(0xFFc4c4c4),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      //todo Dropdown button is here
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: DropdownButton(
                                  value: selectedValue,
                                  items: items.map((String item) {
                                    return DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(item),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedValue = newValue!;
                                      Navigator.pop(
                                          context); // Close the dropdown dialog
                                    });
                                  },
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFF888888),
                              width: 2.0,
                            ),
                            color: Color(0xFFC4C4C4),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              SizedBox(width: 5),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.asset(
                                  //optionImages[selectedValue!]!,
                                  'assets/profile_pix.png',
                                  width: 15.0,
                                  height: 15.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "USD",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                width: 1,
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.arrow_drop_down_outlined,
                                  color: Color(0xFF888888),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        //width: MediaQuery.of(context).size.width * 0.2,
                        height: double.infinity,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "001",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    //width: MediaQuery.of(context).size.width * 0.2,
                    //height: double.infinity,
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/arrow1.png',
                      width: 20.0,
                      height: 20.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF888888),
                            width: 2.0,
                          ),
                          color: Color(0xFFC4C4C4),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            SizedBox(width: 5),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Image.asset(
                                'assets/profile_pix.png',
                                width: 15.0,
                                height: 15.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              "USD",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              width: 1,
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.arrow_drop_down_outlined,
                                color: Color(0xFF888888),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        //width: MediaQuery.of(context).size.width * 0.2,
                        height: double.infinity,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "001",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
