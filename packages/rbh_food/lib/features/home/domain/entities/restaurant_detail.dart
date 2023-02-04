import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Restaurant extends Equatable {
  const Restaurant({
    required this.id,
    required this.name,
    this.description,
    this.imageUrl,
    this.distance,
    this.rating,
    required this.categoryMenus,
  });

  final int id;
  final String name;
  final String? description;
  final String? imageUrl;
  final String? distance;
  final double? rating;
  final List<String> categoryMenus;

  @override
  List<Object?> get props => [];
}