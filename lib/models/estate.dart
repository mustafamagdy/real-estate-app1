class Estate {
  final int id;
  final String name;
  final String image;
  final String price;
  final String description;
  final double rating;
  Estate({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.rating,
  });
}

final categories = {
  'Resort': 'assets/images/img1.png',
  'Cotage': 'assets/images/img2.png',
  'Office': 'assets/images/img3.png',
  'Urban': 'assets/images/img4.png',
};

final properties = [
  Estate(
    id: 1,
    name: 'Property Name',
    image: 'assets/images/img1.png',
    price: 'IDR. 9000.000.000',
    description: '4 rooms . 132 m2 . 2 floot',
    rating: 4.3,
  ),
  Estate(
    id: 2,
    name: 'Property Name',
    image: 'assets/images/img2.png',
    price: 'IDR. 9000.000.000',
    description: '4 rooms . 132 m2 . 2 floot',
    rating: 4.3,
  ),
  Estate(
    id: 3,
    name: 'Property Name',
    image: 'assets/images/img3.png',
    price: 'IDR. 9000.000.000',
    description: '4 rooms . 132 m2 . 2 floot',
    rating: 4.3,
  ),
  Estate(
    id: 4,
    name: 'Property Name',
    image: 'assets/images/img4.png',
    price: 'IDR. 9000.000.000',
    description: '4 rooms . 132 m2 . 2 floot',
    rating: 4.3,
  ),
  Estate(
    id: 5,
    name: 'Property Name',
    image: 'assets/images/img5.png',
    price: 'IDR. 9000.000.000',
    description: '4 rooms . 132 m2 . 2 floot',
    rating: 4.3,
  ),
];
