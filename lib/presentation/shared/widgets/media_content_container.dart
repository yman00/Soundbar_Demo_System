
import 'package:flutter/material.dart';

class MediaContentContainer extends StatelessWidget {
      final String mediaTitle;
      final String mediaDesc;
      final String mediaDuration;
      final IconData mediaIcons;
      final VoidCallback onPressed;
      final IconData buttonIcons;
      final String buttonText;
      final Color bgcolor;
      final Color fgcolor;
      final String chipTitle;
      final IconData chipIcon;
      final Color chipBgColor;
      final Color chipFgColor;

  const MediaContentContainer({
    required this.mediaTitle,
    required this.mediaDesc,
    required this.mediaDuration,
    required this.mediaIcons,
    required this.onPressed,
    required this.buttonIcons,
    required this.buttonText,
    required this.bgcolor,
    required this.fgcolor,
    required this.chipTitle,
    required this.chipIcon,
    required this.chipBgColor,
    required this.chipFgColor,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFFDDDDDD), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.01),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
      padding: EdgeInsets.symmetric(horizontal: 13.0, vertical: 10.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 226, 226, 226),
              borderRadius: BorderRadius.circular(5)
            ),
            padding: EdgeInsets.all(12.0),
            child: Icon(mediaIcons),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    mediaTitle,
                    style: TextStyle(fontSize: 13),
                  ),
                  SizedBox(width: 15),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.0),
                      color: chipBgColor
                      // color: Color.fromARGB(219, 244, 203, 147)
                    ),
                    child: Row(
                      children: [
                        Icon(
                          chipIcon,
                          size: 11,
                          color: chipFgColor,
                          // color: Color.fromARGB(219, 175, 104, 6),
                        ),
                        SizedBox(width: 3),
                        Text(
                          chipTitle,
                          // 'Chip',
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w600,
                            color: chipFgColor
                            // color: Color.fromARGB(219, 175, 104, 6)
                            ),
                        ),
                      ],
                    )
                  )
                ],
              ),
              Spacer(),
              Text(
                mediaDesc,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Icon(
                    Icons.access_time_rounded,
                    size: 11,
                    color: Colors.grey,
                    ),
                  SizedBox(width: 3),
                  Text(
                    mediaDuration,
                    style: TextStyle(
                      fontSize: 9,
                      color: Colors.grey
                    ),
                  ),
                ],
              )
            ],
          ),
          Spacer(),
          SizedBox(
            width: 70,
            height: 30,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: bgcolor,
                foregroundColor: fgcolor,
                padding: EdgeInsets.symmetric(horizontal: 10,),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                
              ),
              child: Row(
                children: [
                  Icon(buttonIcons),
                  Text(
                    buttonText,
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ],
              )
            ),
          )
        ],
      )
    );
  }
}

