import 'package:flutter/material.dart';
import 'package:login_password_encrypted/logic/BO/BO.dart';
import 'package:login_password_encrypted/logic/models/customer.dart';

class Newcustomer extends StatefulWidget {
  Customer customer;
  Newcustomer({this.customer});
  @override
  _NewcustomerState createState() => _NewcustomerState();
}

class _NewcustomerState extends State<Newcustomer> {
  TextEditingController _controller1;
  TextEditingController _controller2;
  TextEditingController _controller3;
  TextEditingController _controller4;
  TextEditingController _controller5;
  TextEditingController _controller6;
  TextEditingController _controller7;
  TextEditingController _controller8;
  bool validate1 = true;
  bool validate2 = true;
  bool validate3 = true;
  bool validate4 = true;
  bool validate5 = true;
  bool validate6 = true;
   bool validate7 = true;
  bool validate8 = true;

  isDefault(Customer customer) {
    if (customer.firstname == '' && customer.lastname == '') {
      return true;
    } else {
      return false;
    }
  }

  Widget button(String buttonText) {
    {
      return Container(
          height: 50,
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: RaisedButton(
            textColor: Colors.white,
            child: Text(
              buttonText,
              style: TextStyle(fontSize: 18),
            ),
            onPressed: () {
              String username = _controller1.text;
              String firstname = _controller2.text;
              String lastname = _controller3.text;
              String mail = _controller4.text;
              String bio = _controller5.text;

              String usertype = _controller6.text;
              String language = _controller7.text;
              String password = _controller8.text;
              setState(() {
                isNullOrEmpty(username) ? validate1 = false : validate1 = true;
                isNullOrEmpty(firstname) ? validate2 = false : validate2 = true;
                isNullOrEmpty(lastname) ? validate3 = false : validate3 = true;
                isNullOrEmpty(mail) ? validate4 = false : validate4 = true;

                isNullOrEmpty(bio) ? validate5 = false : validate5 = true;
                isNullOrEmpty(usertype) ? validate6 = false : validate6 = true;
                isNullOrEmpty(language) ? validate7 = false : validate7 = true;
                isNullOrEmpty(password) ? validate8 = false : validate8 = true;
              });
              if (validate1 == true &&
                  validate2 == true &&
                  validate3 == true &&
                  validate4 == true &&
                  validate5 == true) {
                widget.customer =
                    new Customer(username, firstname, lastname, mail,bio,usertype,language, password);
                Navigator.of(context).pop(widget.customer);
              }
            },
          ));
    }
  }

  Widget _inputData(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          textfield('User name', _controller1, false, validate: validate1),
          SizedBox(height: 10),
          textfield('First Name', _controller2, false, validate: validate2),
          SizedBox(height: 10),
          textfield('Last name', _controller3, false, validate: validate3),
          SizedBox(height: 10),
          textfield('Mail', _controller4, false, validate: validate3),
          SizedBox(height: 10),
          textfield('bio', _controller5, false, validate: validate5),
          SizedBox(height: 10),
          textfield('usertype', _controller6, false, validate: validate6),
          SizedBox(height: 10),
          textfield('languese speak', _controller7, false, validate: validate7),
          SizedBox(height: 10),
          textfield('Password', _controller8, true, validate: validate8),
          SizedBox(height: 50),
          isDefault(widget.customer) ? button('Insert') : button('Update'),
        ],
      ),
    );
  }

  @override
  void initState() {
    if (widget.customer == null) widget.customer = new Customer.def();
    _controller1 = TextEditingController();
    _controller1.text = widget.customer.username;
    _controller2 = TextEditingController();
    _controller2.text = widget.customer.firstname;
    _controller3 = TextEditingController();
    _controller3.text = widget.customer.lastname;
    _controller4 = TextEditingController();
    _controller4.text = widget.customer.mail;
    _controller5 = TextEditingController();
    _controller5.text = widget.customer.bio;
    _controller6 = TextEditingController();
    _controller6.text = widget.customer.usertype;
    _controller7 = TextEditingController();
    _controller7.text = widget.customer.language;
    _controller8 = TextEditingController();
    _controller8.text = widget.customer.hash;
    super.initState();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    _controller6.dispose();
    _controller7.dispose();
    _controller8.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: isDefault(widget.customer)
              ? new Text('New customer')
              : new Text('Update customer'),
        ),
        body: SingleChildScrollView(child: Center(child: _inputData(context))));
  }
}
