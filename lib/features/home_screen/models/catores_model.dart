// To parse this JSON data, do
//
//     final cateogres = cateogresFromJson(jsonString);

import 'dart:convert';

List<String> cateogresFromJson( str) => List<String>.from(str. map((x) => x)); 

