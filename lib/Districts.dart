import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testingapp/Countriesdata.dart';
import 'package:testingapp/Tvs.dart';

void main() => runApp(Districts());

class Districts extends StatefulWidget {
  @override
  _DistrictsState createState() => _DistrictsState();
}

class _DistrictsState extends State<Districts> {
  List<Countriesdata> da;
var items,bd;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getimages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: getimages(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {

                return ListView.builder(
                    itemCount: da.length,
                    itemBuilder: (context, index) {
                      for(items in da[index].currency)
                      {

                      }
                      for(bd in da[index].borders)
                      {

                      }

                      return InkWell(

                        onTap: ()=>{
                          Navigator.push(context,  MaterialPageRoute(builder: (BuildContext c)=> Tvs())
                          )},
                        child: Card(

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(da[index].name.common),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(da[index].name.official),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(da[index].name.native.common),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(da[index].name.native.official),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                              child: Text(items.toString()),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(da[index].capital.toString()),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(da[index].region.toString()),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(da[index].subregion.toString()),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(da[index].demonym.toString()),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(bd),
                              ),


                            ],
                          ),
                        ),
                      );
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }

  Future<List<Countriesdata>> getimages() async {
    var url = "https://restcountries.herokuapp.com/api/v1";
    http.Response r = await http.get(url);
    //print(json.decode(r.body));
    List re = json.decode(r.body);
    setState(() {
      da = re.map((e) => new Countriesdata.fromJson(e)).toList();
    });

    return da;
  }
}
