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
    return Container(
      height: 55,
      margin: const EdgeInsets.fromLTRB(30, 10, 30,10),
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: Theme.of(context).hoverColor,
        onPressed: press,
        child: Row(
          children: <Widget>[
            SizedBox(width:10),
            icon,
            SizedBox(width: 15),
            Text(text,style: Theme.of(context).textTheme.bodyText1,),
            Spacer(),
            if (this.hasNavigation)
              Icon(
                Icons.keyboard_arrow_right,
              ),
          ],
        ),
      ),
    );
  }
}