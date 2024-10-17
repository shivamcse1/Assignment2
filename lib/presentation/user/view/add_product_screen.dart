import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => AddProductScreenState();
}

class AddProductScreenState extends State<AddProductScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blue,
        title:const Text('Product Screen',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                           ),
             ),
              
            const SizedBox(height: 20,),
             InkWell(
              onTap: (){

              },
               child: Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(15)
                  ),
                 child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                 
                        Icon(Icons.photo,color: Colors.grey,),
                        SizedBox(width: 10,),
                        Text("Pick Image",style: TextStyle(color: Colors.grey),)
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
                    onPressed: (){
                   
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