import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:todo/pages/addpage.dart';

import '../models/FirebaseUser.dart';
import 'authenticate/handler.dart';
import 'home/home.dart';

class Wrapper extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    
    final user =  Provider.of<FirebaseUser?>(context);
    
     if(user == null)
     {
       return Handler();
     }else
     {
       return AddPage();
     }

  }
} 