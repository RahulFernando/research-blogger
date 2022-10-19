import 'package:flutter/material.dart';

Container reusableAuthButton(BuildContext context, String label, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
    ),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.black26;
          }
          return Colors.white;
        }),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    ),
  );
}
