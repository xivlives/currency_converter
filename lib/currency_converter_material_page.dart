import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



  // 1. Create a variable that stores the converted currency value
  // 2. Create a function that multiplies the amount given in the text-field by the exchange rate
  // 3. store the value in the variable we created
  // 4. display the stored variable



  class CurrencyConverterMaterialPage extends StatefulWidget{
    const CurrencyConverterMaterialPage({super.key});
    @override
    State<CurrencyConverterMaterialPage> createState() {
      return _CurrencyConverterMaterialPage();
      
    } 

    
  }

  //state class
  class _CurrencyConverterMaterialPage extends State<CurrencyConverterMaterialPage>{
    final TextEditingController textEditingController = TextEditingController();
    double result = 0 ;
    double exchangeRate = 0;
        Future<double> getExchangeRate() async {
          final response = await http.get(Uri.parse('https://api.exchangerate-api.com/v4/latest/USD'));
          if (response.statusCode == 200) {
            final data = jsonDecode(response.body);
            return data['rates']['NGN'];
          } else {
          throw Exception('Failed to load exchange rate');
      }
}
  @override
  void initState() {
    super.initState();
    getExchangeRate().then((rate) {
      setState(() {
        exchangeRate = rate;
      });
    });
  }
  @override
  Widget build(BuildContext context){
    const borderDef = OutlineInputBorder(
                  borderSide:  BorderSide(color: Colors.black12),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                );
   const onFocusedBorder = OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                );            
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Curency Converter', style: TextStyle(fontFamily: 'Platypi', fontSize: 24),),
        backgroundColor: Colors.grey.shade300,
        centerTitle: true,
      ),
      backgroundColor:  Colors.blueAccent,
      body: Center(child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text('₦${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}',
              style: const TextStyle(
                fontWeight:
                FontWeight.w800, 
                fontSize: 45, 
                color: Color.fromRGBO(255, 255, 255, 1),
                ),
            ),
            Container(
              padding: const EdgeInsets.all (10.0),
              child:  TextField(
                controller: textEditingController,
                style:  const TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),
                decoration: const InputDecoration(
                  hintText: 'enter ammount in USD', 
                  hintStyle: TextStyle(color: Colors.white30,
                  ),
                  prefixIcon: Icon(Icons.monetization_on_rounded),
                  prefixIconColor: Colors.white30,
                  filled: true,
                  fillColor: Colors.grey,
                  border: borderDef,
                  focusedBorder: onFocusedBorder,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true
                ),
              ),
            ),
            //button
            // raised- normal buttons 
            // appears like a text
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    result = double.parse(textEditingController.text) * exchangeRate;
                  });
                  // print(result);
                }, 
                style:  ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(Colors.black), 
                  foregroundColor: const MaterialStatePropertyAll(Colors.white),
                  minimumSize: const MaterialStatePropertyAll(Size(double.infinity, 50)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(10),
                    )
                  ),
                ),
                child: const Text('convert'),
              ),
            ),

          ],
        ),
      )
    );
  }
}