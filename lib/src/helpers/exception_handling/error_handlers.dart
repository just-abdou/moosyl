import 'dart:async';

/// A utility class for handling errors during asynchronous transactions.
///
/// This class provides methods to catch and manage errors that occur
/// in asynchronous functions, while optionally displaying feedback to users.
class ErrorHandlers {
  /// Catches errors from an asynchronous function and returns a [ResponseHandlers] object.
  ///
  /// This method executes the provided [function], catches any errors that occur,
  /// and maps them to user-friendly messages. If specified, it can display
  /// feedback messages using a flash bar.
  static Future<ResponseHandlers<T>> catchErrors<T>(
    Future<T> Function() function, {
    bool showFlashBar = true,
  }) async {
    try {
      // Attempt to execute the provided function and return the result wrapped in ResponseHandlers.
      return ResponseHandlers(result: await function());
    } catch (error) {
      // Return the error message wrapped in ResponseHandlers.
      return ResponseHandlers(error: error);
    }
  }
}

/// A class to represent the result of an transaction and any associated error.
///
/// This class contains the result of a successful transaction or an error message
/// if the transaction failed.
class ResponseHandlers<T> {
  /// Error message if an error occurred.
  final Object? error;

  /// Result of the transaction if successful.
  final T? result;

  /// Indicates whether there was an error.
  bool get isError => error != null;

  /// Constructs a [ResponseHandlers] with the given error or result.
  ResponseHandlers({
    this.error,
    this.result,
  });
}
