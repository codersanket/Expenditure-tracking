class CategoriesModel {
  final String image;
  final String title;
  final int color;

  CategoriesModel({this.image, this.title, this.color});
}

List<CategoriesModel> categories = [
  CategoriesModel(
      image: "assets/logos/light.png", title: "Electricity", color: 0xffFEF6E1),
  CategoriesModel(
      image: "assets/logos/house.png", title: "Home", color: 0xffE6EFFF),
  CategoriesModel(
      image: "assets/logos/avocado.png",
      title: "Food & Drink",
      color: 0xffE2F6F3),
  CategoriesModel(
      image: "assets/logos/entertainment.png",
      title: "Entertainement",
      color: 0xffFDECE8),
  CategoriesModel(
      image: "assets/logos/car.png", title: "Travel", color: 0xffFDECE8),
  CategoriesModel(
      image: "assets/logos/others.png", title: "Travel", color: 0xffFDECE8),
];
