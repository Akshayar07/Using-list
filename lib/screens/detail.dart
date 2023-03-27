import 'package:data/screens/data_lists_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  List<Map<String, String>> _dataList = [];

  TextEditingController dateinput = TextEditingController();
   String _selectedGender = '';
  bool isChecked = false;

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Enter Details',
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a name';
                          }
                          return null;
                        },
                        controller: _nameController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(width: 1, color: Colors.purple),
                            ),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.purple,
                            ),
                            border: OutlineInputBorder(),
                            labelText: 'Name',
                            labelStyle: TextStyle(color: Colors.purple),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(width: 1, color: Colors.purple))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a name';
                          }
                          return null;
                        },
                        controller: _emailController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(width: 1, color: Colors.purple),
                            ),
                            prefixIcon: Icon(
                              Icons.mail,
                              color: Colors.purple,
                            ),
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.purple),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(width: 1, color: Colors.purple))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a name';
                          }
                          return null;
                        },
                        controller: _phoneController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(width: 1, color: Colors.purple),
                            ),
                            prefixIcon: Icon(
                              Icons.phone_android_sharp,
                              color: Colors.purple,
                            ),
                            border: OutlineInputBorder(),
                            labelText: 'Phone Number',
                            labelStyle: TextStyle(color: Colors.purple),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(width: 1, color: Colors.purple))),
                      ),
                    ),
                    Container(
                        child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select the database';
                                  }
                                  return null;
                                },
                                controller: dateinput,
                                //editing controller of this TextField
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(width: 1, color: Colors.purple),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(width: 1, color: Colors.purple)),
                                    prefixIcon: Icon(
                                      Icons.calendar_today,
                                      color: Colors.purple,
                                    ),
                                    // icon: Icon(Icons.calendar_today,color: Colors.purple,), //icon of text field
                                    labelText: "Date Of Birth",
                                    labelStyle: TextStyle(
                                        color: Colors.purple) //label text of field
                                ),
                                readOnly: true,
                                //set it true, so that user will not able to edit text
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1990),
                                      //DateTime.now() - not to allow to choose before today.
                                      lastDate: DateTime(2101));

                                  if (pickedDate != null) {
                                    print(
                                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                    String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                    print(
                                        formattedDate); //formatted date output using intl package =>  2021-03-16
                                    //you can implement different kind of Date Format here according to your requirement

                                    setState(() {
                                      dateinput.text =
                                          formattedDate; //set output date to TextField value.
                                    });
                                  } else {
                                    print("Date is not selected");
                                  }
                                },
                              ),
                            ))),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Select gender:',
                              style: TextStyle(fontSize: 20),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  Radio<String>(
                                    value: 'male',
                                    groupValue: _selectedGender,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedGender = value!;
                                      });
                                    },
                                  ),
                                  Text('Male'),
                                  Radio<String>(
                                      activeColor: Colors.purple,
                                      value: 'Female',
                                      groupValue: _selectedGender,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedGender = value!;
                                        });
                                      }),
                                  Text('Female'),
                                ],
                              ),
                            ),
                          ],
                        )),
                    Row(
                      children: [
                        Checkbox(
                            side: BorderSide(color: Colors.purple),
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            }),
                        Text('I have read and agree to the terms of service'),
                      ],
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            _dataList.add({
                              'name': _nameController.text,
                              'email': _emailController.text,
                              'phone': _phoneController.text,
                              'selectedGender': _selectedGender.toString(),
                              'dateinput': dateinput.text,
                            });

                            _nameController.clear();
                            _emailController.clear();
                            _phoneController.clear();
                            dateinput.clear();
                            // _selectedGender.clear();
                            // isChecked.clear();

                            // _selectedGender.clear();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DataListScreen(dataList: _dataList),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 100),
                          child: Text(
                            'Submit',
                            style: TextStyle(fontSize: 20),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//
// class Detail extends StatefulWidget {
//   const Detail({Key? key}) : super(key: key);
//
//   @override
//   State<Detail> createState() => _DetailState();
// }
//
// class _DetailState extends State<Detail> {
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController _name = TextEditingController();
//   TextEditingController _email = TextEditingController();
//   TextEditingController _phone = TextEditingController();
//   TextEditingController dateinput = TextEditingController();
//   String _selectedGender = '';
//   bool isChecked = false;
//
//   @override
//   void initState() {
//     dateinput.text = ""; //set the initial value of text field
//     super.initState();
//   }
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image(
//                     image: AssetImage(
//                       'assets/logo.png',
//                     ),
//                     height: 200,
//                     width: 200,
//                   ),
//                   Text(
//                     'Enter Details',
//                     style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: TextFormField(
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please Enter Name';
//                         }
//                         return null;
//                       },
//                       controller: _name,
//                       decoration: InputDecoration(
//                           enabledBorder: OutlineInputBorder(
//                             borderSide:
//                                 BorderSide(width: 1, color: Colors.purple),
//                           ),
//                           prefixIcon: Icon(
//                             Icons.person,
//                             color: Colors.purple,
//                           ),
//                           border: OutlineInputBorder(),
//                           labelText: 'Name',
//                           labelStyle: TextStyle(color: Colors.purple),
//                           focusedBorder: OutlineInputBorder(
//                               borderSide:
//                                   BorderSide(width: 1, color: Colors.purple))),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: TextFormField(
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please Enter your Email Id';
//                         }
//                         return null;
//                       },
//                       controller: _email,
//                       decoration: InputDecoration(
//                           enabledBorder: OutlineInputBorder(
//                             borderSide:
//                                 BorderSide(width: 1, color: Colors.purple),
//                           ),
//                           prefixIcon: Icon(
//                             Icons.mail,
//                             color: Colors.purple,
//                           ),
//                           border: OutlineInputBorder(),
//                           labelText: 'Email',
//                           labelStyle: TextStyle(color: Colors.purple),
//                           focusedBorder: OutlineInputBorder(
//                               borderSide:
//                                   BorderSide(width: 1, color: Colors.purple))),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: TextFormField(
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your mobile number';
//                         }
//                         return null;
//                       },
//                       controller: _phone,
//                       decoration: InputDecoration(
//                           enabledBorder: OutlineInputBorder(
//                             borderSide:
//                                 BorderSide(width: 1, color: Colors.purple),
//                           ),
//                           prefixIcon: Icon(
//                             Icons.phone_android_sharp,
//                             color: Colors.purple,
//                           ),
//                           border: OutlineInputBorder(),
//                           labelText: 'Phone Number',
//                           labelStyle: TextStyle(color: Colors.purple),
//                           focusedBorder: OutlineInputBorder(
//                               borderSide:
//                                   BorderSide(width: 1, color: Colors.purple))),
//                     ),
//                   ),
//                   Container(
//                       child: Center(
//                           child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: TextFormField(
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please select the database';
//                         }
//                         return null;
//                       },
//                       controller: dateinput,
//                       //editing controller of this TextField
//                       decoration: InputDecoration(
//                           enabledBorder: OutlineInputBorder(
//                             borderSide:
//                                 BorderSide(width: 1, color: Colors.purple),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                               borderSide:
//                                   BorderSide(width: 1, color: Colors.purple)),
//                           prefixIcon: Icon(
//                             Icons.calendar_today,
//                             color: Colors.purple,
//                           ),
//                           // icon: Icon(Icons.calendar_today,color: Colors.purple,), //icon of text field
//                           labelText: "Date Of Birth",
//                           labelStyle: TextStyle(
//                               color: Colors.purple) //label text of field
//                           ),
//                       readOnly: true,
//                       //set it true, so that user will not able to edit text
//                       onTap: () async {
//                         DateTime? pickedDate = await showDatePicker(
//                             context: context,
//                             initialDate: DateTime.now(),
//                             firstDate: DateTime(1990),
//                             //DateTime.now() - not to allow to choose before today.
//                             lastDate: DateTime(2101));
//
//                         if (pickedDate != null) {
//                           print(
//                               pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
//                           String formattedDate =
//                               DateFormat('yyyy-MM-dd').format(pickedDate);
//                           print(
//                               formattedDate); //formatted date output using intl package =>  2021-03-16
//                           //you can implement different kind of Date Format here according to your requirement
//
//                           setState(() {
//                             dateinput.text =
//                                 formattedDate; //set output date to TextField value.
//                           });
//                         } else {
//                           print("Date is not selected");
//                         }
//                       },
//                     ),
//                   ))),
//                   Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 10),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Select gender:',
//                             style: TextStyle(fontSize: 20),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 10),
//                             child: Row(
//                               children: [
//                                 Radio<String>(
//                                   value: 'male',
//                                   groupValue: _selectedGender,
//                                   onChanged: (value) {
//                                     setState(() {
//                                       _selectedGender = value!;
//                                     });
//                                   },
//                                 ),
//                                 Text('Male'),
//                                 Radio<String>(
//                                     activeColor: Colors.purple,
//                                     value: 'Female',
//                                     groupValue: _selectedGender,
//                                     onChanged: (value) {
//                                       setState(() {
//                                         _selectedGender = value!;
//                                       });
//                                     }),
//                                 Text('Female'),
//                               ],
//                             ),
//                           ),
//                         ],
//                       )),
//                   Row(
//                     children: [
//                       Checkbox(
//                           side: BorderSide(color: Colors.purple),
//                           value: isChecked,
//                           onChanged: (bool? value) {
//                             setState(() {
//                               isChecked = value!;
//                             });
//                           }),
//                       Text('I have read and agree to the terms of service'),
//                     ],
//                   ),
//                   ElevatedButton(
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => Result(
//                                   name: _name.text,
//                                   email: _email.text,
//                                   phone: _phone.text,
//                                   selectedGender: _selectedGender.toString(),
//                                   dateinput: dateinput.text)));
//                         }
//                       },
//                       style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.purple),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 15, horizontal: 100),
//                         child: Text(
//                           'Submit',
//                           style: TextStyle(fontSize: 20),
//                         ),
//                       )),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
