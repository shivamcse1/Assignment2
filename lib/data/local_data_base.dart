import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class LocalDataBaseHelper {
 
 Future init() async{
   localDb = await SharedPreferences.getInstance();
   }
 
  //------------Read data from local Storage-------------//
   List<String>? getData () {
   return (localDb.getStringList("data"));
   }

  //------------ Update Data in Local storage ------------//
  void updateData ({required String keyValue,required List<dynamic>dataList }){
     List<String> updateList = dataList.map((mapData) {
          return jsonEncode(mapData);
     }).toList();
     localDb.setStringList(keyValue,updateList);
  }

  //------------ Delete Data in Local storage ------------//
  void deleteData (String keyValue) {
    localDb.remove(keyValue);
  }

   //------------Clear whole Data in Local storage ------------//
  void deleteAllData () async{
    await localDb.clear();
  }

}