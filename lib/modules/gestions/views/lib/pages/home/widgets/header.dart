import 'package:flutter/material.dart';
import 'package:projet_mars_nan/modules/gestions/views/lib/models/game.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  // const HeaderSection(Game game, {super.key});

  //  HeaderSection(Game? game, {super.key});
  // const HeaderSection(Game? game, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 25,
        right: 25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Welcome,",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "What would you like to play?",
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          CircleAvatar(
            child: Image.asset(
              'assets/images/avatar.png',
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}