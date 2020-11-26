

import 'package:flutter/material.dart';
import 'package:page_view/NewNote.dart';
import 'Database.dart';
import 'package:tabbar/tabbar.dart';

import 'Notes.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  final myPageController = PageController();

  // var listToDo = ['Comer papas con queso', 'Dar de comer a los perros', 'Corretear gallinas'];
  //   // var listToDont = ['Acariciar al gato', 'Hacer chilaquiles'];
  //   // var listDone = ['Lavar el carro', 'Quedarme en casa'];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          bottom: PreferredSize(  

            preferredSize: Size.fromHeight(50),
            child: TabbarHeader(

              controller: myPageController,
              tabs: [
                Tab(text: "Por Hacer",),
                Tab(text: "No hacer"),
                Tab(text: "Ya hechas", ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async {
            final result = await Navigator.push(
              context,
              // Create the SelectionScreen in the next step.
              MaterialPageRoute(builder: (context) => NewNote()),
            );
            print(myPageController.page.round());
            print(result);
            DBProvider.db.newNoteByPage(Note(note: result, page: myPageController.page.round()));
            setState(() { });

            },
        ),
        body: TabbarContent(
          controller: myPageController,
          children: [

            FutureBuilder<List<Note>>(
                future: DBProvider.db.getNoteByPage(0),
                builder: (BuildContext context, AsyncSnapshot<List<Note>> snapshot){
                  if(snapshot.hasData){
                    if(snapshot.data.length == 0){
                      return Text('No hay notas');
                    }
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        Note note = snapshot.data[index];
                        return Card(
                          color: Colors.blue,
                          child: InkWell(
                            onTap: (){
                              DBProvider.db.deleteNote(note.id);
                              setState(() {

                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 150,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15, top: 25),
                                child: Text('${note.note}',
                                  style: TextStyle(color: Colors.white),),
                              ),
                            ),

                          ),
                        );
                      },
                    );
                  }

                  else {
                    return Center(child: CircularProgressIndicator());
                  }
                }
            ),
            FutureBuilder<List<Note>>(
                future: DBProvider.db.getNoteByPage(1),
                builder: (BuildContext context, AsyncSnapshot<List<Note>> snapshot){
                  if(snapshot.hasData){
                    if(snapshot.data.length == 0){
                      return Text('No hay notas');
                    }
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        Note note = snapshot.data[index];
                        return Card(
                          color: Colors.teal,
                          child: InkWell(
                            onTap: (){
                              DBProvider.db.deleteNote(note.id);
                              setState(() {

                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 150,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15, top: 25),
                                child: Text('${note.note}',
                                  style: TextStyle(color: Colors.white),),
                              ),
                            ),

                          ),
                        );
                      },
                    );
                  }

                  else {
                    return Center(child: CircularProgressIndicator());
                  }
                }
            ),
            FutureBuilder<List<Note>>(
                future: DBProvider.db.getNoteByPage(2),
                builder: (BuildContext context, AsyncSnapshot<List<Note>> snapshot){
                  if(snapshot.hasData){
                    if(snapshot.data.length == 0){
                      return Text('No hay notas');
                    }
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        Note note = snapshot.data[index];
                        return Card(
                          color: Colors.black45,
                          child: InkWell(
                            onTap: (){
                              DBProvider.db.deleteNote(note.id);
                              setState(() {

                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 150,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15, top: 25),
                                child: Text('${note.note}',
                                  style: TextStyle(color: Colors.white),),
                              ),
                            ),

                          ),
                        );
                      },
                    );
                  }

                  else {
                    return Center(child: CircularProgressIndicator());
                  }
                }
            ),

          ],
        )
    );
  }
}
