import 'package:flutter/material.dart';

Widget menuText(String title) => Text(title,
    style: TextStyle(
        fontFamily: 'PoppinsRegular', fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
    textAlign: TextAlign.center);

Widget boldWhiteText(String title) => Text(title,
    style: TextStyle(
        fontFamily: 'PoppinsRegular', fontSize: 30, color: Colors.white, fontWeight: FontWeight.w700),
    textAlign: TextAlign.center);

Widget boldWhiteFooterText(String title) => Text(title,
    style: TextStyle(
        fontFamily: 'PoppinsRegular', fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),
    textAlign: TextAlign.left);

Widget boldBlackText(String title) => Text(title,
    style: TextStyle(
        fontFamily: 'PoppinsRegular', fontSize: 25, color: Colors.black, fontWeight: FontWeight.w700),
    textAlign: TextAlign.center);

Widget normalWhiteText(String title) => Text(title,
    style: TextStyle(
        fontFamily: 'PoppinsRegular',
        fontSize: 12,
        color: Colors.white.withOpacity(.8),
        fontWeight: FontWeight.w200),
    textAlign: TextAlign.center);

Widget normalWhiteFooterText(String title) => Text(title,
    style: TextStyle(
        fontFamily: 'PoppinsRegular',
        fontSize: 10,
        color: Colors.white.withOpacity(.8),
        fontWeight: FontWeight.w200),
    textAlign: TextAlign.left);

Widget mediumBlackText(String title) => Text(title,
    style: TextStyle(
        fontFamily: 'PoppinsRegular',
        fontSize: 15,
        color: Colors.black.withOpacity(.9),
        fontWeight: FontWeight.w600),
    textAlign: TextAlign.start);

Widget regularBlackText(String title) => Text(title,
    style: TextStyle(
        fontFamily: 'PoppinsRegular',
        fontSize: 16,
        color: Colors.black.withOpacity(0.9),
        fontWeight: FontWeight.w500),
    textAlign: TextAlign.start);

Widget normalBlackText(String title) => Text(title,
    style: TextStyle(
        fontFamily: 'PoppinsRegular',
        fontSize: 12,
        color: Colors.black.withOpacity(.4),
        fontWeight: FontWeight.w200),
    textAlign: TextAlign.center);

Widget normalBlackText2(String title) => Text(title,
    style: TextStyle(
        fontFamily: 'PoppinsRegular',
        fontSize: 14,
        color: Colors.black.withOpacity(.9),
        fontWeight: FontWeight.w400),
    textAlign: TextAlign.center);

Widget landingTitle(String title) => Text(title,
    style: TextStyle(
        fontFamily: 'PoppinsRegular',
        fontSize: 24,
        color: Color.fromRGBO(220, 106, 0, 1),
        fontWeight: FontWeight.w700),
    textAlign: TextAlign.center);

Widget landingSubTitle(String title) => Text(title,
    maxLines: 2,
    softWrap: true,
    style: TextStyle(
        fontFamily: 'PoppinsRegular',
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.bold),
    textAlign: TextAlign.center);

Widget regularWhiteText(String title) => Text(title,
    style: TextStyle(
        fontFamily: 'PoppinsRegular', fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
    textAlign: TextAlign.center);

Widget mediumWhiteText(String title) => Text(title,
    style: TextStyle(
        fontFamily: 'PoppinsRegular', fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
    textAlign: TextAlign.start);

Widget mediumBlackText2(String title) => Text(title,
    style: TextStyle(
        fontFamily: 'PoppinsRegular',
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.w500),
    textAlign: TextAlign.start);

Widget regularBlackText2(String title) => Text(title,
    style: TextStyle(
        fontFamily: 'PoppinsRegular',
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.w500),
    textAlign: TextAlign.left);

Widget buttonWhiteText(String title) => Text(title,
    style: TextStyle(
        fontFamily: 'PoppinsRegular',
        fontSize: 11,
        color: Colors.white,
        fontWeight: FontWeight.w500),
    textAlign: TextAlign.left);

Widget subBlackText(String title) => Text(title,
    style: TextStyle(
        fontFamily: 'PoppinsRegular', fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
    textAlign: TextAlign.center);