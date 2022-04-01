import 'dart:async';
import 'dart:math' as math show max, min;

int _previous = 0;

/// A cross-platform implementation for requesting the next animation frame.
///
/// Returns a [Future<num>] that completes as close as it can to the next
/// frame, given that it will attempt to be called 60 times per second (60 FPS)
/// by default - customize by setting the [target].
Future<num> nextFrame([num target = 60]) {
  final current = DateTime.now().millisecondsSinceEpoch;
  final call = math.max(0, (1000 ~/ target) - (current - _previous));
  return Future.delayed(
    Duration(milliseconds: call),
    () => _previous = DateTime.now().millisecondsSinceEpoch,
  );
}

/// Returns a [Stream] that fires every [animationFrame].
///
/// May provide a function that returns a future completing in the next
/// available frame. For example in a browser environment this may be delegated
/// to `window.animationFrame`:
///
/// ```
/// eachFrame(animationFrame: () => window.animationFrame)
/// ```
Stream<num> eachFrame({Future<num> Function() animationFrame = nextFrame}) {
  // ignore: close_sinks
  late StreamController<num> controller;
  var cancelled = false;
  void onNext(num timestamp) {
    if (cancelled) return;
    controller.add(timestamp);
    animationFrame().then(onNext);
  }

  controller = StreamController<num>(
    sync: true,
    onListen: () {
      animationFrame().then(onNext);
    },
    onCancel: () {
      cancelled = true;
    },
  );
  return controller.stream;
}

/// Computes frames-per-second given a [Stream<num>] of timestamps.
///
/// The resulting [Stream] is capped at reporting a maximum of 60 FPS.
///
/// ```
/// // Listens to FPS for 10 frames, and reports at FPS, printing to console.
/// eachFrame()
///   .take(10)
///   .transform(const ComputeFps())
///   .listen(print);
/// ```
class ComputeFps implements StreamTransformer<num, num> {
  final num _filterStrength;

  /// Create a transformer.
  ///
  /// Optionally specify a `filterStrength`, or how little to reflect temporary
  /// variations in FPS. A value of `1` will only keep the last value.
  const ComputeFps([this._filterStrength = 20]);

  @override
  Stream<num> bind(Stream<num> stream) {
    // ignore: close_sinks
    late StreamController<num> controller;
    late StreamSubscription<num> subscription;
    num frameTime = 0;
    num? lastLoop;
    controller = StreamController<num>(
      sync: true,
      onListen: () {
        subscription = stream.listen((thisLoop) {
          if (lastLoop != null) {
            var thisFrameTime = thisLoop - lastLoop!;
            frameTime += (thisFrameTime - frameTime) / _filterStrength;
            controller.add(math.min(1000 / frameTime, 60));
          }
          lastLoop = thisLoop;
        });
      },
      onCancel: () => subscription.cancel(),
    );
    return controller.stream;
  }

  @override
  StreamTransformer<RS, RT> cast<RS, RT>() {
    throw UnimplementedError();
  }
}
