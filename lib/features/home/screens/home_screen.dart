import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/homeScreen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEFEFE),

      //backgroundColor: Color.fromRGBO(100,100,100,0.6 ),
      appBar: AppBar(
        automaticallyImplyLeading: false,

      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
             // Center(child: Text("Excel HRM DashBoard")),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left:14),
                      child: Text("DashBoard",style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      //color: Colors.redAccent,
                      height: 250,
                      child: ListView.builder(
                        //physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: 2,
                          //itemExtent: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 11),
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(0, 18, 0, 10),
                                decoration: BoxDecoration(
                                  // color: Colors.blueGrey,
                                  color: Colors.blueGrey,

                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 111,
                                width: double.infinity,
                                child: ListTile(
                                  leading: Icon(
                                    Iconsax.personalcard,
                                    size: 43,
                                  ),
                                  title: Text("Total"),
                                  subtitle: Text("Staff"),
                                  trailing: Text("81"),
                                ),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 155,
                      //padding: const EdgeInsets.fromLTRB(5, 18, 0, 10),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:  Column(
                        children: [
                          Container(
                           padding: const EdgeInsets.fromLTRB(0, 18, 0, 10),

                            decoration: BoxDecoration(
                              //color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(10),

                            ),
                            height: 97,
                            width: double.infinity,
                            child: ListTile(
                              leading: Icon(
                                Iconsax.personalcard,
                                size: 43,
                              ),
                              title: Text("Total"),
                              subtitle: Text("Staff"),
                              trailing: Text("81"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16
                                , 0, 0, 0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                                child: Text("22,521,000.00 cr",style: TextStyle(fontSize: 22.0),)
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      //color: Colors.redAccent,
                      height: 400,
                      child: ListView.builder(
                          shrinkWrap: true,

                          scrollDirection: Axis.vertical,
                          itemCount: 3,
                          //itemExtent: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 11),
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(0, 18, 0, 10),
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 111,
                                width: double.infinity,
                                child: ListTile(
                                  leading: Icon(
                                    Iconsax.personalcard,
                                    size: 43,
                                  ),
                                  title: Text("Total"),
                                  subtitle: Text("Staff"),
                                  trailing: Text("81"),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
