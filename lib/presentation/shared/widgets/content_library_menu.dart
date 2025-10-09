import 'package:flutter/material.dart';

class ContentLibrabryMenu extends StatelessWidget {
  final VoidCallback allContent;
  final VoidCallback movieContent;
  final VoidCallback musicContent;
  final VoidCallback dialogueContent;
  const ContentLibrabryMenu({
    required this.allContent,
    required this.movieContent,
    required this.musicContent,
    required this.dialogueContent,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Row(
        children: [
          SizedBox(
            height: 25,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Color(0xFF030211),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: allContent, 
              child: Text(
                "All Content",
                style: TextStyle(
                  fontSize: 11,
                ),
              )
            ),
          ),
          SizedBox(width: 10),
          SizedBox(
            height: 25,
            child: OutlinedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Color(0xFF030211),
                side: BorderSide(color: Color.fromARGB(255, 226, 226, 226)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: movieContent, 
              child: Text(
                "Movies",
                style: TextStyle(
                  fontSize: 11,
                ),
              )
            ),
          ),
          SizedBox(width: 10),
          SizedBox(
            height: 25,
            child: OutlinedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Color(0xFF030211),
                side: BorderSide(color: Color.fromARGB(255, 226, 226, 226)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: musicContent, 
              child: Text(
                "Music",
                style: TextStyle(
                  fontSize: 11,
                ),
              )
            ),
          ),
          SizedBox(width: 10),
          SizedBox(
            height: 25,
            child: OutlinedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Color(0xFF030211),
                side: BorderSide(color: Color.fromARGB(255, 226, 226, 226)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: dialogueContent, 
              child: Text(
                "Dialogue",
                style: TextStyle(
                  fontSize: 11,
                ),
              )
            ),
          ),
        ],
      )
    );
  }
}