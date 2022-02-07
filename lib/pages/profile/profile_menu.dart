import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {

  final String text;
  final Icon icon;
  final bool hasNavigation;
  final VoidCallback press;

  const ProfileMenu({
    Key? key, 
    required this.text, 
    required this.icon, 
    required this.press, 
    this.hasNavigation=true, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight/17,
      margin: const EdgeInsets.fromLTRB(30, 10, 30,10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: Colors.grey[200],
        onPressed: press,
        child: 
        ListTile(
          leading: icon,
          title:Text(text,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),),
          trailing: hasNavigation == true 
          ? Icon(Icons.keyboard_arrow_right,color: Colors.black)
          : null,
        ),
        // Row(
        //   children: <Widget>[
        //     SizedBox(width:10),
        //     icon,
        //     SizedBox(width: 15),
        //     Text(text,
        //       style: TextStyle(
        //         fontSize: 18,
        //       ),),
        //     Spacer(),
        //     if (this.hasNavigation)
        //       Icon(
        //         Icons.keyboard_arrow_right,
        //       ),
        //   ],
        // ),
      ),
    );
  }
}