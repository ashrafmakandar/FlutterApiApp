import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testingapp/Devs.dart';
import 'package:testingapp/Quiz.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(Tvs());

class Tvs extends StatefulWidget {
  @override
  _TvsState createState() => _TvsState();
}

class _TvsState extends State<Tvs> {
  List<Devs> tvshows;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getdata(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: tvshows.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            (MaterialPageRoute(
                                builder: (BuildContext context) => Quiz())));
                      },
                      child: Card(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 35,
                                child: ClipOval(
                                  child: Image.network(
                                    tvshows[index].avatar,
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(tvshows[index].name.toString()),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      Text(tvshows[index].username.toString()),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  Future<List<Devs>> getdata() async {
    var url =
        "https://private-anon-291ceb6955-githubtrendingapi.apiary-mock.com/developers";
    http.Response r = await http.get(url);
    List tvss = json.decode(r.body);
   // print(tvss.toString());
    setState(() {
      tvshows = tvss.map((e) => Devs.fromJson(e)).toList();
    });
    return tvshows;
  }

  _launchurl(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false);
    } else {
      throw 'Could not launch $url';
    }
  }
}
