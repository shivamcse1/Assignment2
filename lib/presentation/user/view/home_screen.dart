// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:assignment/presentation/user/view/add_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;
  double price = 199;
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
                
                },
                icon: Icon(Icons.logout)),
              )  
            ],
            title: isSearching ? Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextFormField(
                  controller: searchController,
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
           body: SingleChildScrollView(
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
                     
                      const Padding(
                        padding: EdgeInsets.only(left: 5.0,top: 2.0),
                        child: Text('45',style: TextStyle(fontSize: 20,color: Colors.grey)),
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
                    itemCount: 2,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(

                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1/1.35
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
                              padding: const EdgeInsets.all(20),
                              height: 140,
                              width: 180,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Image.asset("assets/images/headphone.png"),
                            ),
                        
                            const Text("AKG N700NCM2 Wireless Headphones",style: TextStyle(fontWeight: FontWeight.bold),),
                        
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text('\$${price.toStringAsFixed(2)}',style: const TextStyle(color: Colors.grey),)
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
             
                  const SizedBox(height: 10,),
             
                  Row(
                    children: [
                      const Text("Accessories",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
                     
                      const Padding(
                        padding: EdgeInsets.only(left: 5.0,top: 2.0),
                        child: Text('19',style: TextStyle(fontSize: 20,color: Colors.grey)),
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
                    itemCount: 2,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(

                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1/1.5

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
                              padding: const EdgeInsets.all(20),
                              height: 140,
                              width: 180,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Image.asset("assets/images/headphone.png"),
                            ),
                        
                            const Text("AKG N700NCM2 Wireless Headphones",style: TextStyle(fontWeight: FontWeight.bold),),
                            
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
                              child: Text('\$${price.toStringAsFixed(2)}',style: const TextStyle(color: Colors.grey),)
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