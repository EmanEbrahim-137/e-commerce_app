import 'package:flutter/material.dart';
import 'package:my_s_project/screens/product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> products = [
    {
      'image': 'assets/images/products/image1.jpg',
      'name': 'T-Shirt',
      'price': '\$300.00',
      'rating': 55,
    },
    {
      'image': 'assets/images/products/image2.jpg',
      'name': 'Jacket',
      'price': '\$100.00',
      'rating': 666,
    },
    {
      'image':'assets/images/products/image3.jpg',
      'name': 'Child Jacket',
      'price': '\$600.00',
      'rating': 323,
    },
    {
      'image':'assets/images/products/image4.jpg',
      'name': 'Hooded',
      'price': '\$700.00',
      'rating': 88,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: Colors.grey[200],
          child: Row(
            children: [
              Icon(Icons.search, color: Colors.red[300]),
              SizedBox(width: 8),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Find Your Product',
                    hintStyle: TextStyle(color: Colors.red[300]),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            color: Colors.grey[200],
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications, color: Colors.red[300]),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children:[ Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/images.png', 
                fit: BoxFit.cover,
                width: double.infinity,
                height: 100,
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(
                            initialIndex: index,
                            products: products,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Image(image: AssetImage(products[index]['image']), height: 200,),
                              Positioned(
                                top: 10,
                                right: 10,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.favorite, color: Colors.red[300])),
                              ),
                            ],
                          ),
                          Text(products[index]['name'], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow[600]),
                              SizedBox(width: 4),
                              Text('(${products[index]['rating']})'),
                              SizedBox(width: 4),
                              Text(products[index]['price'], style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red[300])),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  scrollDirection: Axis.horizontal,
                        
                ),
              ),
              SizedBox(height: 50,),
              Text('Newest Products', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 3,
                  ), 
                itemBuilder:(context, index) => Card(
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Image.asset(
                                products[index]['image'],
                                height: 180,
                                width: 180,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                top: 10,
                                right: 10,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.favorite, color: Colors.red[300])),
                              ),
                            ],
                          ),
                          Text(products[index]['name'], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow[600]),
                              SizedBox(width: 4),
                              Text('(${products[index]['rating']})'),
                              SizedBox(width: 4),
                              Text(products[index]['price'], style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red[300])),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  )
            ],
          ),
          ],
        ),
      ),
    );
  }
}
