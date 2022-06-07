import 'package:flutter/material.dart';

class CustomInputWidget extends StatelessWidget {
  final IconData icon;
  final String placeholder;
  final double height;
  final double width;
  const CustomInputWidget(
      {Key? key,
      required this.icon,
      required this.placeholder,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.centerLeft,
          children: [
            Padding(
              padding: EdgeInsets.only(left: (width * 0.05)),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: Theme.of(context).primaryColor,
                      style: BorderStyle.solid,
                      width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.only(left: 35),
                height: 40,
                width: (width * 0.85),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: placeholder,
                    border: InputBorder.none,
                  ),
                  /* validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Insira o usuário'),
                                duration: Duration(milliseconds: 500)));
                        return 'usuário inválido';
                      }
                      return null;
                    },
                    controller: _userCtrl), */
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                    color: Theme.of(context).primaryColor,
                    style: BorderStyle.solid,
                    width: 1),
              ),
              width: 45,
              height: 45,
              child: Icon(icon, color: Colors.black),
            )
          ],
        )
      ],
    );
  }
}
