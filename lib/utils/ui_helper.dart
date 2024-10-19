import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UiHelper{

    static showToast({String toastMsg="Error Occured"}){
        
          Fluttertoast.showToast(
            msg:toastMsg ,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
    }

}