import 'package:flutter/material.dart';
import '../models/movie.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> displayedMovies = [];
  String searchQuery = '';
  String selectedCategory = 'Todas';
  
  final List<String> categories = ['Todas', 'Acción', 'Ciencia Ficción', 'Misterio', 'Aventura'];

  @override
  void initState() {
    super.initState();
    displayedMovies = mockMovies;
  }

  void _filterMovies() {
    setState(() {
      displayedMovies = mockMovies.where((movie) {
        final matchesSearch = movie.title.toLowerCase().contains(searchQuery.toLowerCase());
        final matchesCategory = selectedCategory == 'Todas' || movie.category == selectedCategory;
        return matchesSearch && matchesCategory;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cartelera'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                searchQuery = value;
                _filterMovies();
              },
              decoration: InputDecoration(
                hintText: 'Buscar películas...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: categories.map((category) {
                final isSelected = selectedCategory == category;
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ChoiceChip(
                    label: Text(
                      category,
                      style: TextStyle(color: isSelected ? Colors.white : Colors.black),
                    ),
                    selected: isSelected,
                    selectedColor: Colors.indigo,
                    backgroundColor: Colors.grey[200],
                    onSelected: (selected) {
                      if (selected) {
                        selectedCategory = category;
                        _filterMovies();
                      }
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: displayedMovies.isEmpty
                ? const Center(child: Text('No se encontraron películas.'))
                : ListView.builder(
                    itemCount: displayedMovies.length,
                    itemBuilder: (context, index) {
                      final movie = displayedMovies[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(movie: movie),
                            ),
                          );
                        },
                        child: Card(
                          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          elevation: 4,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            children: [
                              Hero(
                                tag: 'movie_image_${movie.id}',
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                  ),
                                  child: Image.network(
                                    movie.imageUrl,
                                    width: 100,
                                    height: 140,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        movie.title,
                                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        movie.category,
                                        style: TextStyle(color: Colors.indigo[300], fontWeight: FontWeight.w600, fontSize: 12),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        movie.description,
                                        style: TextStyle(color: Colors.grey[600]),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
