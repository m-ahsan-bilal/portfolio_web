import 'package:ahsan_dev/model/project_model.dart';
import 'package:ahsan_dev/widgets/container_project.dart';
import 'package:flutter/material.dart';

class ProjectRowWidget extends StatelessWidget {
  final Project project;

  const ProjectRowWidget({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Project Info Container
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          width: screenWidth * 0.25,
          height: screenHeight * 0.30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10, // Replace sqrt1_2 with a proper value
              ),
              Text(
                project.title,
                style: TextStyle(
                  fontSize: screenWidth * 0.018,
                  fontWeight: FontWeight.bold,
                ),
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                project.description,
                style: TextStyle(fontSize: screenWidth * 0.012),
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),

        // Project Images
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: project.images.map((imagePath) {
                return ContainerProject(
                  imagePath: imagePath,
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
