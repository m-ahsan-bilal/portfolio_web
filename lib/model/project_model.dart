class Project {
  final String title;
  final String description;
  final List<String> images;

  Project({
    required this.title,
    required this.description,
    required this.images,
  });

  static final List<Project> projects = [
    Project(
      title: 'Mobile App 1',
      description: 'A powerful mobile app for shopping, built with Flutter.',
      images: [
        'assets/model/image.jpg',
        'assets/model/image.jpg',
        'assets/model/image.jpg',
        'assets/model/image.jpg',
      ],
    ),
    Project(
      title: 'Web App 1',
      description: 'A responsive web application for business, using React.',
      images: [
        'assets/model/image2.png',
        'assets/model/image2.png',
        'assets/model/image2.png',
      ],
    ),
    Project(
      title: 'E-commerce Website',
      description:
          'A feature-rich e-commerce  clothing website built with Flutter.',
      images: [
        'assets/model/image2.png',
        'assets/model/image2.png',
        'assets/model/image2.png',
        'assets/model/image2.png',
      ],
    ),
    Project(
      title: 'Portfolio Website',
      description: 'A personal portfolio website built using Flutter and Dart.',
      images: [
        'assets/model/image.jpg',
        'assets/model/image.jpg',
      ],
    ),
  ];
}
