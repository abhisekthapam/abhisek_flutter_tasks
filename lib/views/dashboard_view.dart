import 'package:flutter/material.dart';
import 'simple_interest_view.dart';
import 'area_of_circle_view.dart';
import 'arithmetic_view.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildWelcomeSection(),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildNavigationCard(
                    context: context,
                    icon: Icons.calculate,
                    label: 'Simple Interest',
                    onTap: () {
                      _navigateToScreen(
                        context,
                        const SimpleInterestView(),
                      );
                    },
                  ),
                  _buildNavigationCard(
                    context: context,
                    icon: Icons.circle,
                    label: 'Area of Circle',
                    onTap: () {
                      _navigateToScreen(
                        context,
                        const AreaOfCircleView(),
                      );
                    },
                  ),
                  _buildNavigationCard(
                    context: context,
                    icon: Icons.functions,
                    label: 'Arithmetic Operations',
                    onTap: () {
                      _navigateToScreen(
                        context,
                        const ArithmeticView(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return Card(
      color: Colors.black87,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              'Welcome to the Dashboard!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              'Select an option below to get started.',
              style: TextStyle(fontSize: 16, color: Colors.white70),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationCard({
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.black),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text(
              'Dashboard',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.black,
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
          ),
          body: screen,
        ),
      ),
    );
  }
}
