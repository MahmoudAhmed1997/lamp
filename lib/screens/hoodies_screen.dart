import 'package:flutter/material.dart';
import 'package:lamp/provider/designers.dart';
import 'package:lamp/widgets/designer_card.dart';
import 'package:lamp/widgets/prod.dart';
import 'package:lamp/localization/language_constants.dart';

class HoodScreen extends StatefulWidget {
  static const routeName = '/hoodies_screen';

  @override
  _HoodScreenState createState() => _HoodScreenState();
}

class _HoodScreenState extends State<HoodScreen> {
  Designers designers =Designers();
  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);

    return
      Padding(
        padding: const EdgeInsets.only(top:16.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              height: 310,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Prod(widthCard: 180,widthButton: 167,index: 0,),
                  SizedBox(
                    width: 12.0,
                  ),
                  Prod(widthCard: 180,widthButton: 167,index:1),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 17.0, left: 13, top: 17, bottom: 11),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      getTranslated(
                        context,
                        "shop_by_designers",
                      ),
                      style: TextStyle(fontSize: 16, color: Color(0xff18304B)),
                    ),
                    RaisedButton(
                      color: Color(0xffFFFFFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      onPressed: () {
                        print("lkf");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            getTranslated(
                              context,
                              "show_all",
                            ),
                            style: TextStyle(
                                fontSize: 12, color: Color(0xff18304B),fontWeight: FontWeight.normal),
                          ),
                          SizedBox(width: 6,),
                          myLocale.languageCode=="ar"?Container(
                            height: 7,
                            width: 11,
                            child: ImageIcon(
                              AssetImage("assets/icons/shape.png"),
                              color: Color(0xff18304B),
                            ),
                          )
                              :Container(
                            height: 7,
                            width: 11,
                            child: ImageIcon(
                              AssetImage("assets/icons/arrow.png"),
                              color: Color(0xff18304B),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Hero(
              tag: "card",
              child: Container(
                width: double.infinity,
                height:148 ,
                // child: ListView.builder(
                //   itemCount: designers.designers_list.length,
                //   itemBuilder: (context,index){
                //     return  DesignerCard();
                //
                //   },
                //   scrollDirection: Axis.horizontal,
                //
                //
                // ),
              ),
            ),
            SizedBox(height: 30,),






          ],
        ),
      );
  }
}
