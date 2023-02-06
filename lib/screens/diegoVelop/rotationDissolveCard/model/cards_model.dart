class Card3D {

  const Card3D( {required this.title, required this.author, required this.image} );

  final String title;
  final String author;
  final String image;
}

final cardList = [
  const Card3D(title: "yuuuu", author: "john cena", image: "https://picsum.photos/200"),
  const Card3D(title: "yaa", author: "john pappa", image: "https://www.pgbevande.com/wp-content/uploads/2016/11/liquori-cherry-stock-pgbevande-300x300.jpg"),
  const Card3D(title: "ee", author: "john puppa", image: "https://www.veccia.it/veccia/wp-content/uploads/2021/09/25397b1010142-cartier-la-dona-de-cartier-reference-cartier-2905-300x300.jpg"),
  const Card3D(title: "ohhh", author: "john pezza", image: "https://c8.alamy.com/comp/KW2RK5/ypiranga-fc-frederico-westphalen-300x300-KW2RK5.jpg"),
];
