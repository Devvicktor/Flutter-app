import 'package:flutter/material.dart';

class BuildButtomColumn extends StatelessWidget {
  const BuildButtomColumn({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildButtonColumn(context, Icons.call, 'CALL'),
        _buildButtonColumn(context, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(context, Icons.share, 'SHARE'),
      ],
    );
  }

  Widget _buildButtonColumn(BuildContext context, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: Colors.blue),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  
}