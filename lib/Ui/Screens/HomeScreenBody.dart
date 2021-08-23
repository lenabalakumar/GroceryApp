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
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopCategoryScreen(),
              Padding(
                padding: const EdgeInsets.only(
                    top: 24.0, left: 8.0, right: 8.0, bottom: 8.0),
                child: Text(
                  'Top Vegetables'.toUpperCase(),
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                ),
              ),
              TopVegetables(),
              Container(
                width: MediaQuery.of(context).size.width - 20,
                height: MediaQuery.of(context).size.height / 20,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Free delivery on orders worth Rs. 300 or above',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 24.0, left: 8.0, right: 8.0, bottom: 8.0),
                child: Text(
                  'Top Fruits'.toUpperCase(),
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                ),
              ),
              TopFruits(),
            ],
          ),
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

class TopVegetables extends StatelessWidget {
  const TopVegetables({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductRepository productRepository = new ProductRepository();
    return FutureBuilder(
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
    );
  }
}

class TopFruits extends StatelessWidget {
  const TopFruits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductRepository productRepository = new ProductRepository();
    return FutureBuilder(
      future: productRepository.fetchTopFruits(),
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
    );
  }
}
