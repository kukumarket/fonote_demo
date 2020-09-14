import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
  // ignore: todo
		// TODO: implement build
		return new Scaffold(
			appBar: new AppBar(
				title: new Text("二级页面-01"),
			),
			body: new Center(
				child: new RaisedButton(
					onPressed: () {
						Navigator.pop(context);
						},
					child: new Text("返回页面"),
				),	
			),
		);
	}
}