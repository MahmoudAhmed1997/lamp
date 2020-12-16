import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20,bottom: 20),
      child: Container(
        width: 340,height: 80,
        child: Row(children: [
          Container(
            height: 61,
            width: 56,
            child: Image.asset("assets/images/t_shirt.png"),
          ),

          SizedBox(width: 17,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("اناء طعام للهامستر ماركة بيرزيني",style: TextStyle(fontSize: 14,color: Color(0xff464451)),),
            Text("x3",style: TextStyle(fontSize: 14,color: Color(0xff464451)),),
            Text("500 رس",style: TextStyle(fontSize: 14,color: Color(0xffF45540),fontWeight: FontWeight.bold),),

          ],),

        ],),
      ),
    );
  }
}
