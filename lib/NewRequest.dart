import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:agriwaste/OnSubmitForm.dart';
import 'package:intl/intl.dart';
Item savitem;
DatabaseReference itemRef;
class NewRequest extends StatefulWidget {
  @override
  State<StatefulWidget> createState()=> NewRequestState();
}


class NewRequestState extends State<NewRequest>{

  List<Item> items = List();
  Item item;
//  DatabaseReference itemRef;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    item = Item("", "","","","","","","","","","","");
    final FirebaseDatabase database = FirebaseDatabase.instance; //Rather then just writing FirebaseDatabase(), get the instance.
    itemRef = database.reference().child('items');
    itemRef.onChildAdded.listen(_onEntryAdded);
    itemRef.onChildChanged.listen(_onEntryChanged);
  }

  _onEntryAdded(Event event) {
    setState(() {
      items.add(Item.fromSnapshot(event.snapshot));
    });
  }

  _onEntryChanged(Event event) {
    var old = items.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });
    setState(() {
      items[items.indexOf(old)] = Item.fromSnapshot(event.snapshot);
    });
  }
  void otpnumberpasser(Item item){

    print(item.Mobile+'1');
    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new handlesubmit(item: item)));

  }
//
//  String Name;
//  String Address;
//  String CropType;
//  String LandSize;
//  String Mobile;

  String _validateName(String value){
    if(value.isEmpty) return'Filled is requried.';
    final RegExp nameExp = new RegExp(r'^[A-za-z]+$');
    if (!nameExp.hasMatch(value))
      return 'please Enter a valid input.';
    return null;
  }

  final TextEditingController _controller = new TextEditingController();
  Future _chooseDate(BuildContext context, String initialDateString) async {
    var now = new DateTime.now();
    var initialDate = convertToDate(initialDateString) ?? now;
    initialDate = (initialDate.year <= 2022 && initialDate.isAfter(now) ? initialDate : now);

    var result = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2022), );

    if (result == null) return;

    setState(() {
      _controller.text = new DateFormat.yMd().format(result);
    });

  }

  DateTime convertToDate(String input) {
    try
    {
      var d = new DateFormat.yMd().parseStrict(input);
      return d;
    } catch (e) {
      return null;
    }
  }

  final _formKey = GlobalKey<FormState>();
  DateTime date;
  TimeOfDay time;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: Form(
              key: _formKey,
              child: Material(
                child: Container(
                  height: 1000,
                  child: Card(
                    elevation: 4,
                    margin: EdgeInsets.all(16),
                    child: new ListView(
                      reverse: false,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      children: <Widget>[
//            SizedBox(height: 24.0,),
                        TextFormField(
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: false,
                            icon: Icon(Icons.person),
                            hintText: 'eg- Ankit',
                            labelText: 'Name ',


                          ),
                          maxLength: 50,
                          onSaved: (val) => item.Name = val,
                          validator: _validateName,
                        ),
//            SizedBox(height: 24.0,),
                        TextFormField(
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: false,
                            icon: Icon(Icons.place),
                            hintText: 'Where is your farm?',
                            labelText: 'Farm Address',


                          ),
                          maxLines: 2,
                          onSaved: (val) => item.Address = val,
                          validator: _validateName,
                        ),
//            SizedBox(height: 24.0),
                        TextFormField(
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: false,
                            icon: Icon(Icons.place),
                            hintText: 'eg- 140001',
                            labelText: 'Pincode ',


                          ),
                          maxLength: 25,
                          onSaved: (val) => item.Pincode = val,
                          validator: (val) => val == "" ? val : null,
                        ),
//            SizedBox(height: 24.0),
                        TextFormField(
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: false,
                            icon: Icon(Icons.person),
                            hintText: 'eg- rice',
                            labelText: 'Crop Name ',


                          ),
//              maxLength: 25,
                          onSaved: (val) => item.CropType = val,
                          validator: (val) => val == "" ? val : null,
                        ),

//            SizedBox(height: 24.0),
                        TextFormField(
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: false,
                            icon: Icon(Icons.landscape),
                            hintText: 'In Acres',
                            labelText: 'Land Area',

                          ),
//              maxLength: 5,
                          keyboardType: TextInputType.phone,
                          onSaved: (val) => item.LandSize = val,
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly,
                          ],
                        ),
                        new Row(children: <Widget>[
                          new Expanded(
                              child: SizedBox(
                                width:2,
                                child: new TextFormField(

                                  decoration: new InputDecoration(
                                    icon: const Icon(Icons.calendar_today),
                                    hintText: 'When do you want us to come?',
                                    labelText: 'Harvest Date',
                                  ),

                                  controller: _controller,
                                  keyboardType: TextInputType.datetime,
                                  onSaved: (val) => item.HarvestDate = val,
                                ),
                              )),
                          new IconButton(
                            icon: new Icon(Icons.calendar_view_day),
                            tooltip: 'Choose date',
                            onPressed: (() {
                              _chooseDate(context, _controller.text);
                            }),
                          )
                        ]),
//              new TextFormField(
//                decoration: const InputDecoration(
//                  border: UnderlineInputBorder(),
//                  filled: false,
//                  icon: const Icon(Icons.calendar_today),
//                  hintText: 'Enter your date of harvest',
//                  labelText: 'When will you harvest your crop?',
//
//                ),
//                keyboardType: TextInputType.datetime,
//                onSaved: (val) => item.HarvestDate = val,
//              ),

//            SizedBox(height: 24.0),
                        TextFormField(
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: false,
                            icon: Icon(Icons.phone),
                            hintText: 'Your phone no.',
                            labelText: 'Phone No.',
                            prefixText: '+91',
                          ),
                          maxLength: 10,
                          keyboardType: TextInputType.phone,
                          onSaved: (val) => item.Mobile = val,
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly,
                          ],
                        ),
                        new TextFormField(
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: false,
                            icon: const Icon(Icons.calendar_today),
                            hintText: 'If you would like to help us',
                            labelText: 'Donation',
                          ),
                          keyboardType: TextInputType.phone,
                          onSaved: (val) => item.Donations = val,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: RaisedButton(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                print(item.Name);
                                savitem=item;
                                otpnumberpasser(item);
                              }
                            },
                            child: Text('Submit'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                        ),
                      ],
                    ),
                  ),
                ),

              ),
            ),
          ),
        ],
      ),
    );





  }
}
class Item {
  String key;
  String Name;
  String Mobile;
  String Address;
  String HarvestDate;
  String CropType;
  String LandSize;
  String Donations;
  String Pincode;
  String DName='0';
  String DMobile='0';
  String TrackStatus='0';

  Item(this.key,this.Name, this.Mobile, this.Address, this.HarvestDate, this.CropType,
      this.LandSize,this.Donations,this.Pincode,this.DName,this.DMobile,this.TrackStatus);

  Item.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        Name = snapshot.value["Name"],
        Mobile = snapshot.value["Mobile"],
        Address= snapshot.value["Address"],
        HarvestDate= snapshot.value["HarvestDate"],
        CropType= snapshot.value["CropType"],
        LandSize= snapshot.value["LandSize"],
        Donations= snapshot.value["Donations"],
        Pincode= snapshot.value["Pincode"],
        DName= snapshot.value["DName"],
        DMobile= snapshot.value["DMobile"],
        TrackStatus= snapshot.value["TrackStatus"]
  ;

}
//class User {
//  String key=null;
//  String Name=null;
//  String Mobile=null;
//  String Address=null;
//  String Pincode=null;
//
//  User(this.Name, this.Mobile, this.Address, this.Pincode,this.key);
//
//}
//