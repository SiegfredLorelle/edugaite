import 'package:equatable/equatable.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

class HomePageState extends NavigationState {}

class CoursePageState extends NavigationState {}

class ProfilePageState extends NavigationState {}
