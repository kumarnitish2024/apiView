import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewAllDetails extends StatefulWidget {
  final String thumbnail;
  final String category;
  final String price;

  const ViewAllDetails({super.key, required this.thumbnail, required this.category, required this.price});

  @override
  State<ViewAllDetails> createState() => _ViewAllDetailsState();
}

class _ViewAllDetailsState extends State<ViewAllDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 400,
                  width: 650,
                  child: Image.network(widget.thumbnail)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(widget.category),
                Text("Rs $widget.price")
              ],
            ),
          )
        ],
      ),
    );
  }
}
