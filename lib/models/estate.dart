class Estate {
  final int id;
  final String image;
  final String price;
  final String description;
  Estate({
    required this.id,
    required this.image,
    required this.price,
    required this.description,
  });
}

final properties = [
  Estate(
    id: 1,
    image: 'assets/images/img1.png',
    price: 'IDR. 9000.000.000',
    description: '4 rooms . 132 m2 . 2 floot',
  ),
  Estate(
    id: 2,
    image: 'assets/images/img2.png',
    price: 'IDR. 9000.000.000',
    description: '4 rooms . 132 m2 . 2 floot',
  ),
  Estate(
    id: 3,
    image: 'assets/images/img3.png',
    price: 'IDR. 9000.000.000',
    description: '4 rooms . 132 m2 . 2 floot',
  ),
  Estate(
    id: 4,
    image: 'assets/images/img4.png',
    price: 'IDR. 9000.000.000',
    description: '4 rooms . 132 m2 . 2 floot',
  ),
  Estate(
    id: 5,
    image: 'assets/images/img5.png',
    price: 'IDR. 9000.000.000',
    description: '4 rooms . 132 m2 . 2 floot',
  ),
];
