import 'package:flutter/material.dart';

class ReOrderListview extends StatefulWidget {
  const ReOrderListview({Key? key}) : super(key: key);

  @override
  State<ReOrderListview> createState() => _ReOrderListviewState();
}

class _ReOrderListviewState extends State<ReOrderListview> {
  List<String> productsName = ['Apple', 'Banana', 'Pineapple', 'Dates', 'Orange', 'Grapes'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: const Text('Widget of the Week',style: TextStyle(color: Colors.white)),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 5,top: 10),
                child: Text('ReorderableList',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700)),
              ),
              const SizedBox(height: 20,),
              ReorderableListView.builder(
                shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Card(
                       color: Colors.grey,
                      key: ValueKey(productsName[index]),
                      child: ListTile(
                      title: Text(productsName[index],style: const TextStyle(color: Colors.white)),
                    ),);
                  }, itemCount: productsName.length, onReorder: (oldIndex, newIndex){

                    if(oldIndex < newIndex){
                      newIndex = newIndex - 1;
                    }
                    final element = productsName.removeAt(oldIndex);
                    productsName.insert(newIndex, element);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
