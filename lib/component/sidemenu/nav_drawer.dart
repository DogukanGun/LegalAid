import 'package:flutter/material.dart';
import 'package:legalaid/component/sidemenu/nav_item.dart';
import 'package:legalaid/component/sidemenu/nav_text.dart';
import 'package:legalaid/res/size_resource.dart';
import 'package:legalaid/style/text_style.dart';

import '../../res/color_resource.dart';

typedef PageCallback = void Function(StatefulWidget);
class CustomNavDrawer extends StatefulWidget {

  PageCallback pageCallback;
  CustomNavDrawer({Key? key,required this.pageCallback}) : super(key: key);

  @override
  State<CustomNavDrawer> createState() => _CustomNavDrawerState();
}


class _CustomNavDrawerState extends State<CustomNavDrawer> {

  void clickNavbarItem(int index){
    NavText.navItems.forEach((element) {element.unselect();});
    NavText.navItems[index-1].select();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorResource.navbarColor,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: NavText.navItems.length+1,
        itemBuilder:(BuildContext context,int index){
          if(index == 0){
            return Padding(
              padding: EdgeInsets.only(top: SizeResource.smallDp,left:SizeResource.mediumDp),
              child: DrawerHeader(
                decoration:const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/cover.jpg'))),
                child: Text(
                  NavText.title,
                  style: LegalAidTextStyle.foodListMenuTextWhite,
                ),
              ),
            );
          }else{
            return Padding(
              padding: EdgeInsets.only(left:SizeResource.mediumDp,right:SizeResource.mediumDp,top: SizeResource.smallDp),
              child: Container(
                decoration: BoxDecoration(
                    color: NavText.navItems[index-1].backgroundColor,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(SizeResource.mediumDp))
                ),
                child: ListTile(
                  leading: Icon(NavText.navItems[index-1].icon,color: NavText.navItems[index-1].itemColor,),
                  title: Text(NavText.navItems[index-1].text,style: NavText.navItems[index-1].getTextStyle(),),
                  onTap: () => {
                    widget.pageCallback.call(NavText.navItems[index-1].page),
                    setState((){clickNavbarItem(index);}),
                    Navigator.of(context).pop()
                  },
                ),
              ),
            );
          }
        }
      ),
    );
  }
}
