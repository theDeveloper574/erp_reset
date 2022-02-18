// import 'package:flutter/material.dart';
// import 'package:makeupshop/Models/localdataBaseModel.dart';
// import 'package:makeupshop/widget/ListViewContainer.dart';

// class NoteList extends StatefulWidget {
//   const NoteList({Key key}) : super(key: key);

//   @override
//   _NoteListState createState() => _NoteListState();
// }

// class _NoteListState extends State<NoteList> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: FutureBuilder<List<Grocery>>(
//           future: DatabaseHelper.instance.getGroceries(),
//           builder:
//               (BuildContext context, AsyncSnapshot<List<Grocery>> snapshot) {
//             if (!snapshot.hasData) {
//               return Center(child: Text('Loading...'));
//             }
//             return snapshot.data.isEmpty
//                 ? Center(child: Text('No Groceries in List.'))
//                 : ListView(
//                     children: snapshot.data.map((grocery) {
//                       return Center(
//                         child: Card(
//                           child: ListTile(
//                             title: Text(grocery.title),
//                             onTap: () {
//                               setState(() {
//                                 print(grocery.id);
//                                 print(grocery.title);
//                                 // if (selectedId == null) {
//                                 //   textController.text = grocery.name;
//                                 //   selectedId = grocery.id;
//                                 // } else {
//                                 //   textController.text = '';
//                                 //   selectedId = null;
//                                 // }
//                               });
//                             },
//                             onLongPress: () {
//                               setState(() {
//                                 DatabaseHelper.instance.remove(grocery.id);
//                               });
//                             },
//                           ),
//                         ),
//                       );
//                     }).toList(),
//                   );
//           }),
//     );
//   }
// }
