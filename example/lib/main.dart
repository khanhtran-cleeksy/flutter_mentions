import 'package:flutter/material.dart';
import 'package:flutter_mentions/flutter_mentions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (_, child) => Portal(child: child!),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FlutterMentionsState> key = GlobalKey<FlutterMentionsState>();
  SuggestionState state = SuggestionState.None;
  String? c = '';
  String? markupText = '';
  bool dataMentionTempTurnOn = true;
  List<Map<String, dynamic>> dataMentionsTemp = [
    {
      'id': '61as61fsa',
      'display': 'Long T1',
      'full_name': 'Fayeed Pawaskar',
      'photo':
          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
    },
  ];
  List<Map<String, dynamic>> dataMentions = [
    {
      'id': '61as61fsa',
      'display': 'Long T1',
      'full_name': 'Fayeed Pawaskar',
      'photo':
          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
    },
    {
      'id': '61asasgasgsag6a',
      'display': 'Khải T2',
      'full_name': 'khaled',
      'style': TextStyle(color: Colors.purple),
      'photo':
          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
    },
    {
      'id': 'asfgasga41',
      'display': 'Sang T3',
      'full_name': 'Mark Twain',
      'photo':
          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
    },
    {
      'id': 'asfsaf451a',
      'display': 'Nguyệt T4',
      'full_name': 'Jhon Legend',
      'photo':
          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          TextButton(
            child: Text('Data Mention Temp status: $dataMentionTempTurnOn'),
            onPressed: () {
              setState(() {
                dataMentionTempTurnOn = !dataMentionTempTurnOn;
              });
            },
          ),
          TextButton(
            child: Text('Remove Data Mention: ${dataMentions.length}'),
            onPressed: () {
              setState(() {
                dataMentions = [];
              });
            },
          ),
          Container(
            height: 100,
          ),
          Container(
            child: FlutterMentions(
              mentionsTemp: dataMentionTempTurnOn
                  ? [
                      Mention(
                        trigger: '@',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                        data: dataMentionsTemp,
                        matchAll: false,
                      ),
                    ]
                  : [],
              key: key,
              suggestionPosition: SuggestionPosition.Top,
              maxLines: 5,
              minLines: 1,
              decoration: InputDecoration(hintText: 'Hello world'),
              suggestionState: (_) {
                state = _;
              },
              onSearchChanged: (trigger, value) async {
                return await dataMentions;
              },
              mentions: [
                Mention(
                    trigger: '@',
                    style: TextStyle(
                      color: Colors.amber,
                    ),
                    data: dataMentions,
                    matchAll: false,
                    suggestionBuilder: (data) {
                      return Container(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                data['photo'],
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Column(
                              children: <Widget>[
                                Text(data['full_name']),
                                Text('@${data['display']}'),
                              ],
                            )
                          ],
                        ),
                      );
                    }),
                Mention(
                  trigger: '#',
                  disableMarkup: true,
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                  data: [
                    {'id': 'reactjs', 'display': 'reactjs'},
                    {'id': 'javascript', 'display': 'javascript'},
                  ],
                  matchAll: true,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
