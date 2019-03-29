import 'package:agriwaste/phone_auth_simple.dart';
import 'package:flutter/material.dart';
import 'NewRequest.dart';
import 'AfterOTPVerification.dart';
bool cnf=false;
class handlesubmit extends StatefulWidget {
  final Item item;
  handlesubmit({this.item});
  @override
  _handlesubmitState createState() => _handlesubmitState();
}

class _handlesubmitState extends State<handlesubmit> {
  @override
  Widget build(BuildContext context) {
    return
     PhoneAuthSimple(
        countryCode: '+91',
        phoneNumber: widget.item.Mobile,
        onVerificationSuccess: () {
          setState(() {
            cnf=true;
          });

        },
        onVerificationFailure: () {
          print("Please Retry");
        },
      );

    }

  }

