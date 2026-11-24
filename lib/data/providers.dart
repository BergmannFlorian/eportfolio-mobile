import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/api/portfolio_api.dart';
import '../core/cache/json_cache.dart';

part 'providers.g.dart';

/// Current time; overridden in tests.
final clockProvider = Provider<DateTime Function()>((ref) => DateTime.now);

@Riverpod(keepAlive: true)
PortfolioApi portfolioApi(Ref ref) => PortfolioApi.create();

@Riverpod(keepAlive: true)
JsonCache jsonCache(Ref ref) {
  return JsonCache(() async {
    final support = await getApplicationSupportDirectory();
    return Directory('${support.path}${Platform.pathSeparator}api_cache');
  });
}
