import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testingapp/Repositorys.dart';

void main() => runApp(Reps());

class Reps extends StatefulWidget {
  @override
  _RepsState createState() => _RepsState();
}

class _RepsState extends State<Reps> {
  List<Repos> repos;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdatas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getdatas(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: repos.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 40,
                              child: ClipOval(
                                child: Image.network(
                                    repos[index].avatar.toString()),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(repos[index].name.toString()),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(repos[index].author.toString()),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(repos[index].stars.toString()),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(repos[index].forks.toString()),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(repos[index].language.toString()),
                              ),
                            ],
                          ),
                        ],
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

  Future<List<Repos>> getdatas() async {
    var url =
        "https://private-anon-291ceb6955-githubtrendingapi.apiary-mock.com/repositories";
    http.Response r = await http.get(url);
    List dd = json.decode(r.body);
    setState(() {
      repos = dd.map((e) => Repos.fromJson(e)).toList();
    });
    return repos;
  }
}
