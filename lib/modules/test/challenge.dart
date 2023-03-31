import 'package:flutter/material.dart';

class Challenge extends StatefulWidget {
  const Challenge({Key? key}) : super(key: key);

  @override
  _ChallengeState createState() => _ChallengeState();
}

class _ChallengeState extends State<Challenge> {
  double slider_val = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 19, 17, 31),
      appBar: AppBar(
        title: Text('BMI Calculator'),
        backgroundColor: Color.fromARGB(255, 19, 17, 31),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(15),
        height: 98,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 2)
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              height: 9,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 0, 157),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text("Calculer",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 14,
                      )),
                ),
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    // width: MediaQuery.of(context).size.width,
                    width: MediaQuery.of(context).size.width / 2.4,
                    height: 140,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 56, 55, 53)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        Icon(
                          Icons.male,
                          size: 100,
                          color: Colors.white,
                        ),
                        Text(
                          "MALE",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 211, 204, 204)),
                        )
                      ]),
                    ),
                  ),
                  Container(
                    // width: MediaQuery.of(context).size.width,
                    width: MediaQuery.of(context).size.width / 2.4,
                    height: 140,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 43, 42, 40)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        Icon(
                          Icons.female,
                          size: 100,
                          color: Colors.white,
                        ),
                        Text(
                          "FEMALE",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 211, 204, 204)),
                        )
                      ]),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(21),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 140,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 43, 42, 40)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "HEIGHT",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 173, 170, 170)),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "177",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 211, 204, 204),
                                    fontSize: 50),
                              ),
                              Text(
                                "cm",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 211, 204, 204)),
                              )
                            ]),
                        Slider(
                            activeColor: Color.fromARGB(255, 255, 0, 157),
                            // inactiveColor: Color.fromARGB(255, 255, 0, 157),
                            // secondaryActiveColor: Color.fromARGB(255, 255, 0, 157),
                            thumbColor: Color.fromARGB(255, 255, 0, 157),
                            value: this.slider_val,
                            onChanged: (double value) {
                              setState(() {
                                this.slider_val = value;
                                // print(value);
                              });
                            })
                      ]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    // width: MediaQuery.of(context).size.width,
                    width: MediaQuery.of(context).size.width / 2.4,
                    height: 140,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 56, 55, 53)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Column(children: [
                        Text(
                          "MALE",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 211, 204, 204)),
                        ),
                        Text(
                          "177",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 211, 204, 204),
                              fontSize: 50),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor:
                                    Color.fromARGB(255, 173, 170, 165),
                                child: Icon(
                                  Icons.plus_one,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                              CircleAvatar(
                                radius: 25,
                                backgroundColor:
                                    Color.fromARGB(255, 173, 170, 165),
                                child: Icon(
                                  Icons.plus_one,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ])
                      ]),
                    ),
                  ),
                  Container(
                    // width: MediaQuery.of(context).size.width,
                    width: MediaQuery.of(context).size.width / 2.4,
                    height: 140,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 43, 42, 40)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        Icon(
                          Icons.female,
                          size: 100,
                          color: Colors.white,
                        ),
                        Text(
                          "FEMALE",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 211, 204, 204)),
                        )
                      ]),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
