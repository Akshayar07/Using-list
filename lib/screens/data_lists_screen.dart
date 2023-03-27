import 'package:data/screens/login.dart';
import 'package:flutter/material.dart';

class DataListScreen extends StatelessWidget {
  final List<Map<String, String>> dataList;

  DataListScreen({required this.dataList});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Data List'),
        ),
        body: ListView.builder(
          // scrollDirection: Axis.horizontal,
          itemCount: dataList.length,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  color: Colors.blueGrey[100],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Detail of : ',style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold,color: Colors.purple),),
                            Text(
                              (dataList[index]['name']!),
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold,color: Colors.purple),
                            ),
                          ],
                        ),
                        DataTable(
                          columnSpacing: 25,
                          horizontalMargin: 10,
                          columns: [
                            DataColumn(
                                label: Text(
                              'Name',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                            DataColumn(
                                label: Text(
                              'email',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                            DataColumn(
                                label: Text(
                              'phone',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                            DataColumn(
                                label: Text(
                              'Gender',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                            DataColumn(
                                label: Text(
                              'DOB',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                          ],
                          dividerThickness: 2,
                          rows: [
                            DataRow(cells: [
                              DataCell(Text(dataList[index]['name']!,
                                style: TextStyle(color: Colors.black),),),
                              DataCell(Text(dataList[index]['email']!)),
                              DataCell(Text(dataList[index]['phone']!)),
                              DataCell(Text(dataList[index]['selectedGender']!)),
                              DataCell(Text(dataList[index]['dateinput']!)),

                            ]),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.purple,
        ),
      ),
    );
  }
}
