import 'package:flutter/material.dart';
import 'package:maristcommerce/product_shop/purchase_history.dart';
import 'package:maristcommerce/screen_pages/my_account.dart'; // Import MyAccount screen
import 'package:provider/provider.dart';

class PurchaseHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<PurchaseEntry> purchaseHistory =
        Provider.of<PurchaseHistory>(context).purchaseHistory;

    return Scaffold(
      appBar: AppBar(
        title: Text('Purchase History'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      MyAccount()), // Navigate to MyAccount screen
            );
          },
        ),
      ),
      body: purchaseHistory.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'No purchase history available.',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => MyAccount()),
                      ); // Add code to navigate to a screen where the user can make a purchase
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xFF00BE62),
                    ),
                    child:
                        Text('Make a Purchase', style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: purchaseHistory.length,
              itemBuilder: (context, index) {
                final PurchaseEntry entry = purchaseHistory[index];
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    leading: Icon(Icons.shopping_cart),
                    title: Text(
                      entry.productName,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Price: ${entry.price}, Quantity: ${entry.quantity}',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
