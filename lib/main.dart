import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Financial App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle namestyle = GoogleFonts.montserrat(
      fontWeight: FontWeight.w700, color: Colors.grey, fontSize: 18);

  TextStyle amountstyle = GoogleFonts.montserrat(
      fontWeight: FontWeight.w700, color: Colors.black, fontSize: 20);

  Widget buildTransactionCard(String date, String totalAmount, Widget transact1,
      Widget transact2, Widget transact3) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 19.0),
      height: 220,
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 5.0, left: 5.0),
                child: Text(
                  date,
                  style: namestyle,
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(top: 5.0, right: 5.0),
                child: Text(
                  totalAmount,
                  style: namestyle,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          transact1,
          transact2,
          transact3
        ],
      ),
    );
  }

  Widget buildAmount(
      Color bg_color, String name, String amount, IconData icon) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: bg_color,
        child: Center(
          child: Icon(icon),
        ),
      ),
      title: Text(
        name,
        style: amountstyle,
      ),
      trailing: Text(
        amount,
        style: amountstyle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F6),
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(color: Color(0xFF605BDD)),
            ),
          ),
          ListView(
            padding: EdgeInsets.all(8.0),
            children: <Widget>[
              SizedBox(
                height: 40.0,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "OVERVIEW",
                  style: GoogleFonts.montserrat(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Here is a list of your transactions",
                  style: GoogleFonts.montserrat(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                padding: EdgeInsets.all(13.0),
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 19.0),
                height: 140,
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.arrow_back_ios),
                        Text(
                          "September 2020",
                          style: GoogleFonts.montserrat(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          "Income",
                          style: namestyle,
                        ),
                        Text(
                          "Expenses",
                          style: namestyle,
                        ),
                        Text(
                          "Balance",
                          style: namestyle,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("\$5,000", style: amountstyle),
                        Text("\$2,000", style: amountstyle),
                        Text("\$3,000", style: amountstyle),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              buildTransactionCard(
                  "Saturday 26 Sept",
                  "\$2000",
                  buildAmount(Colors.blue, "Food", "-50", Icons.restaurant),
                  buildAmount(
                      Colors.yellow, "Clothes", "-200", Icons.blur_circular),
                  buildAmount(Colors.red, "Rent", "-1750", Icons.house)),
              SizedBox(
                height: 10.0,
              ),
              buildTransactionCard(
                  "Friday 25 Sept",
                  "\$200",
                  buildAmount(Colors.blue, "Food", "-80", Icons.restaurant),
                  buildAmount(
                      Colors.yellow, "Clothes", "-100", Icons.blur_circular),
                  buildAmount(Colors.green, "Phone", "-20", Icons.phone))
            ],
          )
        ],
      ),
    );
  }
}
