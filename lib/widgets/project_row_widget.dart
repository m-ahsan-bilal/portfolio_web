import 'package:ahsan_dev/model/project_model.dart';
import 'package:ahsan_dev/widgets/container_project.dart';
import 'package:flutter/material.dart';

class ProjectRowWidget extends StatelessWidget {
  final Project project;

  const ProjectRowWidget({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;

        // breakpints
        if (screenWidth >= 1200) {
          // 1 Container + 4 Images
          return _buildLayout(project, infoFlex: 1, imageFlex: 4);
        } else if (screenWidth >= 993) {
          // Container + 3 Images in first row, 1 in second row
          return _buildLayout(project, infoFlex: 1, imageFlex: 3);
        } else if (screenWidth >= 768) {
          // 1 Container + 2 Images in first row, remaining in next rows
          return _buildLayout(project, infoFlex: 1, imageFlex: 2);
        } else if (screenWidth >= 575) {
          // 1 Container + 1 Image per row
          return _buildLayout(project, infoFlex: 1, imageFlex: 1);
        } else {
          // 1 Container + Grid View for Images (2x2)
          return _buildSmallScreenLayout(project);
        }
      },
    );
  }

  // General Layout
  Widget _buildLayout(Project project,
      {required int infoFlex, required int imageFlex}) {
    final images = project.images;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row for Info Container + Images
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Info Container
              Expanded(
                flex: infoFlex,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        project.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        project.description,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Images in the same row
              Expanded(
                flex: imageFlex,
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: images.take(imageFlex).map((imagePath) {
                    return ContainerProject(
                      imagePath: imagePath,
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          // Remaining Images in subsequent rows
          if (images.length > imageFlex)
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: images.skip(imageFlex).map((imagePath) {
                return ContainerProject(
                  imagePath: imagePath,
                );
              }).toList(),
            ),
        ],
      ),
    );
  }

  // Small Screen Layout (<575px)
  Widget _buildSmallScreenLayout(Project project) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Info Container
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  project.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  project.description,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          // Grid View for Images (2x2)
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
            ),
            itemCount: project.images.length,
            itemBuilder: (context, index) {
              return ContainerProject(
                imagePath: project.images[index],
              );
            },
          ),
        ],
      ),
    );
  }
}
