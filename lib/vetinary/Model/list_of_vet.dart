import 'package:flutter/material.dart';
import 'package:petsrology/vetinary/Model/doctor.dart';
import 'package:petsrology/vetinary/screens/veterinary_screen.dart';

class ListOfDoctor extends StatelessWidget {
  final Doctor doctor;
  const ListOfDoctor({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    // Get available width to make widget responsive
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 360;
    
    // Extract the name without "Dr." prefix if it exists
    String displayName = doctor.name;
    if (displayName.startsWith("Dr. ")) {
      displayName = displayName.substring(4); // Remove "Dr. " prefix
    } else if (displayName.startsWith("Dr.")) {
      displayName = displayName.substring(3); // Remove "Dr." prefix
    }
    
    return Container(
      padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Avatar with responsive size
          CircleAvatar(
            radius: isSmallScreen ? 40 : 45,
            backgroundColor: Color(doctor.color),
            backgroundImage: NetworkImage(doctor.image),
          ),
          const SizedBox(height: 16),
          
          // Doctor name without repeating "Dr." prefix
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Dr. ",
                style: TextStyle(
                  fontSize: isSmallScreen ? 16 : 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Flexible(
                child: Text(
                  displayName,
                  style: TextStyle(
                    fontSize: isSmallScreen ? 16 : 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          
          // Specialist with overflow handling
          Text(
            doctor.specialist,
            style: TextStyle(
              fontSize: isSmallScreen ? 13 : 14,
              color: Colors.black45,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}