import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:food_delivery_app/deliveryprogresspage.dart';

class Paymentpage extends StatefulWidget {
  const Paymentpage({super.key});

  @override
  State<Paymentpage> createState() => _PaymentpageState();
}

class _PaymentpageState extends State<Paymentpage> {
  GlobalKey<FormState> formKey=GlobalKey();
  String cardNumber='';
  String expiryDate='';
  String cardHolderName='';
  String cvvCode='';
  bool isCvvFocused=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text("Checkout"),
        centerTitle: true,
      ),
      body: Expanded(
        child: Column(
          children: [
            CreditCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
                onCreditCardWidgetChange: (data){}
            ),
            CreditCardForm(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                onCreditCardModelChange: (data){
                  setState(() {
                    cardNumber=data.cardNumber;
                    expiryDate=data.expiryDate;
                    cardHolderName=data.cardHolderName;
                    cvvCode=data.cvvCode;
                  });
                },
                formKey: formKey
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(left: 15,right: 15),
              child: ElevatedButton(
                  onPressed: (){
                    if(formKey.currentState!.validate()) {
                      showDialog(context: context, builder: (context) {
                        return AlertDialog(
                          title: Text("Confirm Payment"),
                          content: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                Text("Card Number:$cardNumber"),
                                Text("Expiry Date:$expiryDate"),
                                Text("CardHolder Name:$cardHolderName"),
                                Text("CVV Code:$cvvCode"),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(onPressed: () {
                              Navigator.of(context).pop();
                            },
                                child: Text(
                                    "Cancel",
                                    style: TextStyle(color: Colors.red))),
                            TextButton(onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) {
                                    return Deliveryprogresspage();
                                  }));
                            },
                                child: Text(
                                    "Yes", style: TextStyle(color: Colors.green)))
                          ],
                        );
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  child: Text("Pay Now",
                      style: TextStyle(fontSize: 16,
                          fontWeight: FontWeight.bold,color:Theme.of(context).colorScheme.inversePrimary)
                  )
              ),
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
