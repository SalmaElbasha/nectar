
import 'package:dio/dio.dart';


class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['token']="eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyYzk1NmNkOThkNTU0NzcxNzRhZDFmOTM3MmZlOTk0MCIsIm5iZiI6MTcyNTMwOTY4MS45NTcwNzIsInN1YiI6IjY2ZDYyMTllODY4MDQ0Njk0MjRjZjY1MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.zDqhWF5g5b8my84jc32IvkPqo8fGRWYR9DI4sAPQqGg";
    options.headers['Accept']='application/json';
    super.onRequest(options, handler);
  }
}