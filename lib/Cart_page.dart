import 'package:flutter/material.dart';
import 'package:happy_meal/controller/provider.dart';
import 'package:happy_meal/user_detail.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.cartItems;

    // Calculate total cost
    double totalCost = 0;
    for (var item in cartItems) {
      totalCost += item.price;
    }


    
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cartItems[index].itemName),
            subtitle: Text('\$${cartItems[index].price.toStringAsFixed(2)}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // Remove from Cart button
                    cartProvider.removeFromCart(cartItems[index]);

                    // Show a snackbar or any other feedback to the user
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Item removed from cart'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text('Remove from Cart', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          );
        },
      ),
      bottomSheet: Container(
        height: 60,
        color: Colors.white,
        child: Center(
          child: Text(
            'Total Cost: \$${totalCost.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => UserDetailsPage(),));
        },
        child: Container(
          height: 60,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          padding: EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Enter Your Confirmation', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
              SizedBox(width: 8),
              Icon(Icons.arrow_forward, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
