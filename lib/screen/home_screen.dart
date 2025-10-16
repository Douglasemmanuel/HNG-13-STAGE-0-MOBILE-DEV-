import 'package:flutter/material.dart';
import 'package:personal_portfolio_app/widget/header.dart';
import 'package:personal_portfolio_app/widget/contact.dart' ;
import 'package:personal_portfolio_app/widget/skills.dart' ;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Portfolio'),
        // centerTitle: true,
        
      ),
      body: SingleChildScrollView( 
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const[
             Header(),

            SizedBox(height: 15), 

            Skills(),

            SizedBox(height: 15),

            Contact(),
          ],
        ),
      ),
    );
  }
}