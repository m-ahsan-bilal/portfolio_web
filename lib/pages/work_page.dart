import 'package:ahsan_dev/model/project_model.dart';
import 'package:ahsan_dev/widgets/contact_me_button.dart';
import 'package:ahsan_dev/widgets/custom_button.dart';
import 'package:ahsan_dev/widgets/footer.dart';
import 'package:ahsan_dev/widgets/header.dart';
import 'package:ahsan_dev/widgets/project_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WorkPage extends StatefulWidget {
  const WorkPage({Key? key}) : super(key: key);

  @override
  _WorkPageState createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  final PageController _pageController = PageController();
  int _selectedCategoryIndex = 0;

  final List<String> _categories = ["All", "Mobile", "Web"];

  void _onCategorySelected(int index) {
    setState(() {
      _selectedCategoryIndex = index;
    });
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    // Filter projects based on the selected category
    final filteredProjects = _categories[_selectedCategoryIndex] == "All"
        ? Project.projects
        : Project.projects.where((project) {
            if (_categories[_selectedCategoryIndex] == "Mobile") {
              return project.title.toLowerCase().contains("mobile");
            } else {
              return project.title.toLowerCase().contains("web");
            }
          }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Header(),
            // Header and category selectors
            SizedBox(height: screenHeight * 0.1),
            const Text(
              'Work',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_categories.length, (index) {
                return GestureDetector(
                  onTap: () => _onCategorySelected(index),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      _categories[index],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: _selectedCategoryIndex == index
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              }),
            ),
            const Divider(thickness: 2, color: Colors.grey),
            SizedBox(height: screenHeight * 0.02),
            // Project list
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredProjects.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ProjectRowWidget(
                    project: filteredProjects[index],
                  ),
                );
              },
            ),
            SizedBox(
              height: screenHeight * 0.2,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Do you like my portfolio? You can simply ",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  HoverButton(
                    text: 'contact me',
                    color: const Color(0xff3D5EFC),
                    onPressed: () {
                      context.go('/contact');
                    },

                    // isOutlined: true,
                  ),
                  // CustomButton(
                  //   text: 'contact me',
                  //   color: const Color(0xff3D5EFC),
                  //   onPressed: () {
                  //     context.go('/contact');
                  //   },
                  //   textColor: Colors.white,
                  //   // isOutlined: true,
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.2,
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
