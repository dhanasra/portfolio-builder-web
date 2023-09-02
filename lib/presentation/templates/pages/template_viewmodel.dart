import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/base/base_viewmodel.dart';

class TemplateViewModel extends BaseViewModel {

  final BuildContext context;
  TemplateViewModel(this.context);

  final ScrollController controller = ScrollController();

  final GlobalObjectKey headerKey = const GlobalObjectKey('header');
  final GlobalObjectKey aboutKey = const GlobalObjectKey('about');
  final GlobalObjectKey skillKey = const GlobalObjectKey('skill');
  final GlobalObjectKey educationKey = const GlobalObjectKey('education');
  final GlobalObjectKey workKey = const GlobalObjectKey('work');
  final GlobalObjectKey contactKey = const GlobalObjectKey('contact');

  @override
  void initialize() {
    
  }

  void scrollToKey(GlobalObjectKey key) {
    final RenderObject renderObject = key.currentContext!.findRenderObject()!;
    final RenderBox renderBox = renderObject as RenderBox;
    final double offset = renderBox.localToGlobal(Offset.zero).dy;
    controller.animateTo(
      offset,
      duration: const Duration(milliseconds: 500), // Adjust the duration as needed
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    
  }

}