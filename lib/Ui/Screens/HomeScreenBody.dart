import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceryapp/Data/Model/Product.dart';
import 'package:groceryapp/Data/Repository/ProductRepository.dart';
import 'package:groceryapp/Ui/Widgets/productCard.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductRepository productRepository = new ProductRepository();
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 11.5 / 25,
                    height: MediaQuery.of(context).size.height * 1 / 8,
                    decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent,
                        borderRadius: BorderRadius.circular(8)),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1573246123716-6b1782bfc499?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1260&q=80',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(width: 60, height: 30, decoration: BoxDecoration(color: Colors.black.withOpacity(.5), borderRadius: BorderRadius.circular(10)),child: Center(child: Text('Greens', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),),),),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 11.5 / 25,
                    height: MediaQuery.of(context).size.height * 1 / 8,
                    decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent,
                        borderRadius: BorderRadius.circular(8)),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1615205349253-9694e5d9654b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1351&q=80',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(width: 60, height: 30, decoration: BoxDecoration(color: Colors.black.withOpacity(.5), borderRadius: BorderRadius.circular(10)),child: Center(child: Text('Meat', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),),),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder(
                future: productRepository.fetchTopProducts(),
                builder: (context, AsyncSnapshot<List<Product>> snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: snapshot.data!.map(
                          (e) {
                            return productCard(
                              context,
                              e,
                            );
                          },
                        ).toList(),
                      ),
                    );
                },
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 20,
              height: MediaQuery.of(context).size.height / 20,
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(.75),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'Free shipping on orders worth Rs. 300 or above',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder(
                future: productRepository.fetchTopProducts(),
                builder: (context, AsyncSnapshot<List<Product>> snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: snapshot.data!.map(
                          (e) {
                            return productCard(
                              context,e,
                            );
                          },
                        ).toList(),
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
