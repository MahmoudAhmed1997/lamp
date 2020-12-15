import 'package:flutter/material.dart';
import 'package:lamp/screens/designer_profile.dart';
import 'package:lamp/screens/fliters_screen.dart';
import 'package:lamp/screens/home_screen.dart';
import 'package:lamp/screens/login_screen.dart';
import 'package:lamp/screens/new_product_screen.dart';
import 'package:lamp/screens/reset_screen.dart';
import 'package:lamp/screens/signup_screen.dart';
import 'package:lamp/screens/splash_screen.dart';
import 'package:lamp/widgets/designer_card.dart';
import 'package:lamp/widgets/prod.dart';

void main(){
  runApp(MaterialApp(debugShowCheckedModeBanner:false ,home:FliterProducts()));
}