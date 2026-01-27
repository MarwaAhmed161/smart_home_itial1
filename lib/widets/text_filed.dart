import 'package:flutter/material.dart';

class Textfiled extends StatelessWidget {
  const Textfiled({super.key, required this.hinttext});
  final String hinttext;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(

        decoration: InputDecoration(

            focusedBorder: OutlineInputBorder(
                borderRadius:BorderRadius.all(Radius.circular(20)) ,
                borderSide: BorderSide(color: Colors.green)
            ),

            border: OutlineInputBorder(),
            hintText: hinttext
        ),
      ),
    );
  }
}
