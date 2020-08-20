import 'package:flutter/material.dart';

class Dashbaord extends StatefulWidget {
  @override
  _DashbaordState createState() => _DashbaordState();
}

class _DashbaordState extends State<Dashbaord> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  //Code for dialogues

  Future<String> createAlertDialog(BuildContext context) {
    final maxLines = 5;
    final _formkey = GlobalKey <FormState>();
    TextEditingController wordsController = new TextEditingController();
    TextEditingController authorController = new TextEditingController();

    return showDialog(
        context: context,
    builder: (context){
      return AlertDialog(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))
      ),
        title: Text("Add Quote"),
        content: Container(
          height: MediaQuery.of(context).size.height * 0.3,
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget> [
                Container(
                  height: maxLines.toDouble() * 30,
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty){
                        return 'This field cannot be left blank';
                      }
                      return null;
                    },
                    maxLines: maxLines,
                    controller: authorController,
                    decoration: InputDecoration(
                      hintText: "Write your Law Quote",
                      fillColor: Theme.of(context).primaryColorLight,
                      filled: true),
                    ),
                  ),
                TextFormField(
                  validator: (value){
                    if (value.isEmpty){
      return 'This field cannot be left blank';
      }
                    return null;
                    },
      controller: wordsController,
      decoration: InputDecoration(
        hintText: 'Author',
        fillColor: Theme.of(context).primaryColorLight,
        filled: true),
      ),
                ),
                 ],
            ),
          ),
        ),
      actions: <Widget> [
        MaterialButton(
      elevation: 5.0,
        child: Text('submit'),
      onPressed: () {
    if(_formkey.currentState.validate()) {
    Navigator.of(context).pop();
      }
      },
      ),
      MaterialButton(
      elevation: 5.0,
      child: Text('Cancel'),
      onPressed: () {
        Navigator.of(context).pop();
      },
      ),
      ],
      ),
    }),
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'No Posts yet',
                style: TextStyle(
                    fontSize: 30, color: Theme.of(context).primaryColor),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              Image.asset('images/no_content.png')
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text(
          "Create Post",
          style: TextStyle(fontSize: 20),
        ),
        icon: Icon(
          Icons.add,
          size: 24,
        ),
      ),
    );
  }
}
