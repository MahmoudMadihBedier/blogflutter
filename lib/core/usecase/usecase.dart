import 'package:fpdart/fpdart.dart';

import '../error/failler.dart';

abstract interface class UseCase<SuccessType,params > {

  Future<Either<Failure,SuccessType>>call(params param);
}
class NoParams{}