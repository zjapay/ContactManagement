import 'dart:io';
import 'package:riverpod/riverpod.dart';

void main() {
  final container = ProviderContainer();
  final contactService = container.read(contactServiceProvider);

  while (true) {
    print('Contact Management System');
    print('1. Add Contact');
    print('2. List Contacts');
    print('3. Update Contact');
    print('4. Exit');
    print('Choose an option: ');

    final choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        _addContact(contactService);
        break;
      case '2':
        _listContacts(contactService);
        break;
      case '3':
        _updateContact(contactService);
        break;
      case '4':
        exit(0);
      default:
        print('Invalid choice. Please try again.');
    }
  }
}

void _addContact(ContactService contactService) {
  print('Enter contact name: ');
  final name = stdin.readLineSync()!;
  print('Enter contact phone number: ');
  final phoneNumber = stdin.readLineSync()!;
  print('Enter contact email: ');
  final email = stdin.readLineSync()!;
  
  contactService.addContact(name, phoneNumber, email);
  print('Contact added successfully.');
}

void _listContacts(ContactService contactService) {
  final contacts = contactService.getContacts();
  if (contacts.isEmpty) {
    print('No contacts available.');
    return;
  }
  for (var contact in contacts) {
    print('ID: ${contact.id}');
    print('Name: ${contact.name}');
    print('Phone Number: ${contact.phoneNumber}');
    print('Email: ${contact.email}');
    print('---');
  }
}

void _updateContact(ContactService contactService) {
  print('Enter contact ID to update: ');
  final id = stdin.readLineSync()!;
  print('Enter new name (leave blank to keep unchanged): ');
  final name = stdin.readLineSync();
  print('Enter new phone number (leave blank to keep unchanged): ');
  final phoneNumber = stdin.readLineSync();
  print('Enter new email (leave blank to keep unchanged): ');
  final email = stdin.readLineSync();

  contactService.updateContact(id, name: name, phoneNumber: phoneNumber, email: email);
  print('Contact updated successfully.');
}
