import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testingapp/Pra.dart';

void main() => runApp(Pray());

class Pray extends StatefulWidget {
  @override
  _PrayState createState() => _PrayState();
}

class _PrayState extends State<Pray> {
  Pra pras;

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
              return Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "FAJR " + pras.data.timings.fajr+":AM",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700,fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "DHUHR " + pras.data.timings.dhuhr+":PM",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700,fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "ASR " + pras.data.timings.asr+":PM",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700,fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "MAGHRIB " + pras.data.timings.maghrib+":PM",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700,fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "ISHA " + pras.data.timings.isha+":PM",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700,fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "DATE " + pras.data.date.readable,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700,fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "HIJRI " + pras.data.date.hijri.date,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700,fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "WEEKDAY " + pras.data.date.hijri.weekday.en,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700,fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "MONTH " + pras.data.date.hijri.month.en,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700,fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "TIMEZONE " + pras.data.meta.timezone,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700,fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  Future<Pra> getdata() async {
    var url =
        "http://api.aladhan.com/v1/timingsByCity?city=Bangalore&country=India&method=8";
    http.Response r = await http.get(url);
    pras = Pra.fromJson(json.decode(r.body));
    return pras;
  }
}
