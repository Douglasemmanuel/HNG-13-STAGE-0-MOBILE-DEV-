import 'package:flutter/material.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});
  @override
  Widget build(BuildContext context) {
    final List<String> skillsSet =[
      'Flutter',
      'Dart',
      'Firebase',
      'REST APIs',
      'Git & GitHub',
    ];
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Skills',
            style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 15),
          Wrap(
            spacing: 12,
            runSpacing: 16,
            children: skillsSet.map((skill){
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(10),
                  // border: Border.all(color: Colors.blueAccent, width: 1.5),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.blue.withOpacity(0.1),
                  //     blurRadius: 4,
                  //     offset: const Offset(2, 2),
                  //   ),
                  // ],
                ),
                child: Text(
                  skill,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.blueAccent,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}