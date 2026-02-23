import 'package:flutter/material.dart';
// --- PÁGINA 2 ---
class PaginaDos extends StatelessWidget {
  const PaginaDos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Segunda Página", style: TextStyle(color: Colors.white)),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.grey, Colors.black87],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                'https://www.ryl.mx/cdn/shop/files/estudio-fotografico-moda-escritorio.jpg?v=1760982784&width=2000',
                height: 200,
                width: 300,
                fit: BoxFit.cover, // Ensure the image covers the area
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child; // Image is fully loaded, show it
                  }
                  return SizedBox( // Use SizedBox to prevent layout shift if image dimensions are unknown
                    height: 200,
                    width: 300, // Assuming a width to maintain aspect ratio with height 200 based on the URL
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                            : null, // Show progress if available, otherwise indeterminate
                      ),
                    ),
                  );
                },
                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                  // If there's an error loading the image, display an error icon.
                  return Container(
                    height: 200, // Maintain the same height as the image
                    width: 300, // Maintain the same width
                    color: Colors.grey[200], // A light background for the error
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.broken_image, color: Colors.red, size: 40),
                          SizedBox(height: 8),
                          Text("Error al cargar imagen", style: TextStyle(color: Colors.red)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF607D8B), // Azul Grisáceo (BlueGrey)
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              onPressed: () => Navigator.pushNamed(context, '/tercera'),
              child: const Text("Ir a la Tercera Página", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}