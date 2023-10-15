import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nk_api/controller/https_request.dart';
import 'package:http/http.dart' as http;

import 'details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: RequestControllers().getData(),
        builder: (context, snapshot) {
          var resData = snapshot.data;

          return ListView.builder(
            itemCount: resData?.products?.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => ViewAllDetails(
                              thumbnail: "${resData?.products?[index].thumbnail}",
                            category: "${resData?.products?[index].category}",
                            price: "${resData?.products?[index].price}",


                          ),));
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage("${resData?.products?[index].thumbnail}"),
                        ),
                        title: Text("${resData?.products?[index].category}"),
                        subtitle: Text("${resData?.products?[index].description}"),
                        trailing: Text("${resData?.products?[index].price}"),
                      ),
                    ),
                    if (index < (resData?.products?.length ?? 0))
                      Divider(color: Colors.black),
                  ],
                ),
              );
            },);
        },

      ),
    );
  }


}
