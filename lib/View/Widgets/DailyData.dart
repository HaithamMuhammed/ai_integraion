// lib/Data/daily_data.dart

import 'package:flutter/material.dart'; // Only needed if using Offsets or similar, but good practice for data files that might include UI-related data.

final Map<int, Map<String, dynamic>> dailyData = {
  0: { // Sunday
    'steps': 4500,
    'km': 10.2,
    'heartRate': 80,
    'cal': 550,
    'graphPoints': [0.05, 0.25, 0.15, 0.65, 0.35, 0.75, 0.45, 0.60],
  },
  1: { // Monday
    'steps': 6800,
    'km': 15.8,
    'heartRate': 85,
    'cal': 700,
    'graphPoints': [0.10, 0.30, 0.70, 0.40, 0.80, 0.50, 0.90, 0.65],
  },
  2: { // Tuesday 
    'steps': 3200,
    'km': 7.5,
    'heartRate': 78,
    'cal': 400,
    'graphPoints': [0.20, 0.10, 0.30, 0.20, 0.40, 0.30, 0.50, 0.40],
  },
  3: { // Wednesday 
    'steps': 7500,
    'km': 17.0,
    'heartRate': 90,
    'cal': 800,
    'graphPoints': [0.15, 0.45, 0.85, 0.55, 0.95, 0.65, 0.75, 0.80],
  },
  4: { //default Friday 
    'steps': 5234,
    'km': 12.4,
    'heartRate': 92,
    'cal': 698,
    'graphPoints': [0.05, 0.40, 0.20, 0.80, 0.40, 0.90, 0.50, 0.85],
  },
  5: { // Saturday 
    'steps': 6100,
    'km': 14.1,
    'heartRate': 88,
    'cal': 620,
    'graphPoints': [0.25, 0.70, 0.50, 0.80, 0.60, 0.90, 0.70, 0.80],
  },
  6: { // Sunday 
    'steps': 2800,
    'km': 6.0,
    'heartRate': 75,
    'cal': 350,
    'graphPoints': [0.10, 0.20, 0.10, 0.30, 0.20, 0.40, 0.30, 0.50],
  },
};