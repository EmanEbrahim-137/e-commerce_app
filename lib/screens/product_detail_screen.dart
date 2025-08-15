import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
   const ProductDetailScreen({super.key, required this.products, required this.initialIndex});

  final List<Map<String, dynamic>> products;
  final int initialIndex;


  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int currentRating = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Product Overview',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: widget.products.length,
        itemBuilder: (context, index) {
          final product = widget.products[index];
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  product['image'],
                  height: 350,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                SizedBox(height: 20),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(product['name'], 
                        style: TextStyle(
                          fontSize: 26, fontWeight: FontWeight.bold)
                          ),
                          Text('${product['name']} child', style: TextStyle(
                  fontSize: 15, fontWeight: FontWeight.w400
                ))
                      ],
                    ),
                    Spacer(),
                    Text(product['price'], style: TextStyle(
                      fontSize: 26, fontWeight: FontWeight.bold, color: Colors.red[300])),
                  ], 
                ),
                SizedBox(height: 10),
                Row(children: [
                  ...List.generate(5, (index)=>
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentRating = index + 1;
                        });
                      },
                      child: Icon(
                        Icons.star,
                        size: 40,
                        color: index < currentRating 
                        ? Colors.yellow[600] 
                        : Colors.grey,
                      ),
                    )
                  )
                ],),
                SizedBox(height: 15,),
                Text('This ${product['name']} is so comfortable and soft. You can buy it before being out of stock!'),
                SizedBox(height: 25,),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      radius: 40,
                      child: Icon(Icons.shopping_cart, color: Colors.red[300],size:30,),
                    ),
                    SizedBox(width: 20,),
                    SizedBox(
                      width: 300,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[300],
                        ),
                        onPressed: () {},
                        child: Text('Buy Now', style: TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        }
      ),
    );
  }
}