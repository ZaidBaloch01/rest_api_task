import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; 

class RestApiTask extends StatefulWidget {
  const RestApiTask({super.key});

  @override
  State<RestApiTask> createState() => _RestApiTaskState();
}

class _RestApiTaskState extends State<RestApiTask> {
  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rest API Task"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      
      body: FutureBuilder<List<dynamic>>(
        future: fetchData(), 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var data = snapshot.data![index]; 
                return Container(
                  height: 220,
                  color: const Color.fromARGB(255, 196, 205, 209),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  margin: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('User Id: ${data['userId']}', style: TextStyle(fontSize: 18)),
                      Text('Id: ${data['id']}', style: TextStyle(fontSize: 18)),
                      Text('Title: ${data['title']}', style: TextStyle(fontSize: 18)),
                      Text('Body: ${data['body']}', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
