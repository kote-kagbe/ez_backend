import 'dart:async';
import 'dart:isolate';

class BatchFuture {
  final bool _isolated;
  final _batch = <BatchItem>[];
  Map<String, dynamic>? _results;
  int _finished = 0;
  bool _executing = false;

  BatchFuture({isolated = false}) : _isolated = isolated;

  Future<T> add<T>(FutureOr<T> Function() func, {String? id}) {
    if (_executing) {
      throw Exception('the batch is already executing');
    }
    final completer = Completer<T>();
    _batch.add(BatchItem(completer, func, id ?? _batch.length.toString()));
    return completer.future;
  }

  void execute({required Callback callback, bool returnResult = false}) {
    if (_executing) {
      throw Exception('the batch is already executing');
    }
    if (returnResult) {
      _results = {};
    }
    _executing = true;
    if (_isolated) {
      _isolate(callback);
    } else {
      _sameThread(callback);
    }
  }

  void _sameThread(Callback callback) {
    for (final entry in _batch) {
      Future(entry.function).then((value) {
        _finished += 1;
        _results?[entry.id] = value;
        entry.completer.complete(value);
        if (_finished == _batch.length) {
          callback(_results);
        }
      }).catchError((error) {
        _finished += 1;
        _results?[entry.id] = error;
        entry.completer.completeError(error);
        if (_finished == _batch.length) {
          callback(_results);
        }
      });
    }
  }

  void _isolate(Callback callback) {
    final closures =
        List<FutureFunc>.unmodifiable(_batch.map((e) => e.function));
    final rp = ReceivePort();
    final isolate =
        Isolate.spawn(_isolateRoot, {rp.sendPort: closures}, paused: true);
    isolate.then((iso) {
      rp.listen((message) {
        if (message == null) {
          rp.close();
          iso.kill(priority: Isolate.immediate);
          throw Exception('invalid isolate message');
        }
        IsolateMessage msg = message as IsolateMessage;
        _finished += 1;
        _results?[_batch[msg.n].id] = msg.result;
        if (msg.result is Exception) {
          _batch[msg.n].completer.completeError(msg.result);
        } else {
          _batch[msg.n].completer.complete(msg.result);
        }
        if (_finished == _batch.length) {
          rp.close();
          iso.kill();
          callback(_results);
        }
      });
      iso.resume(iso.pauseCapability!);
    });
  }
}

void _isolateRoot(data) {
  final input = (data as Map<SendPort, List<FutureFunc>>).entries.first;
  for (final (n, func) in input.value.indexed) {
    Future(func).then((value) {
      input.key.send((n: n, result: value));
    }).catchError((error) {
      input.key.send((n: n, result: error));
    });
  }
}

typedef Callback = void Function(Map<String, dynamic>?);
typedef FutureFunc = FutureOr<Object?> Function();
typedef IsolateMessage = ({int n, dynamic result});

class BatchItem<T> {
  Completer completer;
  FutureFunc function;
  String id;
  BatchItem(this.completer, this.function, this.id);
}
