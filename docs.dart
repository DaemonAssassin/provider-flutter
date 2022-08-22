// https://medium.com/flutter-community/making-sense-all-of-those-flutter-providers-e842e18f45dd
// https://flutterbyexample.com/lesson/future-provider

//! Provider -> Provider<T>
//1. The Provider class takes a value and exposes it, regardless of the value type
//2. Creates a value, store it, and expose it to its descendants. 
//! Provider.value
//1. Expose an existing value without disposing it.
//! ListenableProvider -> ListenableProvider<T extends Listenable?> class
//1. Listens to a Listenable, expose it to its descendants and rebuilds
// dependents whenever the listener emits an event.
//2. It is the specific provider used for listenable objects. It will listen,
// then ask widgets depending on it and affected by the state change to
// rebuild any time the listener is called
//! ChangeNotifierProvider -> ChangeNotifierProvider<T extends ChangeNotifier?> class
//1. ChangeNotifierProvider is similar to ListenableProvider but for
// ChangeNotifier objects, and calls ChangeNotifier.dispose automatically when needed
//2. Listens to a ChangeNotifier, expose it to its descendants and rebuilds
// dependents whenever ChangeNotifier.notifyListeners is called.
//* Provider
//* ListenableProvider
//* ChangeNotifierProvider
//* ValueListenableProvider
//* StreamProvider
//* FutureProvider
//* MultiProvider
//* ProxyProvider
//* ChangeNotifierProxyProvider