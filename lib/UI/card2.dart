import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../myAPI/MyApi.dart';

class Card2 extends StatelessWidget{
  final myApi = MyAPI();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: myApi.getTasks(),
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return const Center(child: CircularProgressIndicator(),);
        }
          if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()),);
        }
          if(snapshot.data != null){
            return ListView.builder(
              itemCount: snapshot.data?.length??0,
              itemBuilder: (context, index) => Card(
              elevation: 4,
              margin: const EdgeInsets.all(6),
              child: ListTile(
              leading: CircleAvatar(child: Text(snapshot.data?[index].id.toString()??""),),
              title: Text(snapshot.data?[index].title??""),
              subtitle: Text(snapshot.data?[index].tags.join(" ")??""),
              ),
            ));
        }
          return Container();

        });
  }


}