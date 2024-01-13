// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyDrop extends StatefulWidget {
  const MyDrop({super.key});

  @override
  State<MyDrop> createState() => _MyDropState();
}

class _MyDropState extends State<MyDrop> {
  List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
  String selectedValue = 'Item 1';
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  void showDropdown() {
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
                Navigator.pop(context); // Close the dropdown dialog
              });
            },
          ),
        );
      },
    );
  }
}
