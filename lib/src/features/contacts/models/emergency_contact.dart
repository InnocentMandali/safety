class EmergencyContact {
  final String id;
  final String name;
  final String phoneNumber;
  final String relationship;

  EmergencyContact({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.relationship,
  });

  factory EmergencyContact.fromMap(Map<String, dynamic> map, String id) {
    return EmergencyContact(
      id: id,
      name: map['name'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      relationship: map['relationship'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'relationship': relationship,
    };
  }
}
