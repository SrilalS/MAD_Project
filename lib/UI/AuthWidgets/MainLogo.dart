import 'package:flutter/material.dart';

Card mainLogo(){
  return Card(
    color: Colors.blue.shade700,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    elevation: 8,
    child: Container(
      padding: const EdgeInsets.all(32),
      child: Text('C+', style: TextStyle(color: Colors.white, fontSize: 64, fontWeight: FontWeight.bold)),
    ),
  );
}