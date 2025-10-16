import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                  radius: 70, 
                  backgroundImage: AssetImage('assets/images/Douglas.jpeg'),
              ),
              // SizedBox(width:0.4),
              Padding(
                padding: const EdgeInsets.only(top: 65 , right: 2),
                child: GestureDetector(
                  onTap: () {
                    print('Theme toggle pressed!');
                  },
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      // color: isDarkMode
                      //     ? Colors.yellow.withOpacity(0.2)
                      //     : Colors.blue.withOpacity(0.15),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color:  Colors.white,
                        // color: isDarkMode ? Colors.amber : Colors.blueAccent,
                        width: 1.5,
                      ),
                    ),
                    child: Icon(
                      FontAwesomeIcons.solidSun,
                      // isDarkMode
                      //     ? FontAwesomeIcons.solidSun 
                      //     : FontAwesomeIcons.solidMoon, 
                      // color: isDarkMode ? Colors.amber : Colors.blueAccent,
                        color: Colors.white ,
                      size: 22,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15,),
          Text(
            'Douglas Emmanuel',
            style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold
            ),
          ),
           SizedBox(height: 10),
           Text(
            'Flutter Developer | Tech Enthusiast ',
            style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w700
            ),
          ),
          SizedBox(height: 15),
          Divider(
        color: Colors.grey,      
        thickness: 1,            
        indent: 20,              
        endIndent: 20,           
      ),
        SizedBox(height: 20),
        _buildAbout(context),
        ],
      ),
    );
  }
}


  Widget _buildAbout(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0), 
    child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min, 
        children: const [
          Text(
            'About Me',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'I am a passionate Flutter developer with a love for creating beautiful and functional mobile apps.',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}
