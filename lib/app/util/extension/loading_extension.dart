import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

extension LoadingExtension on Widget {
  Widget regularLoading({isLoading = false}) {
    return LoadingOverlay(
        progressIndicator: CircularProgressIndicator(color: Colors.grey),
        isLoading: isLoading,
        color: Colors.grey,
        opacity: 0.3,
        child: this);
  }
}
