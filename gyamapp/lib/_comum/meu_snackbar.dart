import 'package:flutter/material.dart';

mostrarSnackBar(
    {required BuildContext context,
    required String texto,
    bool isError = true}) {
  SnackBar snackBar = SnackBar(
    content: Text(texto),
    backgroundColor: (isError) ? Colors.red : Colors.green,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
    action: SnackBarAction(
      label: "Ok",
      textColor: Colors.white,
      onPressed: () => {},
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
