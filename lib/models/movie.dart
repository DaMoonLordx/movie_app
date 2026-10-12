class Movie {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String duration;
  final double rating;
  final String category;

  Movie({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.duration,
    required this.rating,
    required this.category,
  });
}

final List<Movie> mockMovies = [
  Movie(
    id: '1',
    title: 'El Viaje Estelar',
    description: 'Un grupo de astronautas viaja a través de un agujero de gusano en busca de un nuevo hogar para la humanidad.',
    imageUrl: 'https://images.unsplash.com/photo-1534447677768-be436bb09401?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=60',
    duration: '169 min',
    rating: 8.6,
    category: 'Ciencia Ficción',
  ),
  Movie(
    id: '2',
    title: 'Misterio en la Niebla',
    description: 'Un detective retirado vuelve al ruedo para resolver un extraño caso en un pueblo donde el sol nunca brilla.',
    imageUrl: 'https://images.unsplash.com/photo-1485846234645-a62644f84728?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=60',
    duration: '112 min',
    rating: 7.8,
    category: 'Misterio',
  ),
  Movie(
    id: '3',
    title: 'Aventura Selvática',
    description: 'Una emocionante búsqueda del tesoro en las profundidades del Amazonas lleno de peligros y trampas antiguas.',
    imageUrl: 'https://images.unsplash.com/photo-1536440136628-849c177e76a1?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=60',
    duration: '120 min',
    rating: 6.9,
    category: 'Aventura',
  ),
  Movie(
    id: '4',
    title: 'Agente SecretoX',
    description: 'Un espía internacional debe detener un ataque global antes de que sea demasiado tarde.',
    imageUrl: 'https://images.unsplash.com/photo-1509281373149-e957c6296406?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=60',
    duration: '135 min',
    rating: 8.1,
    category: 'Acción',
  ),
];
