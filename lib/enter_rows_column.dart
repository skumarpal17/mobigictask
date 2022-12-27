import 'package:flutter/material.dart';
import 'package:mobigictask/homepage.dart';

import 'enter_string.dart';

class EnterRowsColumn extends StatefulWidget {
  const EnterRowsColumn({Key? key}) : super(key: key);

  @override
  State<EnterRowsColumn> createState() => _EnterRowsColumnState();
}

class _EnterRowsColumnState extends State<EnterRowsColumn> {
  TextEditingController rowCount = TextEditingController();
  TextEditingController columnCount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double wd = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Expanded(
                      flex: 5, child: Text("Enter Number Of Rows: ")),
                  Expanded(
                    flex: 1,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: rowCount,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12))),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Expanded(
                      flex: 5, child: Text("Enter Number Of Column: ")),
                  Expanded(
                    flex: 1,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: columnCount,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12))),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (rowCount.text.isNotEmpty &&
              columnCount.text.isNotEmpty &&
              rowCount.text != "0" &&
              columnCount.text != "0") {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EnterString(
                      rowCount: rowCount.text,
                      columnCount: columnCount.text,
                    )));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Rows And Column Should Not Be Zero')));
          }
        },
        label:
            SizedBox(width: wd * .7, child: const Center(child: Text("Next"))),
      ),
    );
  }
}
