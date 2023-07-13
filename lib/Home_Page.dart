// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/boxes/boxes.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'modles/cheakerlist_model.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

TextEditingController itemcontroler = TextEditingController();
TextEditingController editcontroler = TextEditingController();


// List<bool> cheakboxlist = List.generate(boxes.getData().length, (index) => false);
class _Home_pageState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("LIST CHEACKER"),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        'List Cheacker',
                        style: TextStyle(fontSize: 15),
                      ),
                      content: TextFormField(
                        controller: itemcontroler,
                        decoration: InputDecoration(
                            hintText: 'Enter item',
                            suffixIcon: Icon(Icons.note_alt_outlined),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Cancle")),
                        TextButton(
                            onPressed: () async {


                               final data=listmodel(
                                   item: itemcontroler.text.toString(),
                                   cheak: false );
                               final box=boxes.getData();
                               box.add(data).then((value){
                                 data.save();
                                 itemcontroler.clear();
                                 Navigator.of(context).pop();

                               });





                            },
                            child: Text("Ok")),
                      ],
                    );
                  },
                );
              },
              icon: Icon(
                Icons.add,
                size: 30,
              )),
          SizedBox(
            width: 18,
          )
        ],
      ),
      body:  Padding(
        padding: const EdgeInsets.all(20.0),
        child: ValueListenableBuilder<Box<listmodel>>(
          valueListenable: boxes.getData().listenable(),
          builder: (context, box, _) {
            var data=box.values.toList().cast<listmodel>();
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Container(
                    width: double.infinity,
                    // height: 100,
                    decoration: const BoxDecoration(
                      // color: Colors.red,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Checkbox(
                          shape: const CircleBorder(
                              side: BorderSide(
                                style: BorderStyle.solid,
                              )),
                          value: data[index].cheak,
                          checkColor: Colors.white,
                          fillColor: MaterialStatePropertyAll(
                            Colors.red.shade300,
                          ),
                          onChanged: (bool? value) {

                            setState(() {
                              data[index].cheak = value ?? false;
                              data[index].save();
                            });
                          },
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .5,
                            child:  Text(data[index].item.toString())),


                        IconButton(
                            onPressed: () {






                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      'Edit',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    content: TextFormField(
                                      controller: editcontroler,
                                      decoration: InputDecoration(
                                          hintText: 'Update value',
                                          suffixIcon: Icon(Icons.note_alt_outlined),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10.0))),
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Cancle")),
                                      TextButton(
                                          onPressed: () {
                                            setState(() {
                                              data[index].item = editcontroler.text.toString();
                                              data[index].save();
                                              editcontroler.clear();
                                              Navigator.of(context).pop();
                                            });




                                          },
                                          child: Text("Edit")),
                                    ],
                                  );
                                },
                              );











                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              delete(data[index]);

                            },
                            icon: const Icon(Icons.delete)),
                      ],
                    ),
                  ),
                );
              },);

          },),
      )
    );
  }
  void delete(listmodel listmodels)async{
    await listmodels.delete();
  }
}
