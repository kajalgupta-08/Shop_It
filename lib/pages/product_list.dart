import 'package:flutter/material.dart';
import 'package:shopping_app/pages/product_card.dart';
import 'package:shopping_app/pages/product_details.dart';
import 'package:shopping_app/global_var.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const ['All', 'Tommy Hilfiger', 'Forever 21', 'Levi\'s'];

  late String selectedfilter;
  late TextEditingController searchController;  
  String searchQuery = '';  

  @override
  void initState() {
    super.initState();
    selectedfilter = filters[0]; 
    searchController = TextEditingController();  
    searchController.addListener(_onSearchChanged);  
  }


  void _onSearchChanged() {
    setState(() {
      searchQuery = searchController.text.toLowerCase();  
    });
  }

  List<Map<String, Object>> get filteredProducts {
    List<Map<String, Object>> filteredList = products;

   
    if (selectedfilter != 'All') {
      filteredList = filteredList.where((product) {
        return product['company'] == selectedfilter;
      }).toList();
    }

   
    if (searchQuery.isNotEmpty) {
      filteredList = filteredList.where((product) {
        return product['title'].toString().toLowerCase().contains(searchQuery) ||
               product['company'].toString().toLowerCase().contains(searchQuery);
      }).toList();
    }

    return filteredList;
  }

  @override
  void dispose() {
    searchController.dispose();  
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: 
            SizedBox(
  child: Padding(
  padding: const EdgeInsets.all(8),
  child: TextField(
    controller: searchController,
    decoration: InputDecoration(
      prefixIcon: Icon(Icons.search),
      hintText: "Search",
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(vertical: 14),

      
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.primary,
          width: 3,
        ),
      ),

      
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.primary,
          width: 3,
        ),
      ),
    ),
  ),
),
)

),

            SizedBox(height: 6),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.5),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedfilter = filter; // Update selected filter
                        });
                      },
                      child: Chip(
                        backgroundColor:
                            selectedfilter == filter
                                ? Theme.of(context).colorScheme.primary
                                : Colors.white,
                        label: Text(filter, style: TextStyle(fontSize: 16)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.all(8),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredProducts.length,  // Display filtered products
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];  // Get the filtered product
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder:
                              (context) => ProductDetails(product: product),
                        ),
                      );
                    },
                    child: ProductCard(
                      image: product['imageUrl'] as String,
                      title: product['title'].toString(),
                      price: product['price'] as double,
                      company: product['company'].toString(),
                      bag:
                          index.isEven
                              ? Theme.of(context).colorScheme.primary
                              : const Color.fromARGB(255, 252, 222, 165),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
