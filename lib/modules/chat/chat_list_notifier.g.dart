// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_list_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatListHash() => r'00ec4354beaca20790e259bf0cf218ea87ef6390';

/// See also [chatList].
@ProviderFor(chatList)
final chatListProvider = AutoDisposeStreamProvider<QuerySnapshot>.internal(
  chatList,
  name: r'chatListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$chatListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ChatListRef = AutoDisposeStreamProviderRef<QuerySnapshot>;
String _$signOutControllerHash() => r'70152e12ba06cb2a323de021d80b7495ac3e13a6';

/// See also [SignOutController].
@ProviderFor(SignOutController)
final signOutControllerProvider =
    AutoDisposeAsyncNotifierProvider<SignOutController, bool>.internal(
  SignOutController.new,
  name: r'signOutControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$signOutControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SignOutController = AutoDisposeAsyncNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
