import 'package:flutter/material.dart';
import 'package:music_practice/helper/helpers.dart';

class landscapeSearch extends StatelessWidget {
  const landscapeSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            'Library',
            style: AppStyle.library,
          ),
        ),
        // Expanded(child: Container()),
        Expanded(
          child: Container(
            height: 50,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.white)),
            child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 30.0,
                    ),
                    hintText: 'Song or Artist',
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: Colors.white)))),
          ),
        )
      ],
    );
  }
}
