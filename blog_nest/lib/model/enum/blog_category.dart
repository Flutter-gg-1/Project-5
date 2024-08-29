import 'package:flutter/cupertino.dart';

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
        return 'Technology';
      case BlogCategory.ai:
        return 'Artificial Intelligence';
      case BlogCategory.cloud:
        return 'Cloud Computing';
      case BlogCategory.robotics:
        return 'Robotics';
      case BlogCategory.iot:
        return 'Internet of Things';
    }
  }

  IconData icon() {
    switch (this) {
      case BlogCategory.tech:
        return CupertinoIcons.cube_box;
      case BlogCategory.ai:
        return CupertinoIcons.cloud;
      case BlogCategory.cloud:
        return CupertinoIcons.cloud;
      case BlogCategory.robotics:
        return CupertinoIcons.cloud;
      case BlogCategory.iot:
        return CupertinoIcons.cloud;
    }
  }
}
