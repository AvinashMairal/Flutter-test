import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double itemWidth = 60.0;
  int itemCount = 100;
  int selected = 50;
  FixedExtentScrollController _scrollController =
      FixedExtentScrollController(initialItem: 50);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scale Example"),
      ),
      body: Center(
        child: _buildNumberList(),
      ),
    );

    //_bulidYear(),
  }

  _buildNumberList() {
    return RotatedBox(
      quarterTurns: -1,
      child: ListWheelScrollView(
        magnification: 2.0,
        onSelectedItemChanged: (x) {
          setState(() {
            selected = x;
          });
          print(selected);
        },
        controller: _scrollController,
        children: List.generate(itemCount, (x) {
          //if (x % 5 == 0)
          return RotatedBox(
            quarterTurns: 1,
            child: AnimatedContainer(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(0),
              duration: Duration(milliseconds: 400),
              // width: x == selected ? 85 : 75,
              // height: x == selected ? 110 : 100,
              alignment: Alignment.center,
              // decoration: BoxDecoration(
              //     color: x == selected ? Colors.red : Colors.grey,
              //     shape: BoxShape.circle),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //if (x % 5 == 0)
                  Text(
                    '$x',
                    style: TextStyle(
                      fontSize: x == selected ? 35 : 25,
                      color: x == selected ? Colors.black : Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "|",
                    style: TextStyle(
                      fontSize: x == selected ? 35 : 25,
                      color: x == selected ? Colors.black : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
        itemExtent: itemWidth,
      ),
    );
  }
}
