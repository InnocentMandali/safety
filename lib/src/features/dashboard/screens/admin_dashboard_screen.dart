
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emergen_sync/src/features/alerts/models/alert_model.dart';
import 'package:emergen_sync/src/features/alerts/services/alert_service.dart';
import 'package:url_launcher/url_launcher.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AlertService alertService = AlertService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('alerts').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No alerts found.'));
          }

          final alerts = snapshot.data!.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return Alert(
              id: doc.id,
              userId: data['userId'],
              timestamp: data['timestamp'],
              location: data['location'],
            );
          }).toList();

          return ListView.builder(
            itemCount: alerts.length,
            itemBuilder: (context, index) {
              final alert = alerts[index];
              return ListTile(
                title: Text('User ID: ${alert.userId}'),
                subtitle: Text('Timestamp: ${alert.timestamp.toDate()}'),
                trailing: IconButton(
                  icon: const Icon(Icons.location_on),
                  onPressed: () => _launchMaps(alert.location.latitude, alert.location.longitude),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _launchMaps(double latitude, double longitude) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
