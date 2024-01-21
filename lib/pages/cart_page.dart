import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop_with_cart/model/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // my cart
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'My Cart',
                  style: GoogleFonts.notoSerif(
                      fontSize: 36.0, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8.0),

              // list of cart items
              Expanded(
                child: ListView.builder(
                    itemCount: value.cartItems.length,
                    padding: const EdgeInsets.all(12.0),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8.0)),
                          child: ListTile(
                            leading: Image.asset(
                              value.cartItems[index][2],
                              height: 36.0,
                            ),
                            title: Text(value.cartItems[index][0]),
                            // ignore: prefer_interpolation_to_compose_strings
                            subtitle: Text('\$' + value.cartItems[index][1]),
                            trailing: IconButton(
                              icon: const Icon(Icons.cancel),
                              onPressed: () =>
                                  Provider.of<CartModel>(context, listen: false)
                                      .removeItemToCart(index),
                            ),
                          ),
                        ),
                      );
                    }),
              ),

              // total price and pay now
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Price : ',
                            style: TextStyle(
                              color: Colors.green[100],
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            '\$${value.calculateTotal()}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      // pay now
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.green.shade100,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                'Pay Now',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),

                            // pay now button icon. this should need develope
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16.0,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
