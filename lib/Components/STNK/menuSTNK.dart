import 'package:flutter/material.dart';
import 'package:vbbm/Screens/InputSTNKScreen.dart';
import 'package:vbbm/Screens/ListSTNKScreen.dart';
import 'package:vbbm/Services/PlatformServices.dart';

class STNKMenu extends StatelessWidget {
  late double _width;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 160,
          ),
          PlatFormServices.isMobile(context)
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IntrinsicWidth(
                child: InputSTNK(context),
              ),
              IntrinsicWidth(
                child: ListSTNK(context),
              ),
            ],
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 1, child: InputSTNK(context)),
              Expanded(flex: 1, child: ListSTNK(context))
            ],
          ),
          SizedBox(height: 180,),
        ],
      ),
    );
  }

  Widget InputSTNK(BuildContext context) => InkWell(
    onTap: () {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => InputSTNKPage()));
    },
    child: Container(
      margin:
      EdgeInsets.symmetric(vertical: 25, horizontal: _width / 15),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color.fromRGBO(66, 76, 53, 1),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(66, 76, 53, 0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icon/input.png',
            width: _width / 100 + 50,
          ),
          SizedBox(
            width: 25,
          ),
          Text(
            "Input Data STNK",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );

  Widget ListSTNK(BuildContext context) => InkWell(
    onTap: () {
      {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ListSTNKPage()));
      }
    },
    child: Container(
      margin:
      EdgeInsets.symmetric(vertical: 25, horizontal: _width / 15),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color.fromRGBO(54, 59, 108, 1),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(54, 59, 108, 0.3),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icon/list.png',
            width: _width / 100 + 50,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            "List Data STNK",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
