import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum BlogCategory { tech, ai, cloud, robotics, iot }

extension StringValues on BlogCategory {
  String tabStr() {
    switch (this) {
      case BlogCategory.tech:
        return 'Tech';
      case BlogCategory.ai:
        return 'AI';
      case BlogCategory.cloud:
        return 'Cloud';
      case BlogCategory.robotics:
        return 'Robotics';
      case BlogCategory.iot:
        return 'IoT';
    }
  }

  String titleStr() {
    switch (this) {
      case BlogCategory.tech:
        return 'TECHNOLOGY';
      case BlogCategory.ai:
        return 'ARTIFICIAL INTELLIGENCE';
      case BlogCategory.cloud:
        return 'CLOUD COMPUTING';
      case BlogCategory.robotics:
        return 'ROBOTICS';
      case BlogCategory.iot:
        return 'INTERNET OF THINGS';
    }
  }

  IconData icon() {
    switch (this) {
      case BlogCategory.tech:
        return Icons.memory;
      case BlogCategory.ai:
        return Icons.smart_toy;
      case BlogCategory.cloud:
        return Icons.cloud;
      case BlogCategory.robotics:
        return Icons.precision_manufacturing;
      case BlogCategory.iot:
        return Icons.sensors;
    }
  }
}
