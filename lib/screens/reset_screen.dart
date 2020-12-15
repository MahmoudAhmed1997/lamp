import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lamp/widgets/bottomAppBarItems.dart';

class ResetScreen extends StatefulWidget {
  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  final _formKey = GlobalKey<FormState>();

  var _isLogin = true;
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';
  var _userPhone = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xffFFFFFF),
      resizeToAvoidBottomPadding: false,
      body: Stack(fit: StackFit.expand, overflow: Overflow.visible, children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Image(
              image: AssetImage(
                "assets/images/bg.png",
              )),
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Center(
                      child: Text(
                        "تعيين كلمة المرور",
                        style: TextStyle(color: Color(0xff00B5F0), fontSize: 17),
                      )),
                  SizedBox(
                    height: 16.5,
                  ),
                  Center(
                      child: Text(
                        "أدخل الكود المرسل",
                        style: TextStyle(
                            color: Color(0xff18304B),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 14,
                  ),

                  Center(
                      child: Text(
                        "ومن ثم أدخل كلمة المرور الجديدة مرتين",
                        style: TextStyle(
                            color: Color(0xff18304B),
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                      )),
                  SizedBox(
                    height: 41.5,
                  ),
                  Container(
                    height: 432,
                    width: 327,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextFormField(
                            enableInteractiveSelection: false,
                            style: TextStyle(color: Colors.grey),
                            key: ValueKey("كود التعيين"),
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                            enableSuggestions: false,
                            validator: (value) {
                              if (value.isEmpty) {
                                return '';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              alignLabelWithHint: true,
                              filled: true,
                              fillColor: Color(0xffFAFAFA),
                              labelText: "كود التعيين",
                              labelStyle: TextStyle(
                                  color: Color(0xffA4B0BE), fontSize: 15),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                new BorderSide(color: Color(0xff18304B)),
                                borderRadius: new BorderRadius.circular(12),
                              ),
                            ),
                            onSaved: (value) {
                              _userName = value;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            key: ValueKey("كلمة المرور الجديدة"),
                            autocorrect: true,
                            textCapitalization: TextCapitalization.words,
                            enableSuggestions: false,
                            validator: (value) {
                              if (value.isEmpty || value.length < 4) {
                                return 'أدخل على الأقل ٤ حروف';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffFAFAFA),
                              labelText: "كلمة المرور الجديدة",
                              labelStyle: TextStyle(
                                  color: Color(0xffA4B0BE), fontSize: 15),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                new BorderSide(color: Color(0xff18304B)),
                                borderRadius: new BorderRadius.circular(12),
                              ),
                            ),
                            onSaved: (value) {
                              _userName = value;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            key: ValueKey("تأكيد كلمة المرور"),
                            autocorrect: true,
                            textCapitalization: TextCapitalization.words,
                            enableSuggestions: false,
                            validator: (value) {
                              if (value.isEmpty || value.length < 4) {
                                return 'أدخل على الأقل ٤ حروف';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffFAFAFA),
                              labelText: "تأكيد كلمة المرور",
                              labelStyle: TextStyle(
                                  color: Color(0xffA4B0BE), fontSize: 15),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                new BorderSide(color: Color(0xff18304B)),
                                borderRadius: new BorderRadius.circular(12),
                              ),
                            ),
                            onSaved: (value) {
                              _userName = value;
                            },
                          ),

                          SizedBox(
                            height: 36.0,
                          ),
                          Container(
                            width: 327,
                            height: 56,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0)),
                              color: Color(0xff00B5F0),
                              child: Text(
                                "حفظ",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.topRight,
          padding: EdgeInsets.only(top: 35.0,right: 13),
          child: SvgPicture.asset("assets/images/right_button.svg"),
        ),

      ]),
    );
  }
}