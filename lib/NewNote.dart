import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewNote extends StatelessWidget {

  var note = '';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Nueva nota'),
      ),
      body: Center(
        child: Column(

          children: [
            TextField(
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Nota'),
              onChanged: (value) => note = value,
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.pop(context, note);
                },
                child: Text('Crear nota')
            )
          ],
        ),
      ),
    );
  }
}
