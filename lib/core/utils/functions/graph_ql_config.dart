import 'package:flutter/material.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/utils/Api_Key.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

ValueNotifier<GraphQLClient> GraphQLConfigration() {
  final HttpLink httpLink = HttpLink('${ApiKeys.BASE_URL}/graphql',
      defaultHeaders: {'Authorization': 'Bearer $userToken'});
  final ValueNotifier<GraphQLClient> gClient = ValueNotifier<GraphQLClient>(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(),
    ),
  );
  return gClient;
}
