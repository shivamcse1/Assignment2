// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, avoid_print, unnecessary_overrides, avoid_unnecessary_containers

import 'dart:convert';
import 'dart:io';

import 'package:assignment/main.dart';
import 'package:assignment/presentation/user/auth/login_screen.dart';
import 'package:assignment/presentation/user/view/add_product_screen.dart';
import 'package:flutter/material.dart';

import '../../../data/local_data_base.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with RouteAware{
  TextEditingController searchController = TextEditingController();
  LocalDataBaseHelper localdatabase = LocalDataBaseHelper();

  bool isSearching = false;
  double price = 199;
  dynamic productList ;
  List productDataList =[];

  List filterList = [];


    @override
  void initState() {
    super.initState();
     
    productList = localdatabase.getData();
    if(productList==null){  setState(() {  productDataList = []; }); 
      
     }
    else{
     productDataList = productList.map((indexItem){
         return jsonDecode(indexItem);
      }).toList();
      setState(() {
        print(productDataList);
      });
    }

    filterList = productDataList;
    
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final route = ModalRoute.of(context);
    if (route is PageRoute<dynamic>) {
      routeObserver.subscribe(this, route);
    }
 
  }
 
 @override
  void didPopNext() {
    super.didPopNext();

     productList = localdatabase.getData();
    if(productList==null){  setState(() {  productDataList = []; });  }
    else{
     productDataList = productList.map((indexItem){
         return jsonDecode(indexItem);
      }).toList();
      setState(() {
        print(productDataList.length);
      });
    }

    filterList = productDataList;

  }
 
 @override
  void dispose() {
    super.dispose();
    routeObserver.unsubscribe(this);
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         
         appBar: PreferredSize(
          preferredSize: const Size(0, 50),
           child: AppBar(
         
            actions: [
              Container(
                margin: const EdgeInsets.only(right:10 ),
                padding: const EdgeInsets.all(10),
                 decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade200),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)
                 ),
                child: IconButton(
                   style:IconButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(0, 0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap

                   ) ,
                  icon: Icon(isSearching ? Icons.close : Icons.search,size: 20,),
                  onPressed: () {
                    setState(() {
                      isSearching = !isSearching; 
                      if (!isSearching) searchController.clear();
                    });
                  },
                ),),

              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(onPressed: (){
                     Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (context){
                          return const LoginScreen();
                        }), 
                      (route) => false
                      );
                },
                icon: Icon(Icons.logout)),
              )  
            ],
            title: isSearching ? Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextFormField(
                  controller: searchController,
                  onChanged: (value) {
                    
                     setState(() {
                      filterList = productDataList
                          .where((item) => item['name']
                              .toString()
                              .toLowerCase()
                              .contains(value.toLowerCase()))
                          .toList();
                    });
                  },
                  autofocus: true,
                  style: const TextStyle(color: Colors.grey),
                  decoration: const InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
            )
            : Container(
               
                padding: const EdgeInsets.all(10),
                 decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade200),
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(15)
                 ),
                child: 
                  const Padding(
                    padding: EdgeInsets.only(left:4.0),
                    child: Icon(Icons.arrow_back_ios,color: Colors.grey,size: 18,),
                  ),
                  
                ),) ,
           ),
           body: 
           productDataList.isEmpty ?

           Container(
            child: Center(child: Text("No Prodcut Found",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
           )

          : SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
             child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20.0),
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
               
                  const SizedBox(height: 30,),
                  const Text('Hi-Fi Shop & Service',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 15,),
             
                  Text('Audio shop on Rustaveli Ave 57',style: TextStyle(fontSize: 14,color: Colors.grey.shade400),),
             
                  const SizedBox(height: 8,),
                  Text('This shop offers both products and services',style: TextStyle(fontSize: 14,color: Colors.grey.shade400),),
                  
                  const SizedBox(height: 35,),
             
                  Row(
                    children: [
                      const Text("Products",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
                     
                       Padding(
                        padding: EdgeInsets.only(left: 5.0,top: 2.0),
                        child: Text(productDataList.length.toString(),style: TextStyle(fontSize: 20,color: Colors.grey)),
                      ),
                      const Spacer(),
                      TextButton(onPressed: (){
             
                      }, 
                      child: Text("Show all",style: TextStyle(color: const Color(0xFF0000FF).withOpacity(.5),fontWeight: FontWeight.bold),)
                      )
                    ],
                  ),
             
                  const SizedBox(height: 15,),
             
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: filterList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(

                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1/1.6
                      ), 
             
                      itemBuilder: (context,index){
             
                      return  Stack(
                        children:[ 
                          
                        Container(
                          
                          width: 180,
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 15),
                              // padding: const EdgeInsets.all(5),
                              height: 150,
                              width: 180,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Image.file(
                                fit: BoxFit.fill,
                                File(filterList[index]["imagePath"])),
                            ),
                        
                            Text(filterList[index]["name"],style: TextStyle(fontWeight: FontWeight.bold),),
                        
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text('\$${filterList[index]["price"]}',style: const TextStyle(color: Colors.grey),)
                            )
                          ]
                        
                          ),
                        ),
             
                    Positioned(
                      top: 2,
                      right: 5,
                      child: IconButton(
                        onPressed: () async{
                       return await showDialog(context: (context), 
                         builder: (contex){
                          return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                          ),
                          contentPadding: const EdgeInsets.only(left: 25,top: 5,right: 25,bottom: 5),
                            title:const Text("Delete",style: TextStyle(fontWeight: FontWeight.w500),),
                            content: Text("Are you sure you want to delete this product?",style: TextStyle(
                              fontSize: 18
                            ),),
                            actions: [
                              TextButton(
                                  style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2)
                                  )
                                  ),
                                  onPressed: () {
                                    productDataList.removeAt(index);
                                    localdatabase.updateData(keyValue: 'data', dataList: productDataList);
                                    Navigator.pop(context);
                                  },
                                  child:Text("YES",style: TextStyle(color: Colors.red,fontSize: 16),)
                                ),
                
                              TextButton(
                                  style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2)
                                  ),
                                  padding: EdgeInsets.zero
                                  ),
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                  child: Text("NO",style: TextStyle(color: Colors.green,fontSize: 16))
                              
                                ),
                            
                            ],
                          );
                        },
                       );
                      },
                      icon:const Icon(Icons.delete,size: 30,)),
                    )
                    
                    ]);
               }),
             
                  const SizedBox(height: 10,),
             
                  Row(
                    children: [
                      const Text("Accessories",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
                     
                       Padding(
                        padding: EdgeInsets.only(left: 5.0,top: 2.0),
                        child: Text(productDataList.length.toString(),style: TextStyle(fontSize: 20,color: Colors.grey)),
                      ),
                      const Spacer(),
                      TextButton(onPressed: (){
             
                      }, 
                      child: Text("Show all",style: TextStyle(color: const Color(0xFF0000FF).withOpacity(.5),fontWeight: FontWeight.bold),)
                      )
                    ],
                  ),


                 const SizedBox(height: 15,),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: filterList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(

                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1/1.8

                      ), 
             
                      itemBuilder: (context,index){
             
                      return  Stack(
                        children:[ 
                          
                        Container(
                          
                          width: 180,
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 15),
                              // padding: const EdgeInsets.all(20),
                              height: 150,
                              width: 180,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Image.file(
                                fit: BoxFit.fill,
                                File(filterList[index]["imagePath"])),
                            ),
                        
                            Text(filterList[index]["name"],style: TextStyle(fontWeight: FontWeight.bold),),
                            
                            const SizedBox(height: 5,),
                            Row(
                              children: [
                                
                                Container(
                                  height: 8,
                                  width: 8,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green
                                  ),
                                ),
                                const SizedBox(width: 5,),

                                const Text("Available")
                              ],
                            ),
                        
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: Text('\$${filterList[index]["price"]}',style: const TextStyle(color: Colors.grey),)
                            )
                          ]
                        
                          ),
                        ),
             
                    Positioned(
                      top: 2,
                      right: 5,
                      child: IconButton(onPressed: (){
                      
                      },
                      icon:const Icon(Icons.delete,size: 30,)),
                    )
                    
                    ]);
                   }),
         
                ],
               ),
               
             ),
           ),
      floatingActionButton: FloatingActionButton(
             shape: const CircleBorder(),
         backgroundColor: const Color.fromARGB(255, 33, 51, 243),
        onPressed: (){
           
           Navigator.push(context, MaterialPageRoute(builder: (context){
            return const AddProductScreen();
           }));
        },
      child: const Icon(Icons.add,color: Colors.white,),   
     ),     
    );
  }
}