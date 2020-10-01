import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class DashboardView extends StatelessWidget {
//   final TextStyle whiteText = const TextStyle(color: Colors.white);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade800,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: Text("Dashboard"),
//         centerTitle: true,
//       ),
//       body: _buildBody(context),
//     );
//   }

//   Widget _buildBody(BuildContext context) {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         children: <Widget>[
//           _buildHeader(),
//           const SizedBox(height: 50.0),
//           Row(
//             children: <Widget>[
//               Expanded(
//                 child: Column(
//                   children: <Widget>[
//                     Container(
//                       height: 190,
//                       color: Colors.blue,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           ListTile(
//                             title: Text(
//                               "9,850",
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .headline4
//                                   .copyWith(
//                                     color: Colors.white,
//                                     fontSize: 24.0,
//                                   ),
//                             ),
//                             trailing: Icon(
//                               FontAwesomeIcons.walking,
//                               color: Colors.white,
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 16.0),
//                             child: Text(
//                               'Steps',
//                               style: whiteText,
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 10.0),
//                     Container(
//                       height: 120,
//                       color: Colors.green,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           ListTile(
//                             title: Text(
//                               "70 bpm",
//                               style:
//                                   Theme.of(context).textTheme.display1.copyWith(
//                                         color: Colors.white,
//                                         fontSize: 24.0,
//                                       ),
//                             ),
//                             trailing: Icon(
//                               FontAwesomeIcons.heartbeat,
//                               color: Colors.white,
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 16.0),
//                             child: Text(
//                               'Avg. Heart Rate',
//                               style: whiteText,
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(width: 10.0),
//               Expanded(
//                 child: Column(
//                   children: <Widget>[
//                     Container(
//                       height: 120,
//                       color: Colors.red,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           ListTile(
//                             title: Text(
//                               "2,430",
//                               style:
//                                   Theme.of(context).textTheme.display1.copyWith(
//                                         color: Colors.white,
//                                         fontSize: 24.0,
//                                       ),
//                             ),
//                             trailing: Icon(
//                               FontAwesomeIcons.fire,
//                               color: Colors.white,
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 16.0),
//                             child: Text(
//                               'Calories Burned',
//                               style: whiteText,
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 10.0),
//                     Container(
//                       height: 190,
//                       color: Colors.yellow,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           ListTile(
//                             title: Text(
//                               "15 kms",
//                               style:
//                                   Theme.of(context).textTheme.display1.copyWith(
//                                         fontSize: 24.0,
//                                         color: Colors.black,
//                                       ),
//                             ),
//                             trailing: Icon(
//                               FontAwesomeIcons.road,
//                               color: Colors.black,
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 16.0),
//                             child: Text(
//                               'Distance',
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   Widget _buildHeader() {
//     return Row(
//       children: <Widget>[
//         Container(
//           height: 100,
//           width: 100,
//           padding: const EdgeInsets.all(8.0),
//           child: CircularProgressIndicator(
//             value: 0.5,
//             valueColor: const AlwaysStoppedAnimation(Colors.blue),
//             backgroundColor: Colors.grey.shade700,
//           ),
//         ),
//         const SizedBox(width: 20.0),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text(
//                 "Overall\nDaily Progress",
//                 style: whiteText.copyWith(fontSize: 20.0),
//               ),
//               const SizedBox(height: 20.0),
//               Text(
//                 "45% to go",
//                 style: TextStyle(color: Colors.grey, fontSize: 16.0),
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 10,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 40,
              height: 40,
              margin: EdgeInsets.only(right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: const Icon(Icons.person),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Walktron',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'rookie',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {},
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Container(
                  width: 50,
                  child: Icon(
                    Icons.notifications,
                    color: Theme.of(context).accentColor,
                    size: 35,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  width: 20,
                  height: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.red,
                    ),
                    width: 20,
                    height: 20,
                    child: Center(
                      child: Text(
                        '03',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                  width: 70,
                  height: 70,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Theme.of(context).primaryColor.withAlpha(50),
                  ),
                  child: const Icon(FontAwesomeIcons.shoePrints)),
              Padding(
                padding: EdgeInsets.only(top: 30),
              ),
              Text(
                '6522',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 80,
                  fontFamily: 'Bebas',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '0 Steps'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          '9000 Steps'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    // LinearPercentIndicator(
                    //   lineHeight: 8.0,
                    //   percent: 0.7,
                    //   linearStrokeCap: LinearStrokeCap.roundAll,
                    //   backgroundColor:
                    //       Theme.of(context).accentColor.withAlpha(30),
                    //   progressColor: Theme.of(context).primaryColor,
                    // ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: LinearProgressIndicator(
                        minHeight: 10,
                        valueColor: AlwaysStoppedAnimation(
                          Color(0xffff3a5a),
                        ),
                        value: 0.7,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                    ),
                    // Text(
                    //   'Steps Taken'.toUpperCase(),
                    //   style: TextStyle(
                    //     color: Theme.of(context).accentColor,
                    //     fontFamily: 'Bebas',
                    //     fontSize: 24,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    Text(
                      'You walked 165 min today',
                      style: TextStyle(
                        // color: Theme.of(context).accentColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 25,
                color: Colors.grey[300],
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'DISTANCE',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '8500',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Theme.of(context).accentColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: ' m',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'CALORIES',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '259',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Theme.of(context).accentColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: ' cal',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'HEART RATE',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '102',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Theme.of(context).accentColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: ' bpm',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                height: 25,
                color: Colors.grey[300],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
