import 'package:flutter/material.dart';
import 'package:flutter_detalhe/data/category.dart';

class Ticket {
  final int id;
  final String title;
  final String body;
  final Category category;

  Ticket(this.id, this.title, this.body, this.category);
}