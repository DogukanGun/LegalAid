import 'package:flutter/material.dart';
import 'package:legalaid/component/informationbox/information.dart';
import 'package:legalaid/res/size_resource.dart';
import 'package:legalaid/style/text_style.dart';


class InformationBox extends StatelessWidget {

  Information information;

  InformationBox({Key? key,required this.information}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(SizeResource.mediumDp))
      ),
      child: Padding(
        padding: EdgeInsets.all(SizeResource.smallDp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
                information.key,
                style: LegalAidTextStyle.foodListMenuSubTextBlack,
            ),
            Text(
                information.value,
                style: LegalAidTextStyle.foodListMenuSubTextGray,
            ),
          ],
        ),
      ),
    );
  }
}
