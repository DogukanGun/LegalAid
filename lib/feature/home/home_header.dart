import 'package:flutter/material.dart';
import 'package:legalaid/component/informationbox/information_box.dart';
import 'package:legalaid/res/size_resource.dart';

import '../../component/informationbox/information.dart';

class HomeHeader extends StatelessWidget {

  List<Information> informationList;

  HomeHeader({Key? key,required this.informationList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeResource.xxlargeDp*2,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: informationList.length,
          itemBuilder: (BuildContext context,int index){
            return Card(
                margin: EdgeInsets.only(right: SizeResource.xlargeDp),
                child: InformationBox(information: informationList[index]),
            );
          }
      ),
    );
  }
}
