import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Welcome to Flutter',
			home: Search()
		);
	}
}

class Search extends StatefulWidget {
	@override
	_SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
	TextEditingController _textController = TextEditingController();
	List<String> initialList = ["chien", "chat", "dromadaire"];
	List<String> filteredList = List();
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(title: Text("Search")),
			body: Column(
				children: <Widget>[
					Padding (
						padding: const EdgeInsets.only(left: 10.0, right: 10.0),
						child: TextField(
							controller: _textController,
							onChanged: (text) {
								text = text.toLowerCase();
								setState(() {
									filteredList = initialList
										.where((element) => element.toLowerCase().contains(text))
										.toList();
								});
							},
						),
					),
					if (filteredList.length == 0)
						Expanded(
							child: Container(
								child: Text("No Result Found")
							)
						)
					else
						Expanded(
							child: ListView.builder(
								itemCount: filteredList.length,
								itemBuilder: (BuildContext context, index) {
									return Container(
										margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
										child: Text(filteredList[index])
									);
								}
							)
						)
				],
			),
		);
	}
}