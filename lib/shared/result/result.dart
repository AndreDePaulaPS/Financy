sealed class Result<S, E extends Exception> {
  const Result();

  T when<T>({
    required T Function(S success) success, 
    required T Function(E failure) failure}
    ){
     switch(this){
      case Success(success: final value): return success(value);
      case Failure(failure: final error): return failure(error);
    }
  }

}


class Success<S, E extends Exception> extends Result<S, E>{
  final S success;

  const Success(this.success);
}

class Failure<S, E extends Exception> extends Result<S, E>{
  final E failure;

  const Failure(this.failure);
}