import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final String company;
  final Color bag;
  const ProductCard({
    super.key,
    
    required this.image,
    required this.title,
    required this.price,
    required this.bag,
      required this.company,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 26 , vertical: 20),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: bag,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          SizedBox(
            
          width: 300,
          height: 250,
            child: Image.asset(image , 
            fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 7),
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 7),
          Text(company, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 7),
          Text(
            'Rs ${price.toString()}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
