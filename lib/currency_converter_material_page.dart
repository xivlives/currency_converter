import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatelessWidget{
  const CurrencyConverterMaterialPage({super.key});
  @override
  Widget build(BuildContext context){
    return const Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("0",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 45, color: Color.fromRGBO(255, 255, 255, 1)),
            ),
            TextField(
              style: TextStyle(
                color: Colors.white,
                fontSize: 20
              ),
              decoration: InputDecoration(
                
              ),
            )

          ],
        ),
      )
    );
  }
}