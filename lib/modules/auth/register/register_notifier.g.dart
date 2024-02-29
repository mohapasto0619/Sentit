// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signUpControllerHash() => r'dcee36a7d01437adf0c7aa8dc951a06f7c5b41ed';

/// See also [SignUpController].
@ProviderFor(SignUpController)
final signUpControllerProvider =
    AutoDisposeAsyncNotifierProvider<SignUpController, bool>.internal(
  SignUpController.new,
  name: r'signUpControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$signUpControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SignUpController = AutoDisposeAsyncNotifier<bool>;
String _$signUpStatusHash() => r'fb2d011498658695f752f15f2d707aa82364d5e2';

/// See also [SignUpStatus].
@ProviderFor(SignUpStatus)
final signUpStatusProvider =
    AutoDisposeNotifierProvider<SignUpStatus, RegisterFrom>.internal(
  SignUpStatus.new,
  name: r'signUpStatusProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$signUpStatusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SignUpStatus = AutoDisposeNotifier<RegisterFrom>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
