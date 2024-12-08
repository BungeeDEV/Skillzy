import 'package:flutter/material.dart';
import 'package:skillzy/core/configs/theme/app_colors.dart';

class LearningPathPage extends StatelessWidget {
  const LearningPathPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.darkBackground,
            floating: true,
            title: Row(
              children: [
                Text(
                  'Web Dev',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 18,
                  ),
                ),
                const Icon(Icons.keyboard_arrow_down, color: Colors.white70),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.star, color: Colors.white, size: 16),
                      SizedBox(width: 4),
                      Text(
                        '340',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'HTML Basics',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: CustomPaint(
                      size: Size.infinite,
                      painter: SkillTreePainter(),
                      child: Stack(
                        children: [
                          _buildSkillNode(
                            top: 0,
                            left: 140,
                            color: Colors.purple.shade300,
                            isCompleted: true,
                            label: 'HTML Basics',
                          ),
                          _buildSkillNode(
                            top: 100,
                            left: 80,
                            color: Colors.purple.shade300,
                            isCompleted: true,
                            label: 'Tags',
                          ),
                          _buildSkillNode(
                            top: 100,
                            left: 200,
                            color: Colors.purple.shade300,
                            isCompleted: true,
                            label: 'Attributes',
                          ),
                          _buildSkillNode(
                            top: 200,
                            left: 140,
                            color: Colors.amber,
                            isCompleted: false,
                            label: 'Forms',
                          ),
                          _buildSkillNode(
                            top: 300,
                            left: 140,
                            color: Colors.grey.shade800,
                            isCompleted: false,
                            label: 'Advanced',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillNode({
    required double top,
    required double left,
    required Color color,
    required bool isCompleted,
    required String label,
  }) {
    return Positioned(
      top: top,
      left: left,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.3),
                  blurRadius: 12,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Icon(
              isCompleted ? Icons.check : Icons.play_arrow,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }


}

class SkillTreePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.purple.shade300.withOpacity(0.3)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    // Draw connecting lines
    final path = Path()
      ..moveTo(170, 60) // Start from first node
      ..lineTo(110, 100) // To second node
      ..moveTo(170, 60)
      ..lineTo(230, 100) // To third node
      ..moveTo(170, 160)
      ..lineTo(170, 200) // To fourth node
      ..moveTo(170, 260)
      ..lineTo(170, 300); // To fifth node

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

