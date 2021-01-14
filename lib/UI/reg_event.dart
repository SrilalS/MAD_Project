import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  Register() : super();
  final String title = "DropDown Demo";

  @override
  _RegisterState createState() => _RegisterState();
}

class Company {
  int id;
  String name;

  Company(this.id, this.name);

  static List<Company> getCompanies() {
    return <Company>[
      Company(1, '20.1'),
      Company(2, '19.2'),
      Company(3, '19.1'),
      Company(4, '18.2'),
      Company(5, '18.1'),
    ];
  }
}

class _RegisterState extends State<Register> {
  List<Company> _companies = Company.getCompanies();
  List<DropdownMenuItem<Company>> _dropdownMenuItems;
  Company _selectedCompany;
  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Company>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Company>> items = List();
    for (Company company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Company selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(" Event Registration"),
        ),
        body: new Container(
            child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 100.0,
              ),
              Text(
                'Select Your Batch',
                style: TextStyle(fontSize: 24),
              ),
              DropdownButton(
                value: _selectedCompany,
                items: _dropdownMenuItems,
                onChanged: onChangeDropdownItem,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Selected: ${_selectedCompany.name}',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Select Your Faculty',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              RadioListTile(
                value: 1,
                groupValue: null,
                title: Text(
                  'School Of Computing',
                  style: TextStyle(fontSize: 20),
                ),
                onChanged: (val) {
                  print("Radio Tile pressed $val");
                },
                activeColor: Colors.blue[900],
                selected: true,
              ),
              RadioListTile(
                value: 1,
                groupValue: null,
                title: Text(
                  'School Of Business',
                  style: TextStyle(fontSize: 20),
                ),
                onChanged: (val) {
                  print("Radio Tile pressed $val");
                },
                activeColor: Colors.blue,
                selected: true,
              ),
              RadioListTile(
                value: 1,
                groupValue: null,
                title: Text(
                  'School Of Engineering',
                  style: TextStyle(fontSize: 20),
                ),
                onChanged: (val) {
                  print("Radio Tile pressed $val");
                },
                activeColor: Colors.blue,
                selected: true,
              ),
              SizedBox(
                height: 25,
              ),
              new RaisedButton(
                onPressed: () {},
                textColor: Colors.white,
                color: Colors.blue,
                padding: const EdgeInsets.all(13.0),
                child: new Text(
                  "Register",
                  style: (TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
