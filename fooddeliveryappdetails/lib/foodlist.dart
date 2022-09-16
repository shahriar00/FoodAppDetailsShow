import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryappdetails/food_provider.dart';
import 'package:provider/provider.dart';

import 'fooddetails.dart';

class Foodlist extends StatefulWidget {
  const Foodlist({Key? key}) : super(key: key);

  @override
  State<Foodlist> createState() => _FoodlistState();
}

class _FoodlistState extends State<Foodlist> {

  @override
  Widget build(BuildContext context) {
    final productdata = Provider.of<foodprovider>(context);
    final product = productdata.fooddata;
    return Scaffold(
      appBar: AppBar(
        title: Text("Food Order",style: TextStyle(fontSize: 20),),
        centerTitle: true,
      ),
      body: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 2.0,mainAxisSpacing: 2.0),
          itemBuilder: (BuildContext context,int index){
              return Container(
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>fooddetails(id:productdata.fooddata[index].id)));
                },
                child: Card(
                  color: Colors.blue,
                  elevation: 10,
                  shadowColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       Image.network("${productdata.fooddata[index].img}",fit: BoxFit.cover,),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${productdata.fooddata[index].name}",style: TextStyle(fontSize: 20),),

                            ],
                        )
                      ],



                    ),
                  ),
                ),
              ),

                
              );
        
          },itemCount: 8,),
    );
  }
}
