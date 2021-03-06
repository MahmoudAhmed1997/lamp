import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lamp/widgets/checkbox_values.dart';
import 'package:lamp/widgets/rang_slider.dart';
import 'package:flutter_range_slider/flutter_range_slider.dart';
import 'package:lamp/localization/language_constants.dart';
import 'package:lamp/provider/settings_api/colors_api.dart';
import 'package:lamp/provider/settings_api/contactus_type.dart';
class FiltersProducts extends StatefulWidget {
  static const routeName = '/filters_products';

  @override
  _FiltersProductsState createState() => _FiltersProductsState();
}


class _FiltersProductsState extends State<FiltersProducts> {
  ContactUsApi contactUsApi = ContactUsApi();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    ColorsApi colorsApi = ColorsApi();
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      resizeToAvoidBottomPadding: false,
      body: Stack(children: [
        Center(
          child: Container(
            width: 327,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 38.0),
                    child: SvgPicture.asset("assets/images/indicator.svg"),
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  getTranslated(context, "filter_products"),
                  style: TextStyle(fontSize: 20, color: Color(0xff18304B)),
                ),
                Text(
                  getTranslated(context, "most_recent_wanted"),
                  style: TextStyle(fontSize: 15, color: Color(0xff7F8FA6)),
                ),
                SizedBox(height: 30,),
                Text(
                  getTranslated(context, "by_color"),
                  style: TextStyle(fontSize: 15, color: Color(0xff18304B)),
                ),
                SizedBox(height: 10,),

                Container(
                  height: 30,
                  child: ListView.builder(
                     scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context,index){
                      return  Container(
                          width: 27,
                          height: 27,
                          child: RaisedButton(
                              color: Colors.blue,
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          );
                    },


                  ),
                ),
                Divider(),
                Container(child: GetCheckValue()),
                SizedBox(
                  height: 22,
                ),
                Divider(),
                SizedBox(
                  height: 18,
                ),


                SvgPicture.asset(
                  'assets/images/price.svg',
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 30,
          left: 30,
          bottom: 30,
          child: Container(
            width: 327,
            height: 56,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              color: Color(0xff00B5F0),
              child: Text(
                getTranslated(context, "view_results"),
                style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.normal),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        myLocale.languageCode=="en"?
        Padding(
          padding: const EdgeInsets.only(top: 25.0, right: 16),
          child: Container(
            alignment: Alignment.topRight,
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset("assets/icons/button_cancle.svg")),
          ),
        ):Padding(
          padding: const EdgeInsets.only(top: 25.0, left: 16),
          child: Container(
            alignment: Alignment.topLeft,
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset("assets/icons/button_cancle.svg")),
          ),
        )
      ]),
    );
  }
}
