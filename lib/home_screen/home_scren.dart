import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

class Myhomescreen extends StatefulWidget {
  const Myhomescreen({super.key});

  @override
  State<Myhomescreen> createState() => _MyhomescreenState();
}

class _MyhomescreenState extends State<Myhomescreen> {
  String Getur = '';
  var Geturl = '';
  Future<Map<String, dynamic>> gpt4GenerateImageFromPrompt(
      String prompt) async {
    final openaiApiKey = "Add Api-key";
    final url = Uri.parse("https://api.openai.com/v1/images/generations");

    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $openaiApiKey",
    };

    final data = {
      "model": "dall-e-3",
      "prompt": prompt,
      "n": 1,
      "size": "1024x1024",
    };

    final response = await http.post(
      url,
      headers: headers,
      body: json.encode(data),
    );

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      return result;
    } else {
      final result = {
        "error": "Error: ${response.statusCode}\n${response.body}",
      };
      return result;
    }
  }

  void getimage() async {
    final result = await gpt4GenerateImageFromPrompt(gettext.toString());
    Getur = result['data'][0]['url'];
    Geturl = Uri.parse(Getur).toString();
    print(Geturl);
    setState(() {});
  }

  TextEditingController gettext = new TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            "DALLE-3 Application",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05),
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.width * 1,
                  child: Geturl.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: Geturl,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                              height: 50,
                              width: 50,
                              child:
                                  Center(child: CircularProgressIndicator())),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        )
                      : Center(
                          child: Text("Image Not available"),
                        )),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.8),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                color: Color.fromARGB(255, 134, 243, 134),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      controller: gettext,
                      style: TextStyle(color: Colors.black),
                    )),
                    IconButton(
                        onPressed: () {
                          getimage();
                          gettext.clear();
                        },
                        icon: Icon(
                          Icons.send,
                          color: Colors.black,
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
