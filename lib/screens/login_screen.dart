import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lamp/screens/home_screen.dart';
import 'package:lamp/screens/signup_screen.dart';
import 'package:lamp/widgets/auth_form.dart';
import 'package:lamp/widgets/bottomAppBarItems.dart';
import 'package:lamp/widgets/forget_password.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

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
      body: Stack(children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Image(
            image: AssetImage("assets/images/bg.png"),
          ),
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Center(
                  child: Text(
                "تسجيل الدخول",
                style: TextStyle(color: Color(0xff00B5F0), fontSize: 17),
              )),
              SizedBox(
                height: 16.5,
              ),
              Center(
                  child: Text(
                "هلا فيك في متجر لامب!",
                style: TextStyle(
                    color: Color(0xff18304B),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  //  fontFamily: "assets/fonts/DINNextLTArabic-Bold"
                ),
              )),
              SizedBox(
                height: 41.5,
              ),
              Container(
                height: 326,
                width: 327,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFormField(
                        enableInteractiveSelection: false,
                        style: TextStyle(color: Colors.grey),
                        key: ValueKey("رقم الجوال/البريد الالكتروني"),
                        autocorrect: false,
                        textCapitalization: TextCapitalization.none,
                        enableSuggestions: false,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'من فضلك أدخل ايميل صالح';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          filled: true,
                          fillColor: Color(0xffFAFAFA),
                          labelText: "رقم الجوال / البريد الالكتروني",
                          labelStyle:
                              TextStyle(color: Color(0xffA4B0BE), fontSize: 15),
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
                          _userEmail = value;
                        },
                      ),
                      TextFormField(
                        key: ValueKey("كلمة المرور"),
                        validator: (value) {
                          if (value.isEmpty || value.length < 4) {
                            return 'أدخل على الأقل ٤ حروف';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                           alignLabelWithHint: true,
                          filled: true,
                          fillColor: Color(0xffFAFAFA),
                         // hintText: "كلمة المرور",
                          labelText: "كلمة المرور",
                          suffixIcon: InkWell(
                            onTap: (){_toggle();},
                            child: UnconstrainedBox(
                                child: _obscureText
                                    ?
                                     ImageIcon(
                                          AssetImage("assets/icons/eye_hide.png"),
                                          size: 23,
                                       color: Colors.grey,
                                        )

                                    :
                                ImageIcon(
                                  AssetImage("assets/icons/eye.png"),
                                  size: 23,
                                  color: Colors.grey,
                                )
                                    ),
                          ),
                          errorStyle: TextStyle(color: Color(0xffF45540)),

                          hintStyle:
                          TextStyle(color: Color(0xffA4B0BE), fontSize: 15),
                          labelStyle:
                        TextStyle(color: Color(0xffA4B0BE), fontSize: 15),
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
                        obscureText: _obscureText,
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Container(
                        width: 327,
                        height: 56,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          color: Color(0xff00B5F0),
                          child: Text(
                            "تسجيل الدخول",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(HomeScreen.routeName);
                          },
                        ),
                      ),
                      FlatButton(
                        child: Text(
                          "نسيت كلمة المرور؟",
                          style:
                              TextStyle(color: Color(0xff282F39), fontSize: 15),
                        ),
                        onPressed: () {
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
                                    heightFactor: 0.88,
                                    child: ForgetPasswordCard(),
                                  ));
                        },
                      ),
                      Container(
                          child: Center(
                        child: RichText(
                          text: TextSpan(
                              text: 'هل أنت مستخدم جديد في ضرار؟',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'أنشئ حسابك',
                                  style: TextStyle(
                                      color: Color(0xff1775BB),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                )
                              ]),
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
