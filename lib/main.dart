import 'package:currency_converter/currency_converter_material_page.dart';
import 'package:flutter/material.dart';
 
void main(){
  runApp(const MyApp());
}
//there are three types of widgets 
//1. Stateless widgets
//2. Stateful widgets
//3. Inherited widgets

// State: refers to any data that determines how your widget should look like, how it should be rendered or how it should behave
//creating a stateless widget
class MyApp extends StatelessWidget{
  const MyApp ({super.key});
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      home: CurrencyConverterMaterialPage(),
      
      );
   
    
  }
}

//materialApp
//cupertinoApp