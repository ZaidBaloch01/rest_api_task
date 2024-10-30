import 'package:flutter/material.dart';

class restApiTask extends StatefulWidget {
  const restApiTask({super.key});

  @override
  State<restApiTask> createState() => _restApiTaskState();
}

class _restApiTaskState extends State<restApiTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rest Api Task"), centerTitle: true, backgroundColor: Colors.blueAccent,),

      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Container(
            height: 150,
            color: const Color.fromARGB(255, 196, 205, 209),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            margin: EdgeInsets.all(10),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('User Id: data', 
                style: TextStyle(fontSize: 18),
                ),
                Text('Id: data', 
                style: TextStyle(fontSize: 18),
                ),
                Text('Title: data', 
                style: TextStyle(fontSize: 18),
                ),
                Text('Body: data', 
                style: TextStyle(fontSize: 18),
                ),
              ],
            ),

          );
        }
      ),

    );
  }
}