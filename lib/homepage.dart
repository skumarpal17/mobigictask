import 'package:flutter/material.dart';

import 'enter_rows_column.dart';

class HomePage extends StatefulWidget {
  final String rowCount;
  final String columnCount;
  final String getAlpha;
  const HomePage(
      {Key? key,
      required this.rowCount,
      required this.columnCount,
      required this.getAlpha})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int rowCount = 0;
  int columnCount = 0;
  TextEditingController searchTextController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rowCount = int.parse(widget.rowCount);
    columnCount = int.parse(widget.columnCount);
  }

  @override
  Widget build(BuildContext context) {
    double wd = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: wd * .6,
          child: SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(17.0)),
                    borderSide: BorderSide.none),
                hintText: 'Enter Text...',
                fillColor: Colors.grey.withOpacity(0.5),
                filled: true,
              ),
              controller: searchTextController,
              onChanged: (val) {
                setState(() {});
              },
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: rowCount != 0 && columnCount != 0
            ? GridView.builder(
                shrinkWrap: true,
                itemCount: (rowCount * columnCount),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columnCount),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.blue.withOpacity(0.2)),
                    child: Center(
                        child: Text(
                      widget.getAlpha[index],
                      style: TextStyle(
                          fontWeight: searchTextController.text
                                  .contains(widget.getAlpha[index])
                              ? FontWeight.bold
                              : null),
                    )),
                  );
                },
              )
            : Container(
                padding: EdgeInsets.only(top: 20),
                child:
                    Center(child: Text("Rows And Column Should Not Be Zero")),
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => EnterRowsColumn()));
          },
          label: Text("Reset")),
    );
  }

  leftToRight() {
    for (int i = 1; i <= int.parse(widget.rowCount); i++) {
      for (int j = 1; j <= int.parse(widget.columnCount); i++) {}
    }
  }
}
