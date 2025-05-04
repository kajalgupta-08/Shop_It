import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cart_provider.dart';

class ProductDetails extends StatefulWidget {
  final Map<String, Object> product;

  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String selectedSize = ''; 

  void onTap() {
    if (selectedSize.isNotEmpty) {
     
      Provider.of<CartProvider>(context, listen: false).addproduct({
        'id': widget.product['id'],
        'title': widget.product['title'],
        'price': widget.product['price'],
        'imageUrl': widget.product['imageUrl'],
        'company': widget.product['company'],
        'sizes': selectedSize, 
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Added to cart"),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please select size"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Details')),
      body: Column(
        children: [
          Text(
            widget.product['title'] as String,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 360,

              child: Image.asset(
                widget.product['imageUrl'] as String,
                height: 400,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const Spacer(),
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Color.fromRGBO(200, 235, 247, 1),
            ),
            child: Column(
              children: [
                Text(
                  'Rs ${widget.product['price']}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List<String>).length,
                    itemBuilder: (context, index) {
                      final size =
                          (widget.product['sizes'] as List<String>)[index];

                      return Padding(
                        
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize =
                                  size; 
                            });
                          },
                          child: Chip(
                            label: Text(size),
                            backgroundColor:
                                selectedSize == size
                                    ? Theme.of(context).colorScheme.primary
                                    : Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton.icon(
                    onPressed: onTap,
                    icon: Icon(Icons.shopping_cart_outlined),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      minimumSize: const Size(double.infinity, 50),
                      iconColor: Colors.black,
                      iconSize: 30,
                    ),
                    label: Text(
                      "Add to cart",
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
