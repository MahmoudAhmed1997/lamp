import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lamp/screens/fliters_screen.dart';
import 'package:lamp/widgets/appbar_widgets.dart';
import 'package:lamp/widgets/prod.dart';
import 'package:lamp/localization/language_constants.dart';

class NewProductsScreen extends StatefulWidget {
  static const routeName = '/new_products_screen';

  @override
  _NewProductsScreenState createState() => _NewProductsScreenState();
}

class _NewProductsScreenState extends State<NewProductsScreen> {
  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 155,
              color: Color(0xff00B5F0),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 28.0, left: 18, right: 18, bottom: 18),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: myLocale.languageCode == "ar"
                              ? SvgPicture.asset(
                                  "assets/icons/button_right.svg",
                                )
                              : SvgPicture.asset(
                                  "assets/icons/button_left.svg",
                                ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        Text(
                          getTranslated(context, "new_added"),
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        SvgPicture.asset("assets/icons/cart.svg"),
                      ],
                    ),
                    SizedBox(
                      height: 17.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 343,
                          child: Stack(children: [
                            TextFormField(
                              textAlign: TextAlign.center,
                              enableInteractiveSelection: false,
                              style: TextStyle(color: Colors.grey),
                              key: ValueKey("البحث"),
                              autocorrect: false,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return '';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(9.0),
                                filled: true,
                                fillColor: Color(0xffFAFAFA),
                                hintText:
                                    getTranslated(context, "search_product"),
                                alignLabelWithHint: true,
                                hintStyle: TextStyle(
                                    color: Color(0xff425154), fontSize: 15),
                                labelStyle: TextStyle(
                                    color: Color(0xff000000), fontSize: 15),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Color(0xff18304B)),
                                  borderRadius: new BorderRadius.circular(6),
                                ),
                              ),
                            ),
                            Positioned.fill(
                                right: 77,
                                child: myLocale.languageCode == "ar"
                                    ? Align(
                                        alignment: Alignment.centerRight,
                                        child: UnconstrainedBox(
                                          child: SvgPicture.asset(
                                            "assets/icons/search.svg",
                                          ),
                                        ),
                                      )
                                    : Padding(
                                        padding:
                                            const EdgeInsets.only(left: 68.0),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: UnconstrainedBox(
                                            child: SvgPicture.asset(
                                              "assets/icons/search.svg",
                                            ),
                                          ),
                                        ),
                                      ))
                          ]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 1000,
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        height: 310,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Prod(
                              widthCard: 180,
                              widthButton: 167,
                              index: index,
                            ),
                            Prod(
                              widthCard: 180,
                              widthButton: 167,
                              index: index,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  scrollDirection: Axis.vertical,
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 44,
          right: 44,
          bottom: 22,
          child: Card(
            color: Color(0xff18304B),
            margin: EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.0),
                          topRight: Radius.circular(5.0)),
                    ),
                    isScrollControlled: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    isDismissible: true,
                    context: context,
                    builder: (context) => FractionallySizedBox(
                          child: FiltersProducts(),
                        ));
              },
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                    width: 310,
                    height: 50,
                    child: myLocale.languageCode == "ar"
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  height: 25,
                                  child: ImageIcon(
                                    AssetImage(
                                      "assets/icons/Filter.png",
                                    ),
                                    color: Colors.white,
                                  )),
                              Container(
                                  height: 25,
                                  child: ImageIcon(
                                    AssetImage(
                                      "assets/icons/line_6.png",
                                    ),
                                    color: Colors.white,
                                  )),
                              Container(
                                  height: 22,
                                  child: UnconstrainedBox(
                                      child: SvgPicture.asset(
                                          "assets/images/fit.svg"))),
                              Text(
                                getTranslated(context, "best_seller"),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                  width: 11,
                                  height: 6,
                                  child: ImageIcon(
                                    AssetImage(
                                      "assets/icons/button_down.png",
                                    ),
                                    color: Colors.white,
                                  )),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  width: 11,
                                  height: 6,
                                  child: ImageIcon(
                                    AssetImage(
                                      "assets/icons/button_down.png",
                                    ),
                                    color: Colors.white,
                                  )),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                getTranslated(context, "best_seller"),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                              Container(
                                  height: 22,
                                  child: UnconstrainedBox(
                                      child: SvgPicture.asset(
                                          "assets/images/fit.svg"))),
                              Container(
                                  height: 25,
                                  child: ImageIcon(
                                    AssetImage(
                                      "assets/icons/line_6.png",
                                    ),
                                    color: Colors.white,
                                  )),
                              Container(
                                  height: 25,
                                  width: 35,
                                  child: ImageIcon(
                                    AssetImage(
                                      "assets/icons/Filter.png",
                                    ),
                                    color: Colors.white,
                                  )),
                            ],
                          )),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
