part of 'root_cubit.dart';

@immutable
class RootState {
  final User? user;
  final bool isLoading;
  // ignore: prefer_typing_uninitialized_variables
  final errorMessage;

  const RootState({
    required this.user, 
    required this.isLoading,
    required this.errorMessage,
  });
}
