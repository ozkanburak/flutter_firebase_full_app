import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_full_app/product/models/news.dart';
import 'package:flutter_firebase_full_app/product/utility/exception/custom_exceptions.dart';
class HomeView extends StatefulWidget{
  @override
  const HomeView({Key? key}) : super(key: key);
  State<HomeView> createState() => _HomeViewState();
}
class _HomeViewState extends State<HomeView>{

  @override
  Widget build(BuildContext context){
    CollectionReference news = FirebaseFirestore.instance.collection('news');
    final response = news.withConverter(fromFirestore: (snapshot, options) {
      return News().fromFirestore(snapshot);
    }, 
    toFirestore: (value, options) {
      if(value == null) throw FirebaseCustomExcepiton('$value not null');
      return value.toJson();

      },
    ).get();

    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: response,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<News?>> snapshot) {
          switch(snapshot.connectionState){
            
            case ConnectionState.none:
            return const Placeholder();
            case ConnectionState.waiting:
            case ConnectionState.active:
            return LinearProgressIndicator();
            case ConnectionState.done:
              // TODO: Handle this case.
              if(snapshot.hasData){
                final values = snapshot.data!.docs.map((e) => e.data()).toList();
                return ListView.builder(
                  itemCount: values.length,
                  itemBuilder: (BuildContext context, int index){
                    return Card(
                      child: Column(
                        children: [
                          Image.network(values[index]?.backgroundImage ?? '',
                          height: context.dynamicHeight(.1),
                          ),
                          Text(
                            values[index]?.title ?? '', 
                            style: context.textTheme.labelLarge ,)
                        ],
                      ),
                    );
                  }
                  );
                  

              }
              else{
                return const SizedBox();
              }
          }

        },
    ));
  }
}
