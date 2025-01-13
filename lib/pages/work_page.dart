import 'package:ahsan_dev/model/project_model.dart';
import 'package:ahsan_dev/widgets/contact_me_button.dart';
import 'package:ahsan_dev/widgets/footer.dart';
import 'package:ahsan_dev/widgets/header.dart';
import 'package:ahsan_dev/widgets/project_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WorkPage extends StatefulWidget {
  const WorkPage({super.key});

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
    final screenWidth = MediaQuery.sizeOf(context).width;

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
            Padding(
              padding: screenWidth >= 768
                  ? const EdgeInsets.symmetric(horizontal: 40)
                  : screenWidth <= 768
                      ? const EdgeInsets.symmetric(horizontal: 20)
                      : const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.2),
                  const Text(
                    'Work',
                    style: TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.2),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(_categories.length, (index) {
                      return GestureDetector(
                        onTap: () => _onCategorySelected(index),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            _categories[index],
                            style: TextStyle(
                              color: _selectedCategoryIndex == index
                                  ? const Color(0xff3D5EFC)
                                  : Colors.black,
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
                      child: screenWidth >= 768
                          ? Row(
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
                                ),
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Do you like my portfolio? You can simply ",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                HoverButton(
                                  text: 'contact me',
                                  color: const Color(0xff3D5EFC),
                                  onPressed: () {
                                    context.go('/contact');
                                  },
                                ),
                              ],
                            )),
                  SizedBox(
                    height: screenHeight * 0.2,
                  ),
                ],
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
