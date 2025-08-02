import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage() // If you're using auto_route, this annotation generates a route for ConfigScreen.
class ConfigScreen extends StatelessWidget {
  const ConfigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // This is the parent widget (similar to ConfigCafeScreen in your example).
    // It can provide dependencies (e.g., BlocProvider) if needed, or remain simple.
    return const ConfigScreenView();
  }
}

class ConfigScreenView extends StatelessWidget {
  const ConfigScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    // Example of using MediaQuery for screen size
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuration'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.02),
              const Text(
                'Configuration Screen',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Device IMIN - Cashier',
                  hintText: 'e.g. 01, 02, 03',
                ),
              ),
              SizedBox(height: size.height * 0.03),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Branch',
                  hintText: 'e.g. KOJA',
                ),
              ),
              SizedBox(height: size.height * 0.03),
              ElevatedButton.icon(
                icon: const Icon(Icons.wifi),
                label: const Text('Test Connection'),
                onPressed: () {
                  // Put your "Test Connection" logic here
                  debugPrint("Testing connection...");
                },
              ),
              SizedBox(height: size.height * 0.05),
              ElevatedButton.icon(
                icon: const Icon(Icons.check),
                label: const Text('Config'),
                onPressed: () {
                  // Put your config submission logic here
                  debugPrint("Submitting configuration...");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
