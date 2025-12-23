import 'package:club_hub/Widgets/full_screen_image.dart';
import 'package:club_hub/models/club.dart';
import 'package:club_hub/models/post.dart';
import 'package:flutter/material.dart';

Widget buildPost(BuildContext context, Club club, Post post) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    decoration: BoxDecoration(
      color: Color(0xFF0A1A3A),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.white.withValues(alpha: 0.1), width: 1),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header (Club info and time)
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  club.logoUrl!,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    club.name,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    post.createdAt,
                    style: TextStyle(fontSize: 13, color: Colors.grey[500]),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Content
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            post.content,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[300],
              height: 1.4,
            ),
          ),
        ),

        // Media
        if (post.mediaUrl != null) ...[
          SizedBox(height: 12),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      FullScreenImage(imageUrl: post.mediaUrl!),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(8),
              child: Image.asset(
                post.mediaUrl!,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ],
    ),
  );
}
