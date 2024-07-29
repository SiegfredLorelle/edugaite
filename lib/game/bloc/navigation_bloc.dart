import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'navigation_event.dart';
import 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(HomePageState()) {
    on<NavigateToHomePage>((event, emit) {
      emit(HomePageState());
    });

    on<NavigateToCoursePage>((event, emit) {
      emit(CoursePageState());
    });

    on<NavigateToProfilePage>((event, emit) {
      emit(ProfilePageState());
    });
  }
}
