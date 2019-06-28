import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'data/post.dart';
import 'data/repo.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Service"),
      ),
      body: ReposPage(),
    );
  }
}

class ReposPage extends StatefulWidget {
  @override
  _ReposPageState createState() => _ReposPageState();
}

class _ReposPageState extends State<ReposPage> {
  TextEditingController _reposController = TextEditingController();
  bool _formValid = true;

  void validateForm() {
    setState(() {
      _formValid = _reposController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(18.0),
        child: Column(
          children: <Widget>[
            Icon(
              Icons.person_outline,
              size: 100,
              color: Colors.blue,
            ),
            Text('repo name'),
            TextField(
              controller: _reposController,
              keyboardType: TextInputType.text,
              onEditingComplete: validateForm,
              onChanged: (text) {
                validateForm();
              },
              decoration: InputDecoration(
                  labelText: "repo",
                  labelStyle: TextStyle(color: Colors.blue),
                  errorText: _formValid ? null : "invalid value"),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blue),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: RaisedButton(
                child: Text("search"),
                color: Colors.blue,
                textColor: Colors.white,
//                onPressed: () => callService(),
              ),
            ),
            FutureBuilder<List<Repo>>(
              future: fetchRepos(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column( children: snapshot.data.map( (repo) => Text(repo.name)).toList());
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // By default, show a loading spinner.
                return CircularProgressIndicator();
              },
            )
          ],
        ));
  }
}

Future<List<Repo>> fetchRepos() async {
  final response =
      await http.get("https://api.github.com/users/soulnanx/repos");
  if (response.statusCode == 200) {
    List json = convert.json.decode(response.body);

    var list = json.map((item) => Repo.fromJson(item)).toList();

    list.map((repo) => debugPrint(repo.toString()));
    return list;
//      debugPrint(list.toString());
  } else {
    throw Exception('Failed to load Repos');
  }

  return null;
}

Future<Post> fetchPost() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/posts/1');

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON.
    return Post.fromJson(convert.json.decode(response.body));
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}
