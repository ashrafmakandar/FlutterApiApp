import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testingapp/Actors.dart';
import 'package:testingapp/gettext.dart';

void main() => runApp(Details());

class Details extends StatefulWidget {
  final int index;

  Details({this.index});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List<Actors> ac;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata(this.widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getdata(this.widget.index),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: ac.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: [
                          CachedNetworkImage(
                            imageUrl: ac[index].person.image.original,
                          ),
                          gettexthere(ac[index].person.name),
                          gettexthere(ac[index].person.birthday),
                          gettexthere(ac[index].person.gender),
                          gettexthere(ac[index].person.country.name),
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

  Future getdata(int index) async {
    var url = "http://api.tvmaze.com/shows/$index/cast";
    http.Response r = await http.get(url);

    if (r.statusCode == 200) {
      print(r.body);
      List<Actors> toReturn = List();
      List jsons = json.decode(r.body);

      for (Map unparsed in jsons) {
        toReturn.add(Actors.fromJson(unparsed));
      }
      ac = toReturn;
      return ac;
    } else {
      throw Exception('Error getting brewery');
    }
  }
}
