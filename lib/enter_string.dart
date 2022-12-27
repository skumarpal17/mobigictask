import 'package:flutter/material.dart';

import 'homepage.dart';

class EnterString extends StatefulWidget {
  final String rowCount;
  final String columnCount;
  const EnterString(
      {Key? key, required this.rowCount, required this.columnCount})
      : super(key: key);

  @override
  State<EnterString> createState() => _EnterStringState();
}

class _EnterStringState extends State<EnterString> {
  TextEditingController alphabet = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double wd = MediaQuery.of(context).size.width;
    double ht = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: ht,
        width: wd,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  "Enter The ${int.parse(widget.rowCount) * int.parse(widget.columnCount)} Alphabet"),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      maxLength: int.parse(widget.rowCount) *
                          int.parse(widget.columnCount),
                      controller: alphabet,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12))),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (alphabet.text.length ==
              int.parse(widget.rowCount) * int.parse(widget.columnCount)) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HomePage(
                      rowCount: widget.rowCount,
                      columnCount: widget.columnCount,
                      getAlpha: alphabet.text,
                    )));
          }
        },
        label:
            SizedBox(width: wd * .7, child: const Center(child: Text("Next"))),
      ),
    );
  }
}
