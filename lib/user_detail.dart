import 'package:flutter/material.dart';
import 'package:happy_meal/controller/provider.dart';
import 'package:provider/provider.dart';


class UserDetailsPage extends StatefulWidget {
  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}



class _UserDetailsPageState extends State<UserDetailsPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  Future<void> _showConfirmationDialog() async {
    // Validate if all fields are filled
    if (nameController.text.isEmpty || emailController.text.isEmpty || phoneController.text.isEmpty) {
      // Show an error message if any field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter all details'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Do you want to submit the user details?'),
                SizedBox(height: 10,),
                Text('Name: ${nameController.text}'),
                Text('Email: ${emailController.text}'),
                Text('Phone: ${phoneController.text}')
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Submit'),
              onPressed: () {
                final cart = Provider.of<CartProvider>(context, listen: false);
                cart.clearCart();

                // Perform actions with the user details, e.g., submit to server
                // For now, print the details to the console
                print('Name: ${nameController.text}');
                print('Email: ${emailController.text}');
                print('Phone: ${phoneController.text}');

                // Show a SnackBar for 2 seconds
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Order Submitted Successfully', style: TextStyle(fontWeight: FontWeight.bold,)),
                    duration: Duration(seconds: 5),
                  ),
                );

                // You can navigate to the next screen or perform any other action
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Show the confirmation dialog
                    _showConfirmationDialog();
                  },
                  child: Text('Submit', style: TextStyle(color: Colors.red, fontSize: 20)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
