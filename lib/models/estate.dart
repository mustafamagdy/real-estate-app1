class Estate {
  final int id;
  final String name;
  final String mainImage;
  final List<String> images;
  final String price;
  final String description;
  final String longDescription;
  final double rating;
  Estate({
    required this.id,
    required this.name,
    required this.mainImage,
    required this.images,
    required this.price,
    required this.description,
    required this.longDescription,
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
    mainImage: 'assets/images/img1.png',
    images: [
      'assets/images/img1.png',
      'assets/images/img2.png',
      'assets/images/img3.png'
    ],
    price: 'IDR. 9000.000.000',
    description: '4 rooms . 132 m2 . 2 floot',
    longDescription:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
    rating: 4.3,
  ),
  Estate(
    id: 2,
    name: 'Property Name',
    mainImage: 'assets/images/img2.png',
    images: [
      'assets/images/img2.png',
      'assets/images/img2.png',
      'assets/images/img3.png'
    ],
    price: 'IDR. 9000.000.000',
    description: '4 rooms . 132 m2 . 2 floot',
    longDescription:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
    rating: 4.3,
  ),
  Estate(
    id: 3,
    name: 'Property Name',
    mainImage: 'assets/images/img3.png',
    images: [
      'assets/images/img3.png',
      'assets/images/img2.png',
      'assets/images/img3.png'
    ],
    price: 'IDR. 9000.000.000',
    description: '4 rooms . 132 m2 . 2 floot',
    longDescription:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
    rating: 4.3,
  ),
  Estate(
    id: 4,
    name: 'Property Name',
    mainImage: 'assets/images/img4.png',
    images: [
      'assets/images/img4.png',
      'assets/images/img2.png',
      'assets/images/img3.png'
    ],
    price: 'IDR. 9000.000.000',
    description: '4 rooms . 132 m2 . 2 floot',
    longDescription:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
    rating: 4.3,
  ),
  Estate(
    id: 5,
    name: 'Property Name',
    mainImage: 'assets/images/img5.png',
    images: [
      'assets/images/img5.png',
      'assets/images/img2.png',
      'assets/images/img3.png'
    ],
    price: 'IDR. 9000.000.000',
    description: '4 rooms . 132 m2 . 2 floot',
    longDescription:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
    rating: 4.3,
  ),
];
