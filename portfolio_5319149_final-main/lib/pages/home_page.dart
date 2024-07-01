import 'dart:async';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/const/colors.dart';
import 'package:portfolio/sections/footer.dart';
import 'package:portfolio/sections/intro.dart';
import 'package:portfolio/sections/connect_with_me.dart';
import 'package:portfolio/sections/nav_bar.dart';
import 'package:portfolio/sections/projects.dart';
import 'package:portfolio/sections/skills.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _introSectionKey = GlobalKey();
  final GlobalKey _skillsSectionKey = GlobalKey();
  final GlobalKey _projectsSectionKey = GlobalKey();
  final GlobalKey _connectSectionKey = GlobalKey();

  final GlobalKey<FlipCardState> _flipCardKey = GlobalKey<FlipCardState>();

  bool _isFabVisible = false;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    _startFlipSequence();
    Timer(const Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _startFlipSequence() async {
    await Future.delayed(const Duration(seconds: 2));
    _flipCardKey.currentState?.toggleCard();
    await Future.delayed(const Duration(seconds: 1));
    _flipCardKey.currentState?.toggleCard();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels > 0) {
      if (!_isFabVisible) {
        setState(() {
          _isFabVisible = true;
        });
      }
    } else {
      if (_isFabVisible) {
        setState(() {
          _isFabVisible = false;
        });
      }
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0.0,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToIntroSection() {
    // Get the position of the  section
    RenderBox renderBox =
        _introSectionKey.currentContext?.findRenderObject() as RenderBox;
    Offset offset = renderBox.localToGlobal(Offset.zero,
        ancestor: context.findRenderObject());

    // Scroll to the position of the section
    _scrollController.animateTo(
      _scrollController.offset + offset.dy,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToSkillsSection() {
    // Get the position of the  section
    RenderBox renderBox =
        _skillsSectionKey.currentContext?.findRenderObject() as RenderBox;
    Offset offset = renderBox.localToGlobal(Offset.zero,
        ancestor: context.findRenderObject());

    // Scroll to the position of the section
    _scrollController.animateTo(
      _scrollController.offset + offset.dy,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToProjectsSection() {
    // Get the position of the  section
    RenderBox renderBox =
        _projectsSectionKey.currentContext?.findRenderObject() as RenderBox;
    Offset offset = renderBox.localToGlobal(Offset.zero,
        ancestor: context.findRenderObject());

    // Scroll to the position of the section
    _scrollController.animateTo(
      _scrollController.offset + offset.dy,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToConnectSection() {
    RenderBox renderBox =
        _connectSectionKey.currentContext?.findRenderObject() as RenderBox;
    Offset offset = renderBox.localToGlobal(Offset.zero,
        ancestor: context.findRenderObject());

    _scrollController.animateTo(
      _scrollController.offset + offset.dy,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 700;
    bool isTablet = MediaQuery.of(context).size.width < 1100;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.zero,
            controller: _scrollController,
            child: Column(
              children: [
                NavBarSection(
                  onAboutMePressed: _scrollToIntroSection,
                  onSkillsPressed: _scrollToSkillsSection,
                  onProjectsPressed: _scrollToProjectsSection,
                  onConnectPressed: _scrollToConnectSection,
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0,
                ),
                IntroSection(
                  key: _introSectionKey,
                  flipCardKey: _flipCardKey,
                  onConnectPressed: _scrollToConnectSection,
                ),
                SizedBox(
                  height: isMobile || isTablet
                      ? MediaQuery.of(context).size.height * 0.2
                      : MediaQuery.of(context).size.height * 0.3,
                ),
                SkillSection(
                  key: _skillsSectionKey,
                ),
                SizedBox(
                  height: isMobile || isTablet
                      ? MediaQuery.of(context).size.height * 0.2
                      : MediaQuery.of(context).size.height * 0.3,
                ),
                ProjectSection(
                  key: _projectsSectionKey,
                ),
                SizedBox(
                  height: isMobile || isTablet
                      ? MediaQuery.of(context).size.height * 0.2
                      : MediaQuery.of(context).size.height * 0.3,
                ),
                ConnectWithMeSection(
                  key: _connectSectionKey,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                const FooterSection(),
              ],
            ),
          ),
          if (_isLoading)
            AnimatedOpacity(
              opacity: _isLoading ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: isMobile || isTablet
                    ? Center(
                        child: LottieBuilder.asset(
                            "assets/loading_animation.json",
                            height: 300,
                        ),
                      )
                    : Center(
                        child: LottieBuilder.asset(
                            "assets/loading_animation.json",
                            height: 300),
                            

                      ),
              ),
            ),
        ],
      ),
      floatingActionButton: _isFabVisible
          ? FloatingActionButton(
              backgroundColor: ConstColors.secondaryColor,
              shape: const CircleBorder(),
              onPressed: _scrollToTop,
              child: const Icon(
                Icons.arrow_upward,
                color: Colors.white,
              ),
            )
          : null,
    );
  }
}
