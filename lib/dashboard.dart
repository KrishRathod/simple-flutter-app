import 'package:flutter/material.dart';
import 'package:shared_pref/loginPage.dart';
import 'package:shared_pref/splashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String username;
  String fullname;
  String PhoneNo;
  String Email;
  String Designation;

  @override
  void initState() {
    super.initState();
    name();
  }

  void name() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username');
      fullname = prefs.getString('fullname');
      PhoneNo = prefs.getString('PhoneNo');
      Email = prefs.getString('Email');
      Designation = prefs.getString('Designation');
    });
  }

  void _logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
    prefs.setString('username', username);
    prefs.setString('fullname', fullname);
    prefs.setString('PhoneNo', PhoneNo);
    prefs.setString('Email', Email);
    prefs.setString('Designation', Designation);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => Login()));
  }


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black, fontFamily: 'Nunito'),
        ),
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 12,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      "Name", 
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          fontFamily: 'Nunito'),  
                    ),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("$fullname",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 113, 113, 113))),
                ),
              ],
            ),
          ),
          Divider(
            height: 30,
            thickness: 1,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Email",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        fontFamily: 'Nunito'),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("$Email",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 113, 113, 113))),
                ),
              ],
            ),
          ),
          Divider(
            height: 30,
            thickness: 1,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "PhoneNo",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        fontFamily: 'Nunito'),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("$PhoneNo",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 113, 113, 113))),
                ),
              ],
            ),
          ),
          Divider(
            height: 30,
            thickness: 1,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Designation",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        fontFamily: 'Nunito'),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("$Designation",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 113, 113, 113))),
                ),
              ],
            ),
          ),
          Divider(
            height: 30,
            thickness: 1,
          ),
          TextButton.icon(
            label: Text("Log Out"),
            icon: Icon(Icons.logout),
            onPressed: () {
              _logOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (BuildContext ctx) {
                  return Dashboard();
                }),
              );
            },
          ),
          Divider(
            height: 30,
            thickness: 1,
          ),
        ],
      ),
    );
  }}