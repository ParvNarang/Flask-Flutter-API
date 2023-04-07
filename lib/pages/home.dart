import 'dart:convert';
import 'package:flask_flutter_api/utils/httpFunction.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var result;
  String resultText = '';
  String url = '';
  final encodeController = TextEditingController();
  final decodeController = TextEditingController();
  final btnStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.grey[300]!),
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          backgroundColor: Colors.deepPurple,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:
          Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                   Text("Base 64 Converter",
                    style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: encodeController,
                    onChanged: (value) {
                      url = 'http://10.0.2.2:5000/api?op=encode&q=$value';
                    },
                    style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 18),
                    decoration: const InputDecoration(
                      hintText: "Enter text to encode"
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () async{
                      if(encodeController.text.isNotEmpty){
                        result = await fetchData(url);
                        var decodedResult = jsonDecode(result);
                        setState(() {
                          resultText = decodedResult['encoded'];
                          decodedResult = {};
                        });
                      }
                    },
                    style: btnStyle,
                    child: Text("ENCODE",style: Theme.of(context).textTheme.labelLarge,),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: decodeController,
                    onChanged: (value) {
                      url = 'http://10.0.2.2:5000/api?op=decode&q=$value';
                    },
                    style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 18),
                    decoration: const InputDecoration(
                        hintText: "Enter text to decode"
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () async{
                      if(decodeController.text.isNotEmpty){
                        result = await fetchData(url);
                        var decodedResult = jsonDecode(result);
                        setState(() {
                          resultText = decodedResult['decoded'];
                          decodedResult = {};
                        });
                      }
                    },
                    style: btnStyle,
                    child: Text("DECODE",style: Theme.of(context).textTheme.labelLarge,),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: (){
                      encodeController.clear();
                      decodeController.clear();
                      setState(() {
                        resultText = '';
                      });
                    },
                    style: btnStyle,
                    child: Text("CLEAR",style: Theme.of(context).textTheme.labelLarge,),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  resultText.isEmpty? const Text("",style: TextStyle(color: Colors.grey,fontSize: 29),) : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Result",style: Theme.of(context).textTheme.headlineSmall,),
                      const SizedBox(
                        height: 10,
                      ),
                      resultText=='error' ? const SelectableText("Please check your text",style: TextStyle(fontSize: 15,color: Colors.redAccent),) : Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SelectableText(resultText,style: const TextStyle(fontSize: 20),),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
    );
  }
}
