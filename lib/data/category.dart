import 'package:flutter/material.dart';

class Category {
  final String title;
  final Color color;
  final IconData icon;

  Category(this.title, this.color, this.icon);

  Icon getIcon(){
    return Icon(icon, color: color, size: 26,);
  }
}