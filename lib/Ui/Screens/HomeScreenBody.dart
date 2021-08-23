import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceryapp/Data/Model/Product.dart';
import 'package:groceryapp/Data/Model/TopCategory.dart';
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
              child: TopCategoryScreen(),
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
          ],
        ),
      ),
    );
  }
}

class TopCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: topCategoryData.map((topCategory) {
        return topCategoryWidget(context, topCategory);
      }).toList(),
    );
  }
}

Widget topCategoryWidget(BuildContext context, TopCategory topCategory) {
  return InkWell(
    onTap: () =>
        Navigator.of(context).pushNamed('/${topCategory.categoryNavPath}'),
    child: Container(
      width: MediaQuery.of(context).size.width * 11.5 / 25,
      height: MediaQuery.of(context).size.height * 1 / 8,
      decoration: BoxDecoration(
        color: Colors.deepOrangeAccent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              topCategory.categoryImageURL,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 60,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                topCategory.categoryName,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
