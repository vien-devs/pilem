import 'dart:async';

import 'package:alice/alice.dart';
import 'package:pilem/core/network/http/core_base_client.dart';
import 'package:pilem/core/network/http/core_http_client.dart';
import 'package:pilem/core/network/repository/core_http_repository.dart';
import 'package:pilem/core/type_defs.dart';

// Core Http is the component for http network call.
// This object will generate proper configuration for [CoreHttpClient].
class CoreHttpBuilder {
  final Map<String, String> defaultHeaders;
  final CoreBaseClient Function() coreClient;
  final Alice httpInspector;
  final CoreHttpRepository coreHttpRepository;

  CoreHttpBuilder({
    required this.defaultHeaders,
    required this.coreClient,
    required this.httpInspector,
    required this.coreHttpRepository,
  });

  final _baseUrl = 'api.themoviedb.org/3/';

  CoreHttpClient movieDb({
    required String path,
    Json? query,
    Map<String, String>? headers,
  }) =>
      _buildClient(_baseUrl, path, query, headers);

  // Future<ApiEnv> get apiEnv => coreHttpRepository.getEnv();
  //
  // CoreHttpClient aplusEwallet({
  //   required String path,
  //   Json? query,
  //   Map<String, String>? headers,
  // }) =>
  //     _buildClient(
  //         apiEnv.then((value) => value.aplusEwalletUrl), path, query, headers);
  //
  // CoreHttpClient aplus({
  //   required String path,
  //   Json? query,
  //   Map<String, String>? headers,
  // }) =>
  //     _buildClient(
  //         apiEnv.then((value) => value.aplusUrl), path, query, headers);
  //
  // CoreHttpClient aplusPpob({
  //   required String path,
  //   Json? query,
  //   Map<String, String>? headers,
  // }) =>
  //     _buildClient(
  //         apiEnv.then((value) => value.aplusPpobUrl), path, query, headers);
  //
  // CoreHttpClient aplusRepayment({
  //   required String path,
  //   Json? query,
  //   Map<String, String>? headers,
  // }) =>
  //     _buildClient(apiEnv.then((value) => value.aplusRepaymentUrl), path, query,
  //         headers);
  //
  // CoreHttpClient aplusPaylater({
  //   required String path,
  //   Json? query,
  //   Map<String, String>? headers,
  // }) =>
  //     _buildClient(
  //         apiEnv.then((value) => value.aplusPaylaterUrl), path, query, headers);
  //
  // CoreHttpClient aplusBuying({
  //   required String path,
  //   Json? query,
  //   Map<String, String>? headers,
  // }) =>
  //     _buildClient(
  //         apiEnv.then((value) => value.aplusBuyingUrl), path, query, headers);
  //
  // CoreHttpClient aplusDigitalLedgerUser({
  //   required String path,
  //   Json? query,
  //   Map<String, String>? headers,
  // }) =>
  //     _buildClient(apiEnv.then((value) => value.aplusDigitalLedgerUserUrl),
  //         path, query, headers);
  //
  // CoreHttpClient aplusDigitalLedger({
  //   required String path,
  //   Json? query,
  //   Map<String, String>? headers,
  // }) =>
  //     _buildClient(apiEnv.then((value) => value.aplusDigitalLedgerUrl), path,
  //         query, headers);
  //
  // CoreHttpClient aplusCsr({
  //   required String path,
  //   Json? query,
  //   Map<String, String>? headers,
  // }) =>
  //     _buildClient(
  //         apiEnv.then((value) => value.aplusCsrUrl), path, query, headers);
  //
  // CoreHttpClient aplusNeobank({
  //   required String path,
  //   Json? query,
  //   Map<String, String>? headers,
  // }) =>
  //     _buildClient(
  //         apiEnv.then((value) => value.aplusNeobankUrl), path, query, headers);
  //
  // CoreHttpClient aplusSaving({
  //   required String path,
  //   Json? query,
  //   Map<String, String>? headers,
  // }) =>
  //     _buildClient(
  //         apiEnv.then((value) => value.aplusSavingUrl), path, query, headers);
  //
  // CoreHttpClient aplusMicroInvestment({
  //   required String path,
  //   Json? query,
  //   Map<String, String>? headers,
  // }) =>
  //     _buildClient(apiEnv.then((value) => value.aplusMicroInvestmentUrl), path,
  //         query, headers);

  CoreHttpClient _buildClient(
    String url,
    String path, [
    Json? query,
    Map<String, String>? headers,
  ]) {
    final finalHeaders = Map.of(defaultHeaders)..addAll(headers ?? {});
    final uri = Future.sync(() {
      final urlSegments = url.split('/');
      final pathSegments = path.split('/');

      final authority = urlSegments.first;
      final basePathSegments = urlSegments.sublist(1);
      final finalSegments = (basePathSegments + pathSegments)
        ..removeWhere((element) => element.isEmpty);

      final finalPath = finalSegments.join('/');
      final uri = Uri.https(authority, finalPath, query);
      return uri;
    });

    return CoreHttpClient(
      uri,
      finalHeaders,
      coreClient,
      httpInspector,
      coreHttpRepository,
    );
  }
}
