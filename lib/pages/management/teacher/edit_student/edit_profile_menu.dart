import 'package:flutter/material.dart';

class EditProfileMenu extends StatelessWidget {

  final String? text;
  final String? title;
  final double? height;
  final VoidCallback? press;
  final bool? isDarkMode;

  const EditProfileMenu({
    Key? key, 
    this.text, 
    this.title,
    this.press, 
    this.height,
    this.isDarkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        InkWell(
          onTap: press,
          child: Container(
            color: isDarkMode == false ?Colors.white : Colors.grey[900],
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            height: height!,
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(15, 0, 5, 0),
                    child: Text(title!,
                      style: const TextStyle(
                        fontSize: 18
                      ),),
                  )
                ),
                Expanded(
                  flex: 3,
                  child: Text(text!,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontSize: 18
                      ),),
                ),
                const Expanded(
                  flex: 1,
                  child: Icon(Icons.arrow_forward_ios,size: 20,)
                ),
              ],
            ),
          ),
        ),
        Divider(
          height: 1,
          color: Colors.grey[100],
        ),
      ],
    );
  }
}