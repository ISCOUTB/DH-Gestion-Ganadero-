import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconBackgroundColor;
  final IconData warningIcon;
  final Color warningIconColor;
  final String imageUrl;
  final VoidCallback onTap;

  const CustomCard({
    Key? key,
    required this.color,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconBackgroundColor,
    required this.warningIcon,
    required this.warningIconColor,
    required this.imageUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: color,
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: iconBackgroundColor,
                    child: Icon(icon, color: Colors.white),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        Text(subtitle),
                      ],
                    ),
                  ),
                  Icon(warningIcon, color: warningIconColor),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
