import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryappdetails/food_provider.dart';
import 'package:provider/provider.dart';

import 'foodmodel.dart';

class fooddetails extends StatefulWidget {
  final id;
  const fooddetails({Key? key,required this.id}) : super(key: key);

  @override
  State<fooddetails> createState() => _fooddetailsState();
}

class _fooddetailsState extends State<fooddetails> {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<foodprovider>(context);
    final foods  = products.getdata(widget.id)??food();
    return Scaffold(
      appBar: AppBar(
        title: Text("Food Order",style: TextStyle(fontSize: 20),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              height: 200,
              child: Image.network("${foods.img}"),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.blue,
                  elevation: 10,
                  shadowColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name of the Burger: ${foods.name}",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            Text("Burger Price: ${foods.price} BDT",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.yellow),),
                            Text("Cheese Quantity: ${foods.cheeseQuantity}",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            Text("Location Name: ${foods.location}",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            Text("Burger Rating: ${foods.rating}",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)


                          ],
                        ),
                      )

                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),

    );
  }
}
