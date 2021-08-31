import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/homePic.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text.rich(
                  TextSpan(
                      text: 'Fit',
                      style: TextStyle(fontSize: 80),
                      children: [
                        TextSpan(
                          text: 'Fix',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 80),
                        ),
                      ]),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.email),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.email),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.email),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
