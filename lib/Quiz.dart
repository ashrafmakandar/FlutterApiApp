import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testingapp/Qui.dart';

void main() => runApp(Quiz());

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Qui q;
  List<Results> rr;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdatased();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getdatased(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: rr.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                  child: Text(rr[index].question,style: TextStyle(
                                    color: Colors.blue,fontStyle: FontStyle.normal,fontWeight: FontWeight.w900
                                  ),)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(rr[index].correctAnswer,style: TextStyle(
                    color: Colors.black87,fontStyle: FontStyle.normal,fontWeight: FontWeight.w500
                    ),),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Future<List<Results>> getdatased() async {
    var url = "https://opentdb.com/api.php?amount=10";
    http.Response r = await http.get(url);
    var rrr = json.decode(r.body);

    rr = Qui.fromJson(rrr).results;

    return rr;
  }
}
