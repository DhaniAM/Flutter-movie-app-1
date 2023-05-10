import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  static const ROUTE_NAME = '/about';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: screenWidth / 2),
            const Text(
              'Movie Pro',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Created using Flutter',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(
                  'Copyright  ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Icon(
                  Icons.copyright,
                  size: 20,
                ),
                Text(
                  '2023 by ',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Ramadhani Adjar Mustaqim',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   body: Stack(
    //     children: [
    //       Column(
    //         children: [
    //           Expanded(
    //             flex: 5,
    //             child: Container(
    //               color: kPrussianBlue,
    //               child: Center(
    //                 child: FlutterLogo(
    //                   size: 200,
    //                 ),
    //               ),
    //             ),
    //           ),
    //           Expanded(
    //             flex: 1,
    //             child: Center(
    //               child: Text(
    //                 'Created using Flutter',
    //                 style: kHeading6,
    //               ),
    //             ),
    //           ),
    //           Expanded(
    //             child: Center(
    //               child: Text(
    //                 'Created by Ramadhani Adjar Mustaqim',
    //                 style: kSubtitle,
    //               ),
    //             ),
    //           ),
    //           Expanded(
    //             flex: 1,
    //             child: Center(
    //               child: Text(
    //                 'with help from Dicoding course',
    //                 style: kSubtitle,
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //       SafeArea(
    //         child: IconButton(
    //           onPressed: () => Navigator.pop(context),
    //           icon: Icon(Icons.arrow_back),
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}
