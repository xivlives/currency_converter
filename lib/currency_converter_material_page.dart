import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatelessWidget{
  const CurrencyConverterMaterialPage({super.key});
  @override
  Widget build(BuildContext context){
    // declared my border styles in variables
    const borderDef = OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black12),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                );
    const onFocusedBorder = OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                );            
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 95, 182, 254),
      body: Center(child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("0",
              style: TextStyle(
                fontWeight:
                FontWeight.w800, 
                fontSize: 45, 
                color: Color.fromRGBO(255, 255, 255, 1),
                ),
            ),
            TextField(
              style: TextStyle(
                color: Colors.white,
                fontSize: 20
              ),
              decoration: InputDecoration(
                hintText: 'enter ammount in NGN', 
                hintStyle: TextStyle(color: Colors.white30,
                ),
                prefixIcon: Icon(Icons.monetization_on_rounded),
                prefixIconColor: Colors.white30,
                filled: true,
                fillColor: Colors.grey,
                border: borderDef,
                focusedBorder: onFocusedBorder,
              ),
              keyboardType: TextInputType.number,
            )

          ],
        ),
      )
    );
  }
}