import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' ;
import 'package:personal_portfolio_app/provider/theme_provider.dart' ;


class Header extends ConsumerStatefulWidget {
  const Header({super.key});

  @override
  ConsumerState<Header> createState() => _HeaderState();
}

class _HeaderState extends ConsumerState<Header> {
  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeProvider) ;
    final isDarkMode  = themeMode == ThemeMode.dark ;
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
              Padding(
                padding: const EdgeInsets.only(top: 65 , right: 2),
                child: GestureDetector(
                  onTap: () {
                  ref.read(themeProvider.notifier).toggleThme();
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? Colors.white
                          : Colors.black,
                      shape: BoxShape.circle,
                      // border: Border.all(
                      //   color: isDarkMode ? Colors.amber : Colors.blueAccent,
                      //   width: 1,
                      // ),
                    ),
                    child: Icon(
                      isDarkMode
                          ? FontAwesomeIcons.solidSun 
                          : FontAwesomeIcons.solidMoon, 
                      color: isDarkMode ? Colors.black : Colors.white,
                      size: 18,
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
