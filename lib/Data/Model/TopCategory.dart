class TopCategory {
  String categoryName;
  String categoryImageURL;
  String categoryNavPath;

  TopCategory(
      {required this.categoryName,
      required this.categoryImageURL,
      required this.categoryNavPath});
}

TopCategory topCategoryOne = TopCategory(
    categoryName: 'Greens',
    categoryImageURL:
        'https://images.unsplash.com/photo-1573246123716-6b1782bfc499?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1260&q=80',
    categoryNavPath: 'greenCategoryScreen');
TopCategory topCategoryTwo = TopCategory(
    categoryName: 'Meat',
    categoryImageURL:
        'https://images.unsplash.com/photo-1615205349253-9694e5d9654b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1351&q=80',
    categoryNavPath: 'meatCategoryScreen');

List<TopCategory> topCategoryData = [topCategoryOne, topCategoryTwo];
