import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../const/colors.dart';

class RouteCard extends StatelessWidget {
  const RouteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: Card(
        shape: RoundedRectangleBorder(
          //모서리를 둥글게 하기 위해 사용
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 4.0, //그림자 깊이
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('test', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),),
              SizedBox(height: 20.0,),
              Row(
                children: [
                  Icon(Icons.timer, size: 20.0, color: CupertinoColors.inactiveGray,),
                  Text('00분', style: TextStyle(fontSize: 13, color: CupertinoColors.inactiveGray),)
                ],
              ),
              SizedBox(height: 10.0,),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: PRIMARY_COLOR,),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 2.0, bottom: 2.0),
                  child: Text('test', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),),
                ),
              ),
              Text('qwerqwerqwer', style: TextStyle(fontSize: 17),)
            ],
          ),
        ),
      ),
    );
  }
}
