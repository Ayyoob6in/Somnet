import 'package:flutter/material.dart';

class CreateTicketProvider with ChangeNotifier {
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String? selectedLocation;
  String? selectedService;

  void updateLocation(String? location) {
    selectedLocation = location;
    notifyListeners();
  }

  void updateService(String? service) {
    selectedService = service;
    notifyListeners();
  }

  void submitTicket() {
    // Add logic to submit the ticket
    print('Submitting ticket with subject: ${subjectController.text}');
    print('Description: ${descriptionController.text}');
    print('Location: $selectedLocation');
    print('Service: $selectedService');
  }

  void clearForm() {
    subjectController.clear();
    descriptionController.clear();
    selectedLocation = null;
    selectedService = null;
    notifyListeners();
  }
}
