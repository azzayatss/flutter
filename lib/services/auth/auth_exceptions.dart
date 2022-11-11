//login exceptions
class UserNotFoundAuthException implements Exception{}
class WrongPasswordAuthExcetion implements Exception{}

//register exception
class WeakPasswordAuthException implements Exception{}
class EmailAlreadyInUseAuthException implements Exception{}
class InvalidEmailAuthException implements Exception{}

//generic exceptions 
class GenericAuthException implements Exception{}
class UserNotLoggedAuthException implements Exception{}