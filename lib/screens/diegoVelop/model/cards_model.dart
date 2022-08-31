class Card3D {

  const Card3D( {required this.title, required this.author, required this.image} );

  final String title;
  final String author;
  final String image;
}

final cardList = [
  const Card3D(title: "yuuuu", author: "john cena", image: "https://picsum.photos/200"),
  const Card3D(title: "yaa", author: "john pappa", image: "https://picsum.photos/200"),
  const Card3D(title: "ee", author: "john puppa", image: "https://picsum.photos/200"),
  const Card3D(title: "ohhh", author: "john pezza", image: "https://picsum.photos/200"),
];
