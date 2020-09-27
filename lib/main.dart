import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  CalendarController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

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

  Widget buildAmount(Color bgColor, String name, String amount, IconData icon) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: bgColor,
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
          Container(
            height: 300,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Color(0XFF00B686), Color(0XFF00838F)],
            )),
          ),
          ListView(
            padding: EdgeInsets.all(8.0),
            children: <Widget>[
              SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  Text(
                    "OVERVIEW",
                    style: GoogleFonts.montserrat(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                  Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              // Container(
              //   alignment: Alignment.center,
              //   child: Text(
              //     "Transactions List",
              //     style: GoogleFonts.montserrat(
              //         fontSize: 18,
              //         color: Colors.white,
              //         fontWeight: FontWeight.w700),
              //   ),
              // ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                children: [
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      color: Color(0XFF00B686),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.1),
                            blurRadius: 8,
                            spreadRadius: 3)
                      ],
                      border: Border.all(
                        width: 1.5,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    padding: EdgeInsets.all(5),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1600353067943-bda64e5a5178?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1300&q=80"),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sarah Jean",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.monetization_on_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RichText(
                            text: TextSpan(
                              text: "5320.50",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(13.0),
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 19.0),
                height: 351,
                decoration: BoxDecoration(color: Colors.white),
                child: TableCalendar(
                  calendarStyle: CalendarStyle(
                      todayColor: Colors.white,
                      selectedColor: Theme.of(context).primaryColor,
                      todayStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Colors.red)),
                  headerStyle: HeaderStyle(
                      centerHeaderTitle: true,
                      formatButtonDecoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      formatButtonTextStyle: TextStyle(color: Colors.white)),
                  calendarController: _controller,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              buildTransactionCard(
                  "Saturday 26 Sept",
                  "\$2000",
                  buildAmount(Colors.blue, "Food", "-\$50", Icons.restaurant),
                  buildAmount(
                      Colors.yellow, "Clothes", "-\$200", Icons.blur_circular),
                  buildAmount(Colors.red, "Rent", "-\$1750", Icons.house)),
              SizedBox(
                height: 10.0,
              ),
              buildTransactionCard(
                  "Friday 25 Sept",
                  "\$200",
                  buildAmount(Colors.blue, "Food", "-\$80", Icons.restaurant),
                  buildAmount(
                      Colors.yellow, "Clothes", "-\$100", Icons.blur_circular),
                  buildAmount(Colors.green, "Phone", "-\$20", Icons.phone))
            ],
          )
        ],
      ),
    );
  }
}
