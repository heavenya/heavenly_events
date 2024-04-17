import 'package:flutter/material.dart';


class TstScreen extends StatefulWidget {
  const TstScreen({super.key});

  @override
  State<TstScreen> createState() => _TstScreenState();
}

class _TstScreenState extends State<TstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:         ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
               "Text",
                  style: const TextStyle(
                    fontSize: 16, // Replace with your font size
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Replace with your color
                  ),
                ),
                // SizedBox(
                //   height: 20,
                //   child: Checkbox(
                //     activeColor: Colors.blue,
                //     // Replace with your color
                //     value: selectedIndex == index
                //         ? true
                //         : false,
                //     onChanged: (val) {
                //     "";
                //       print('val---====${val}');
                //     },
                //   ),
                // )
              ],
            ),
          );
        },
      ),
    );
  }
}
