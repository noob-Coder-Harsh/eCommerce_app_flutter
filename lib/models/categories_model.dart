class Category {
  final String title;
  final String image;

  Category({
    required this.title,
    required this.image,
  });
}

final List<Category> categoriesList = [
  Category(
    title: "All",
    image: "assets/all.png",
  ),
  Category(
    title: "Shoes",
    image: "assets/shoes.png",
  ),
  Category(
    title: "Beauty",
    image: "assets/beauty.png",
  ),
  Category(
    title: "Women's\nFashion",
    image: "assets/image1.png",
  ),
  Category(
    title: "Jewelry",
    image: "assets/jewelry.png",
  ),
  Category(
    title: "Men's\nFashion",
    image: "assets/men.png",
  ),
];
