// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$messagesHash() => r'0f9c234484638996dfb40b93c135b0de98f38d7a';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$Messages
    extends BuildlessAutoDisposeStreamNotifier<QuerySnapshot> {
  late final String userId;
  late final String receiverId;
  late final String receiverUserName;

  Stream<QuerySnapshot> build(
    String userId,
    String receiverId,
    String receiverUserName,
  );
}

/// See also [Messages].
@ProviderFor(Messages)
const messagesProvider = MessagesFamily();

/// See also [Messages].
class MessagesFamily extends Family<AsyncValue<QuerySnapshot>> {
  /// See also [Messages].
  const MessagesFamily();

  /// See also [Messages].
  MessagesProvider call(
    String userId,
    String receiverId,
    String receiverUserName,
  ) {
    return MessagesProvider(
      userId,
      receiverId,
      receiverUserName,
    );
  }

  @override
  MessagesProvider getProviderOverride(
    covariant MessagesProvider provider,
  ) {
    return call(
      provider.userId,
      provider.receiverId,
      provider.receiverUserName,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'messagesProvider';
}

/// See also [Messages].
class MessagesProvider
    extends AutoDisposeStreamNotifierProviderImpl<Messages, QuerySnapshot> {
  /// See also [Messages].
  MessagesProvider(
    String userId,
    String receiverId,
    String receiverUserName,
  ) : this._internal(
          () => Messages()
            ..userId = userId
            ..receiverId = receiverId
            ..receiverUserName = receiverUserName,
          from: messagesProvider,
          name: r'messagesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$messagesHash,
          dependencies: MessagesFamily._dependencies,
          allTransitiveDependencies: MessagesFamily._allTransitiveDependencies,
          userId: userId,
          receiverId: receiverId,
          receiverUserName: receiverUserName,
        );

  MessagesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
    required this.receiverId,
    required this.receiverUserName,
  }) : super.internal();

  final String userId;
  final String receiverId;
  final String receiverUserName;

  @override
  Stream<QuerySnapshot> runNotifierBuild(
    covariant Messages notifier,
  ) {
    return notifier.build(
      userId,
      receiverId,
      receiverUserName,
    );
  }

  @override
  Override overrideWith(Messages Function() create) {
    return ProviderOverride(
      origin: this,
      override: MessagesProvider._internal(
        () => create()
          ..userId = userId
          ..receiverId = receiverId
          ..receiverUserName = receiverUserName,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
        receiverId: receiverId,
        receiverUserName: receiverUserName,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<Messages, QuerySnapshot>
      createElement() {
    return _MessagesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MessagesProvider &&
        other.userId == userId &&
        other.receiverId == receiverId &&
        other.receiverUserName == receiverUserName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);
    hash = _SystemHash.combine(hash, receiverId.hashCode);
    hash = _SystemHash.combine(hash, receiverUserName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MessagesRef on AutoDisposeStreamNotifierProviderRef<QuerySnapshot> {
  /// The parameter `userId` of this provider.
  String get userId;

  /// The parameter `receiverId` of this provider.
  String get receiverId;

  /// The parameter `receiverUserName` of this provider.
  String get receiverUserName;
}

class _MessagesProviderElement
    extends AutoDisposeStreamNotifierProviderElement<Messages, QuerySnapshot>
    with MessagesRef {
  _MessagesProviderElement(super.provider);

  @override
  String get userId => (origin as MessagesProvider).userId;
  @override
  String get receiverId => (origin as MessagesProvider).receiverId;
  @override
  String get receiverUserName => (origin as MessagesProvider).receiverUserName;
}

String _$inputMessageHash() => r'6575229d196f5353f455bfe01ece69a6ebce4f2f';

/// See also [InputMessage].
@ProviderFor(InputMessage)
final inputMessageProvider =
    AutoDisposeNotifierProvider<InputMessage, String>.internal(
  InputMessage.new,
  name: r'inputMessageProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$inputMessageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$InputMessage = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
