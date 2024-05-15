import 'package:flutter/material.dart';
import 'package:gyamapp/_comum/minhas_cores.dart';

InputDecoration getAutenticationInputDecoraton(String label){
  return InputDecoration(
    hintText: label,
    fillColor: const Color.fromARGB(255, 255, 255, 255),
    filled: true,
    contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32), borderSide: BorderSide(color: Colors.black, width: 2)),
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32), borderSide: BorderSide(color: MinhasCores.azulTopoGradiente, width: 4)),
    errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32), borderSide: const BorderSide(color: Colors.red))
  );
}