import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool started = false;
  bool searching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F5FF),

      // TOP BAR
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF6750A4),
        foregroundColor: Colors.white,

        title: searching
            ? TextField(
                autofocus: true,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: const InputDecoration(
                  hintText: "Search lessons...",
                  hintStyle: TextStyle(
                    color: Colors.white70,
                  ),
                  border: InputBorder.none,
                ),
              )
            : Text(
                "Learn Flutter",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),

        actions: [
          IconButton(
            icon: Icon(
              searching ? Icons.close : Icons.search,
            ),
            onPressed: () {
              setState(() {
                searching = !searching;
              });
            },
          ),
        ],
      ),

      // PAGE CONTENT
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // WELCOME SECTION
              Text(
                "Hello, Learner! 👋",
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF29235C),
                ),
              ),

              const SizedBox(height: 6),

              Text(
                "Ready to build something amazing?",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),

              const SizedBox(height: 25),

              // MAIN CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF6750A4),
                      Color(0xFF8E7CC3),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple.withOpacity(0.20),
                      blurRadius: 15,
                      offset: const Offset(0, 7),
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.code,
                      color: Colors.white,
                      size: 42,
                    ),

                    const SizedBox(height: 15),

                    Text(
                      "Flutter Fundamentals",
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      started
                          ? "You're ready to start learning! 🚀"
                          : "Learn the basics of Flutter and start creating beautiful mobile apps.",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white70,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // START BUTTON
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            started = true;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF6750A4),
                          padding: const EdgeInsets.symmetric(
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          started
                              ? "Learning Started ✓"
                              : "Start Learning",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // SECTION TITLE
              Text(
                "Explore Topics",
                style: GoogleFonts.poppins(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF29235C),
                ),
              ),

              const SizedBox(height: 15),

              // TOPIC CARDS
              Row(
                children: [
                  Expanded(
                    child: _topicCard(
                      icon: Icons.widgets_outlined,
                      title: "Widgets",
                      subtitle: "Build UI",
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: _topicCard(
                      icon: Icons.palette_outlined,
                      title: "Design",
                      subtitle: "Create styles",
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              Row(
                children: [
                  Expanded(
                    child: _topicCard(
                      icon: Icons.code_outlined,
                      title: "Dart",
                      subtitle: "Learn coding",
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: _topicCard(
                      icon: Icons.phone_android,
                      title: "Apps",
                      subtitle: "Build projects",
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // MOTIVATION SECTION
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: const Color(0xFFE4DDF5),
                  ),
                ),

                child: Row(
                  children: [
                    const Icon(
                      Icons.lightbulb_outline,
                      color: Color(0xFFFFA000),
                      size: 32,
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: Text(
                        "Keep practicing. Every app you build makes you a better developer!",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Colors.grey[700],
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // TOPIC CARD FUNCTION
  Widget _topicCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFF0EBFF),
              borderRadius: BorderRadius.circular(12),
            ),

            child: Icon(
              icon,
              color: const Color(0xFF6750A4),
              size: 26,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF29235C),
            ),
          ),

          const SizedBox(height: 3),

          Text(
            subtitle,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}