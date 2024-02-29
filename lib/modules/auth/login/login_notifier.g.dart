// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signInControllerHash() => r'92951c59152fbf214c1118155237abf908aaea6d';

/// See also [SignInController].
@ProviderFor(SignInController)
final signInControllerProvider =
    AutoDisposeAsyncNotifierProvider<SignInController, bool>.internal(
  SignInController.new,
  name: r'signInControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$signInControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SignInController = AutoDisposeAsyncNotifier<bool>;
String _$signInStatusHash() => r'1fc5783cb286099d2ff16452074a2c2af8347faf';

/// See also [SignInStatus].
@ProviderFor(SignInStatus)
final signInStatusProvider =
    AutoDisposeNotifierProvider<SignInStatus, LoginFrom>.internal(
  SignInStatus.new,
  name: r'signInStatusProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$signInStatusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SignInStatus = AutoDisposeNotifier<LoginFrom>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
