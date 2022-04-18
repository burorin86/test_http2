import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model.dart';


Future<List<Album>> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  // var res = await http.get(url);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final list = List.from(jsonDecode(response.body));
    return list.map((body)=>Album.fromJson(body)).toList();
    // print("Data Fetch!");
    // Album template = Album.fromJson(json.decode(utf8.decode(res.bodyBytes)));
    // return template;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}