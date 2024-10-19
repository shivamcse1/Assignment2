// ignore_for_file: use_build_context_synchronously, await_only_futures, avoid_print
import 'dart:convert';
import 'dart:io';
import 'package:assignment/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => AddProductScreenState();
}

class AddProductScreenState extends State<AddProductScreen> {
   final formKey = GlobalKey<FormState>(); 
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  dynamic imagePath ;
  bool isSavedData = false;

  Map<String,dynamic> dataMap = {};
  List<String> dataList =  [];

  Future<void> saveData() async {
       try{
              isSavedData = false;
           if (nameController.text.isEmpty ||
              priceController.text.isEmpty ||

              imagePath == null
              ) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.pink,
                content: Text('Please fill all fields and select image.')),
            );
            return;
          }

          final SharedPreferences prefs = await SharedPreferences.getInstance();

          print(imagePath);
          dataMap ={
          "name": nameController.text,
          "price": priceController.text,
          "imagePath": imagePath,
          };
          
          var data = await prefs.getStringList("data");
          if(data==null){
            dataList.add(jsonEncode(dataMap));
            await prefs.setStringList('data',dataList);
        
          } 
          else{
            data.add(jsonEncode(dataMap));
            await prefs.setStringList('data',data);
              
          }

          setState(() {
            isSavedData = true;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Product saved successfully!')),
          );
        
       }
       catch(ex){
           
            ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error Ocurred $ex")),
          );

       }
    
  }
  
 
  Future<void> deleteData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    
    await prefs.clear();
   
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blue,
        title:const Text('Product Screen',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,

        // actions: [

        //   GestureDetector(
        //     onTap: (){
               
            
        //     },
        //     child: const Icon(Icons.home)),
          
        //   Padding(
        //     padding: const EdgeInsets.all(10.0),
        //     child: GestureDetector(
        //       onTap: (){
        //          deleteData();
                
        //       },
        //       child: const Icon(Icons.delete)),
        //   )
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
             
            
             Form(
              key: formKey,
               child: Column(
                 children: [
               
                   Padding(
                     padding: const EdgeInsets.symmetric(vertical: 10.0),
                     child: TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        ),
                      hintText: "Enter Product Name",
                      hintStyle: TextStyle(color: Colors.grey)
                      ),
                       validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter product name';
                        }
                        return null;
                      },
                    ),
                   ),
               
                    Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: priceController,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        ),
                      hintText: "Enter Product Price",
                      hintStyle: TextStyle(color: Colors.grey)
                      ),
                       validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter product price';
                        } else if (double.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                      ),
                    ),
                           
                 ],
               ),
             ),
              
            const SizedBox(height: 20,),
             GestureDetector(

              onTap: ()async{
                final picker = ImagePicker();
                final pickImage = await picker.pickImage(source: ImageSource.gallery);
               
                if(pickImage!=null){
                  // File pickImageFile = File(pickImage.path);
                  setState(() {
                    imagePath = pickImage.path ;
                  });
                  UiHelper.showToast(toastMsg: "Image Picked Successfully");

                }else{
                  
                  UiHelper.showToast(toastMsg: "Image Not Picked");
                }

              },
               child: Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(15)
                  ),
                 child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: 
                          
                          imagePath != null ? Image.file(File(imagePath))
                          : const Icon(
                            Icons.photo,
                            color: Colors.grey,),
                        ),
                        const SizedBox(width: 10,),
                        const Text("Pick Image",style: TextStyle(color: Colors.grey),)
                      ],
                    ),  
                 ),
             ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: SizedBox(
                  height: 45,
                  width: double.infinity,
                   child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0000FF).withOpacity(.8),
                      
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      )
                    ),
                    onPressed: () async{
                        await saveData();
                        if(isSavedData == true){
                          Navigator.pop(context);
                       }

                    },
                    child:const Text("Add Product",
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white),) 
                   ,),
                  ),
                ),


          ],
        ),
      ),
    );
  }

  
}