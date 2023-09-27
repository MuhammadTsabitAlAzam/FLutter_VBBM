import 'package:flutter/material.dart';
import 'package:vbbm/Screens/InputVoucherScreen.dart';
import 'package:vbbm/Screens/ListPengambilanScreen.dart';
import 'package:vbbm/Services/PlatformServices.dart';

class VoucherMenu extends StatelessWidget {
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
                child: InputVoucher(context),
              ),
              IntrinsicWidth(
                child: ReturnVoucher(context),
              ),
            ],
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 1, child: InputVoucher(context)),
              Expanded(flex: 1, child: ReturnVoucher(context))
            ],
          ),
          SizedBox(height: 180,),
        ],
      ),
    );
  }

  Widget InputVoucher(BuildContext context) => InkWell(
    onTap: () {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => InputVoucherPage()));
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
            'assets/icon/voucher1.png',
            width: _width / 100 + 50,
          ),
          SizedBox(
            width: 25,
          ),
          Text(
            "Pengajuan Voucher",
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

  Widget ReturnVoucher(BuildContext context) => InkWell(
    onTap: () {
      {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ListPengambilanPage()));
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
            'assets/icon/return1.png',
            width: _width / 100 + 50,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            "Pengembalian Voucher",
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
