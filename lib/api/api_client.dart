import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:myapps/api/raw_response.dart';
import '../models/orders.dart';
import 'api_config.dart';

class APIClient {
  final Dio dio;
  final Logger logger = Logger();
  final config = APIConfig();

  APIClient()
      : dio = Dio(
    BaseOptions(
      baseUrl: APIConfig().supabaseUrl,
      responseType: ResponseType.json,
      connectTimeout: const Duration(seconds: 3), // Set timeout to 3 seconds
      receiveTimeout: const Duration(seconds: 3), // Set timeout to 3 seconds
    ),
  );

  /// Fetch a user by phone number from Supabase
  Future<RawResponse> fetchUserWithDio({required String phoneNumber}) async {
    final String url = '${config.supabaseUrl}/rest/v1/users?user_phone=eq.$phoneNumber&select=*,role(role_name),branches(branch_name, branch_address)';
    final headers = {
      'apikey': config.supabaseAnonKey,
      'Authorization': 'Bearer ${config.supabaseAnonKey}',
      'Content-Type': 'application/json',
    };
    try {
      final response = await dio.get(
        url,
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        final data = response.data;

        if (data is List && data.isNotEmpty) {
          return RawResponse(
            status: true,
            message: "Valid user",
            responseCode: 200,
            data: data.first,
          );
        } else {
          return RawResponse(
            status: false,
            message: "User not found",
            responseCode: 404,
            data: null,
          );
        }
      } else {
        return RawResponse(
          status: false,
          message: "Request failed with status: ${response.statusCode}",
          responseCode: response.statusCode,
          data: null,
        );
      }
    } catch (e, stackTrace) {
      logger.e("Login failed", error: e, stackTrace: stackTrace);
      return RawResponse(
        status: false,
        message: "An error occurred",
        responseCode: null,
        data: null,
      );
    }
  }

  /// Fetch List Order
  Future<RawResponse> fetchListOrderWithDio() async {
    final String url =
        '${config.supabaseUrl}/rest/v1/orders?select=*,payment_methods(payment_method_name),payment_status(payment_status_name),order_status(order_status_name)';

    final headers = {
      'apikey': config.supabaseAnonKey,
      'Authorization': 'Bearer ${config.supabaseAnonKey}',
      'Content-Type': 'application/json',
    };

    try {
      final response = await dio.get(
        url,
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        final data = response.data;

        if (data is List && data.isNotEmpty) {
          List<Order> orderList = data
              .map((item) => Order.fromJson(item as Map<String, dynamic>))
              .toList();

          return RawResponse(
            status: true,
            message: "Get Orders Success",
            responseCode: 200,
            data: orderList,
          );
        } else {
          return RawResponse(
            status: false,
            message: "No orders found",
            responseCode: 404,
            data: [],
          );
        }
      } else {
        return RawResponse(
          status: false,
          message: "Request failed with status: ${response.statusCode}",
          responseCode: response.statusCode,
          data: null,
        );
      }
    } catch (e, stackTrace) {
      logger.e("Fetch order failed", error: e, stackTrace: stackTrace);
      return RawResponse(
        status: false,
        message: "An error occurred",
        responseCode: null,
        data: null,
      );
    }
  }

  /// Fetch Order Detail
  Future<RawResponse> fetchOrderDetailWithDio() async {
    final String url = '${config.supabaseUrl}/rest/v1/users?select=*';

    final headers = {
      'apikey': config.supabaseAnonKey,
      'Authorization': 'Bearer ${config.supabaseAnonKey}',
      'Content-Type': 'application/json',
    };

    try {
      final response = await dio.get(
        url,
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        final data = response.data;

        if (data is List && data.isNotEmpty) {
          // TODO: Check password match here if needed
          return RawResponse(
            status: true,
            message: "Valid user",
            responseCode: 200,
            data: data.first,
          );
        } else {
          return RawResponse(
            status: false,
            message: "User not found",
            responseCode: 404,
            data: null,
          );
        }
      } else {
        return RawResponse(
          status: false,
          message: "Request failed with status: ${response.statusCode}",
          responseCode: response.statusCode,
          data: null,
        );
      }
    } catch (e, stackTrace) {
      logger.e("Login failed", error: e, stackTrace: stackTrace);
      return RawResponse(
        status: false,
        message: "An error occurred",
        responseCode: null,
        data: null,
      );
    }
  }

  //Get Services Detail
  Future<RawResponse> fetchBanksWithDio() async {
    final String url = '${config.supabaseUrl}/rest/v1/banks?select=*';
    final headers = {
      'apikey': config.supabaseAnonKey,
      'Authorization': 'Bearer ${config.supabaseAnonKey}',
      'Content-Type': 'application/json',
    };

    try {
      final response = await dio.get(
        url,
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        final data = response.data;

        if (data is List && data.isNotEmpty) {
          // TODO: Check password match here if needed
          return RawResponse(
            status: true,
            message: "Valid Bank",
            responseCode: 200,
            data: data,
          );
        } else {
          return RawResponse(
            status: false,
            message: "User not found",
            responseCode: 404,
            data: null,
          );
        }
      } else {
        return RawResponse(
          status: false,
          message: "Request failed with status: ${response.statusCode}",
          responseCode: response.statusCode,
          data: null,
        );
      }
    } catch (e, stackTrace) {
      logger.e("Login failed", error: e, stackTrace: stackTrace);
      return RawResponse(
        status: false,
        message: "An error occurred",
        responseCode: null,
        data: null,
      );
    }
  }
  Future<RawResponse> fetchLaundryTypesWithDio() async {
    final String url = '${config.supabaseUrl}/rest/v1/laundry_types?select=*';
    final headers = {
      'apikey': config.supabaseAnonKey,
      'Authorization': 'Bearer ${config.supabaseAnonKey}',
      'Content-Type': 'application/json',
    };

    try {
      final response = await dio.get(
        url,
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        final data = response.data;

        if (data is List && data.isNotEmpty) {
          // TODO: Check password match here if needed
          return RawResponse(
            status: true,
            message: "Valid user",
            responseCode: 200,
            data: data,
          );
        } else {
          return RawResponse(
            status: false,
            message: "User not found",
            responseCode: 404,
            data: null,
          );
        }
      } else {
        return RawResponse(
          status: false,
          message: "Request failed with status: ${response.statusCode}",
          responseCode: response.statusCode,
          data: null,
        );
      }
    } catch (e, stackTrace) {
      logger.e("Login failed", error: e, stackTrace: stackTrace);
      return RawResponse(
        status: false,
        message: "An error occurred",
        responseCode: null,
        data: null,
      );
    }
  }
  Future<RawResponse> fetchPaymentMethodWithDio() async {
    final String url = '${config.supabaseUrl}/rest/v1/payment_methods?select=payment_method_id, payment_method_name';

    final headers = {
      'apikey': config.supabaseAnonKey,
      'Authorization': 'Bearer ${config.supabaseAnonKey}',
      'Content-Type': 'application/json',
    };

    try {
      final response = await dio.get(
        url,
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        final data = response.data;

        if (data is List && data.isNotEmpty) {
          // TODO: Check password match here if needed
          return RawResponse(
            status: true,
            message: "Valid user",
            responseCode: 200,
            data: data,
          );
        } else {
          return RawResponse(
            status: false,
            message: "User not found",
            responseCode: 404,
            data: null,
          );
        }
      } else {
        return RawResponse(
          status: false,
          message: "Request failed with status: ${response.statusCode}",
          responseCode: response.statusCode,
          data: null,
        );
      }
    } catch (e, stackTrace) {
      logger.e("Login failed", error: e, stackTrace: stackTrace);
      return RawResponse(
        status: false,
        message: "An error occurred",
        responseCode: null,
        data: null,
      );
    }
  }
  Future<RawResponse> fetchPaymentStatusWithDio() async {
    final String url = '${config.supabaseUrl}/rest/v1/payment_status?select=payment_status_id, payment_status_name';

    final headers = {
      'apikey': config.supabaseAnonKey,
      'Authorization': 'Bearer ${config.supabaseAnonKey}',
      'Content-Type': 'application/json',
    };

    try {
      final response = await dio.get(
        url,
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        final data = response.data;

        if (data is List && data.isNotEmpty) {
          // TODO: Check password match here if needed
          return RawResponse(
            status: true,
            message: "Valid user",
            responseCode: 200,
            data: data,
          );
        } else {
          return RawResponse(
            status: false,
            message: "User not found",
            responseCode: 404,
            data: null,
          );
        }
      } else {
        return RawResponse(
          status: false,
          message: "Request failed with status: ${response.statusCode}",
          responseCode: response.statusCode,
          data: null,
        );
      }
    } catch (e, stackTrace) {
      logger.e("Login failed", error: e, stackTrace: stackTrace);
      return RawResponse(
        status: false,
        message: "An error occurred",
        responseCode: null,
        data: null,
      );
    }
  }

  Future<RawResponse> fetchListCustomerWithDio() async {
    final String url = '${config.supabaseUrl}/rest/v1/users?select=*';

    final headers = {
      'apikey': config.supabaseAnonKey,
      'Authorization': 'Bearer ${config.supabaseAnonKey}',
      'Content-Type': 'application/json',
    };

    try {
      final response = await dio.get(
        url,
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        final data = response.data;

        if (data is List && data.isNotEmpty) {
          // TODO: Check password match here if needed
          return RawResponse(
            status: true,
            message: "Valid user",
            responseCode: 200,
            data: data,
          );
        } else {
          return RawResponse(
            status: false,
            message: "User not found",
            responseCode: 404,
            data: null,
          );
        }
      } else {
        return RawResponse(
          status: false,
          message: "Request failed with status: ${response.statusCode}",
          responseCode: response.statusCode,
          data: null,
        );
      }
    } catch (e, stackTrace) {
      logger.e("Login failed", error: e, stackTrace: stackTrace);
      return RawResponse(
        status: false,
        message: "An error occurred",
        responseCode: null,
        data: null,
      );
    }
  }

  /// Fetch Total Count
  Future<RawResponse> fetchTotalCountWithDio() async {
    final String url =
        '${config.supabaseUrl}/rest/v1/orders?select=order_status_id,order_status(order_status_id, order_status_name)';

    final headers = {
      'apikey': config.supabaseAnonKey,
      'Authorization': 'Bearer ${config.supabaseAnonKey}',
      'Content-Type': 'application/json',
    };

    try {
      final response = await dio.get(
        url,
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        final data = response.data;

        if (data is List && data.isNotEmpty) {
          // TODO: Check password match here if needed
          return RawResponse(
            status: true,
            message: "Valid user",
            responseCode: 200,
            data: data,
          );
        } else {
          return RawResponse(
            status: false,
            message: "User not found",
            responseCode: 404,
            data: null,
          );
        }
      } else {
        return RawResponse(
          status: false,
          message: "Request failed with status: ${response.statusCode}",
          responseCode: response.statusCode,
          data: null,
        );
      }
    } catch (e, stackTrace) {
      logger.e("Login failed", error: e, stackTrace: stackTrace);
      return RawResponse(
        status: false,
        message: "An error occurred",
        responseCode: null,
        data: null,
      );
    }
  }

  /// Fetch Total Transaction
  Future<RawResponse> fetchTotalTransactionTodayWithDio() async {
    // 1. grab “now” as UTC
    final nowUtc = DateTime.now().toUtc();

    // 2. build start‐of‐day @ 00:00:00 and end‐of‐day @ 23:59:59
    final startOfDayUtc = DateTime.utc(nowUtc.year, nowUtc.month, nowUtc.day, 0, 0, 0);
    final endOfDayUtc   = DateTime.utc(nowUtc.year, nowUtc.month, nowUtc.day, 23, 59, 59);

    final startIso = startOfDayUtc.toIso8601String(); // "2025-05-17T00:00:00.000Z" on the 17th, etc.
    final endIso   = endOfDayUtc.toIso8601String();   // "2025-05-17T23:59:59.000Z" on the 17th, etc.

    // <-- This line now mirrors your exact URL structure -->
    final url = '${config.supabaseUrl}/rest/v1/orders'
        '?select=order_total_payment,order_total_change,order_total_transaction'
        '&created_at=gte.$startIso'
        '&created_at=lte.$endIso';

    final headers = {
      'apikey':        config.supabaseAnonKey,
      'Authorization': 'Bearer ${config.supabaseAnonKey}',
      'Content-Type':  'application/json',
    };

    try {
      final response = await dio.get(url, options: Options(headers: headers));

      if (response.statusCode == 200) {
        final data = response.data as List?;
        if (data != null && data.isNotEmpty) {
          return RawResponse(
            status:       true,
            message:      "Fetched today's transactions",
            responseCode: 200,
            data:         data,
          );
        } else {
          return RawResponse(
            status:       false,
            message:      "No transactions found for today",
            responseCode: 404,
            data:         null,
          );
        }
      } else {
        return RawResponse(
          status:       false,
          message:      "Request failed: ${response.statusCode}",
          responseCode: response.statusCode,
          data:         null,
        );
      }
    } catch (e, stackTrace) {
      logger.e("fetchTotalTransactionTodayWithDio failed", error: e, stackTrace: stackTrace);
      return RawResponse(
        status:       false,
        message:      "An error occurred",
        responseCode: null,
        data:         null,
      );
    }
  }

  /// Fetch Total Daily Cash
  Future<RawResponse> fetchTodayDailyCashSummary({
    required String branchId,
  }) async {
    final today = DateTime.now().toUtc();
    final todayDateString = "${today.year.toString().padLeft(4, '0')}-"
        "${today.month.toString().padLeft(2, '0')}-"
        "${today.day.toString().padLeft(2, '0')}";

    final url = '${config.supabaseUrl}/rest/v1/daily_cash_summary'
        '?select=*'
        '&date=eq.$todayDateString'
        '&branch_id=eq.$branchId';

    final headers = {
      'apikey': config.supabaseAnonKey,
      'Authorization': 'Bearer ${config.supabaseAnonKey}',
      'Content-Type': 'application/json',
    };

    try {
      final response = await dio.get(url, options: Options(headers: headers));

      if (response.statusCode == 200) {
        final data = response.data as List?;
        if (data != null && data.isNotEmpty) {
          return RawResponse(
            status: true,
            message: "Fetched today's daily cash summary",
            responseCode: 200,
            data: data.first,
          );
        } else {
          return RawResponse(
            status: false,
            message: "No daily cash summary found for today",
            responseCode: 404,
            data: null,
          );
        }
      } else {
        return RawResponse(
          status: false,
          message: "Request failed: ${response.statusCode}",
          responseCode: response.statusCode,
          data: null,
        );
      }
    } catch (e, stackTrace) {
      logger.e("fetchTodayDailyCashSummary failed", error: e, stackTrace: stackTrace);
      return RawResponse(
        status: false,
        message: "An error occurred",
        responseCode: null,
        data: null,
      );
    }
  }

  Future<RawResponse> fetchExpensesByDcsId(String dcsId) async {
    final url = '${config.supabaseUrl}/rest/v1/expenses'
        '?select=expense_id,category_id,description,amount,expense_categories(category_name)'
        '&dcs_id=eq.$dcsId';

    final headers = {
      'apikey': config.supabaseAnonKey,
      'Authorization': 'Bearer ${config.supabaseAnonKey}',
      'Content-Type': 'application/json',
    };

    try {
      final response = await dio.get(url, options: Options(headers: headers));

      if (response.statusCode == 200) {
        final data = response.data as List?;
        if (data != null && data.isNotEmpty) {
          return RawResponse(
            status: true,
            message: "Fetched expenses",
            responseCode: 200,
            data: data,
          );
        } else {
          return RawResponse(
            status: false,
            message: "No expenses found",
            responseCode: 404,
            data: null,
          );
        }
      } else {
        return RawResponse(
          status: false,
          message: "Request failed: ${response.statusCode}",
          responseCode: response.statusCode,
          data: null,
        );
      }
    } catch (e, stackTrace) {
      logger.e("fetchExpensesByDcsId failed", error: e, stackTrace: stackTrace);
      return RawResponse(
        status: false,
        message: "An error occurred",
        responseCode: null,
        data: null,
      );
    }
  }

  /// Submit to DB Transaction
  /// Inserts a new order row into Supabase
  Future<RawResponse> submitCartToDB(Map<String, dynamic> orderJson) async {
    final url = '${config.supabaseUrl}/rest/v1/orders';
    final headers = {
      'apikey':        config.supabaseAnonKey,
      'Authorization': 'Bearer ${config.supabaseAnonKey}',
      'Content-Type':  'application/json',
    };

    try {
      final response = await dio.post(
        url,
        data: orderJson,
        options: Options(headers: headers),
      );

      // Supabase returns 201 on successful insert with return=minimal
      if (response.statusCode == 201) {
        return RawResponse(
          status:       true,
          message:      'Order saved successfully',
          responseCode: 201,
          data:         null,
        );
      } else {
        return RawResponse(
          status:       false,
          message:      'Insert failed: ${response.statusCode}',
          responseCode: response.statusCode,
          data:         null,
        );
      }
    } catch (e, stack) {
      logger.e('submitCartToDB failed', error: e, stackTrace: stack);
      return RawResponse(
        status:       false,
        message:      'An error occurred: $e',
        responseCode: null,
        data:         null,
      );
    }
  }

  /// Fetches the highest `id` from the `orders` table (i.e. the “last” one inserted).
  Future<RawResponse> fetchLastOrderId() async {
    final url = '${config.supabaseUrl}/rest/v1/orders'
        '?select=id'
        '&order=id.desc'
        '&limit=1';
    final headers = {
      'apikey':        config.supabaseAnonKey,
      'Authorization': 'Bearer ${config.supabaseAnonKey}',
      'Content-Type':  'application/json',
    };

    try {
      final response = await dio.get(url, options: Options(headers: headers));
      if (response.statusCode == 200) {
        final data = response.data as List<dynamic>?;
        if (data != null && data.isNotEmpty) {
          return RawResponse(
            status:       true,
            message:      'Fetched last order ID',
            responseCode: 200,
            data:         data.first['id'],
          );
        }
        return RawResponse(
          status:       false,
          message:      'No orders in database yet',
          responseCode: 404,
          data:         null,
        );
      } else {
        return RawResponse(
          status:       false,
          message:      'Request failed: ${response.statusCode}',
          responseCode: response.statusCode,
          data:         null,
        );
      }
    } catch (e, stack) {
      logger.e('fetchLastOrderId failed', error: e, stackTrace: stack);
      return RawResponse(
        status:       false,
        message:      'An error occurred: $e',
        responseCode: null,
        data:         null,
      );
    }
  }

  /// Inserts one OrderDetail row into Supabase
  Future<RawResponse> submitOrderDetail(Map<String, dynamic> detailJson) async {
    final url = '${config.supabaseUrl}/rest/v1/detail_orders';
    final headers = {
      'apikey':       config.supabaseAnonKey,
      'Authorization':'Bearer ${config.supabaseAnonKey}',
      'Content-Type': 'application/json',
    };
    try {
      final resp = await dio.post(
        url,
        data: detailJson,
        options: Options(headers: headers),
      );
      if (resp.statusCode == 201) {
        return RawResponse(
          status:       true,
          message:      'Detail saved',
          responseCode: 201,
          data:         null,
        );
      } else {
        return RawResponse(
          status:       false,
          message:      'Insert failed: ${resp.statusCode}',
          responseCode: resp.statusCode,
          data:         null,
        );
      }
    } catch (e, st) {
      logger.e('submitOrderDetail failed', error: e, stackTrace: st);
      return RawResponse(
        status:       false,
        message:      'Error: $e',
        responseCode: null,
        data:         null,
      );
    }
  }

  /// fetch order list with all data

  /// Fetch List Order
  Future<RawResponse> fetchListOrderAllWithDio() async {
    final String url =
        '${config.supabaseUrl}/rest/v1/orders?select=*,payment_methods(payment_method_name),payment_status(payment_status_name),order_status(order_status_name)';

    final headers = {
      'apikey': config.supabaseAnonKey,
      'Authorization': 'Bearer ${config.supabaseAnonKey}',
      'Content-Type': 'application/json',
    };

    try {
      final response = await dio.get(
        url,
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        final data = response.data;

        if (data is List && data.isNotEmpty) {
          List<Order> orderList = data
              .map((item) => Order.fromJson(item as Map<String, dynamic>))
              .toList();

          return RawResponse(
            status: true,
            message: "Get List Orders Success",
            responseCode: 200,
            data: orderList,
          );
        } else {
          return RawResponse(
            status: false,
            message: "No orders found",
            responseCode: 404,
            data: [],
          );
        }
      } else {
        return RawResponse(
          status: false,
          message: "Request failed with status: ${response.statusCode}",
          responseCode: response.statusCode,
          data: null,
        );
      }
    } catch (e, stackTrace) {
      logger.e("Fetch order failed", error: e, stackTrace: stackTrace);
      return RawResponse(
        status: false,
        message: "An error occurred",
        responseCode: null,
        data: null,
      );
    }
  }

  /// Fetch Update Order
  /// Update Order di Supabase via REST API
  Future<RawResponse> updateOrderWithDio({
    required String orderId,
    required Map<String, dynamic> updates,
  }) async {
    // {'order_status_id': 'OS002'}
    final String url =
        '${config.supabaseUrl}/rest/v1/orders?order_id=eq.$orderId';

    final headers = {
      'apikey': config.supabaseAnonKey,
      'Authorization': 'Bearer ${config.supabaseAnonKey}',
      'Content-Type': 'application/json',
    };

    try {
      final response = await dio.patch(
        url,
        options: Options(headers: headers),
        data: updates, // misal {'order_status_id': 'OS002'}
      );

      // Supabase akan kembalikan array of updated rows
      if (response.statusCode == 200) {
        final data = response.data;
        final updated = (data as List)
            .map((e) => Order.fromJson(e as Map<String, dynamic>))
            .toList();

        return RawResponse(
          status: true,
          message: 'Update order success',
          responseCode: 200,
          data: updated,
        );
      } else {
        return RawResponse(
          status: false,
          message: 'Failed to update (code ${response.statusCode})',
          responseCode: response.statusCode,
          data: null,
        );
      }
    } catch (e, st) {
      logger.e('updateOrderWithDio error', error: e, stackTrace: st);
      return RawResponse(
        status: false,
        message: 'An error occurred',
        responseCode: null,
        data: null,
      );
    }
  }

  /// di APIClient
  Future<RawResponse> deleteOrderWithDio({
    required String orderId,
  }) async {
    final String url =
        '${config.supabaseUrl}/rest/v1/orders?order_id=eq.$orderId';

    final headers = {
      'apikey': config.supabaseAnonKey,
      'Authorization': 'Bearer ${config.supabaseAnonKey}',
      'Content-Type': 'application/json',
      // mintalah Supabase kembalikan baris yang dihapus jika ingin verify
      'Prefer': 'return=representation',
    };

    try {
      final response = await dio.delete(
        url,
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        // response.data adalah List of deleted rows
        final deleted = (response.data as List)
            .map((e) => Order.fromJson(e as Map<String, dynamic>))
            .toList();

        return RawResponse(
          status: true,
          message: 'Delete order success',
          responseCode: 200,
          data: deleted,
        );
      } else {
        return RawResponse(
          status: false,
          message: 'Failed to delete (code ${response.statusCode})',
          responseCode: response.statusCode,
          data: null,
        );
      }
    } catch (e, st) {
      logger.e('deleteOrderWithDio error', error: e, stackTrace: st);
      return RawResponse(
        status: false,
        message: 'An error occurred',
        responseCode: null,
        data: null,
      );
    }
  }

  Future<RawResponse> fetchAllUsersWithDio() async {
    final String url =
        '${config.supabaseUrl}/rest/v1/users?select=*,role(role_name),branches(branch_name,branch_address)';

    final headers = {
      'apikey': config.supabaseAnonKey,
      'Authorization': 'Bearer ${config.supabaseAnonKey}',
      'Content-Type': 'application/json',
    };

    try {
      final response = await dio.get(
        url,
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        final data = response.data;

        return RawResponse(
          status: true,
          message: "Fetched all users",
          responseCode: 200,
          data: data, // this will be List<dynamic>
        );
      } else {
        return RawResponse(
          status: false,
          message: "Failed with status: ${response.statusCode}",
          responseCode: response.statusCode,
          data: null,
        );
      }
    } catch (e, stackTrace) {
      logger.e("Fetch users failed", error: e, stackTrace: stackTrace);
      return RawResponse(
        status: false,
        message: "An error occurred",
        responseCode: null,
        data: null,
      );
    }
  }

  Future<RawResponse> fetchDailyCashSummariesWithDio() async {
    final String url = '${config.supabaseUrl}/rest/v1/daily_cash_summary?select=*';

    final headers = {
      'apikey': config.supabaseAnonKey,
      'Authorization': 'Bearer ${config.supabaseAnonKey}',
      'Content-Type': 'application/json',
    };

    try {

         final response = await dio.get(
        url,
        options: Options(
          headers: headers,
          sendTimeout: Duration(seconds: 10),
          receiveTimeout: Duration(seconds: 15),
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data;

        logger.d("Fetched data: ${data.runtimeType} - $data");

        return RawResponse(
          status: true,
          message: "Fetched daily cash summaries",
          responseCode: 200,
          data: data,
        );
      } else {
        return RawResponse(
          status: false,
          message: "Failed with status: ${response.statusCode}",
          responseCode: response.statusCode,
          data: null,

        );
      }
    } catch (e, stackTrace) {
      logger.e("Fetch daily cash summaries failed", error: e, stackTrace: stackTrace);
      return RawResponse(
        status: false,
        message: "An error occurred",
        responseCode: null,
        data: null,
      );
    }
  }

  Future<RawResponse> fetchExpensesWithDio() async {
    final String url = '${config.supabaseUrl}/rest/v1/expenses?select=*';

    final headers = {
      'apikey': config.supabaseAnonKey,
      'Authorization': 'Bearer ${config.supabaseAnonKey}',
      'Content-Type': 'application/json',
    };

    try {
      final response = await dio.get(
        url,
        options: Options(
          headers: headers,
          sendTimeout: Duration(seconds: 10),
          receiveTimeout: Duration(seconds: 15),
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data;

        logger.d("Fetched expenses: ${data.runtimeType} - $data");

        return RawResponse(
          status: true,
          message: "Fetched expenses",
          responseCode: 200,
          data: data, // ← bisa diganti parsing ke List<Expense> jika kamu punya model
        );
      } else {
        return RawResponse(
          status: false,
          message: "Failed with status: ${response.statusCode}",
          responseCode: response.statusCode,
          data: null,
        );
      }
    } catch (e, stackTrace) {
      logger.e("Fetch expenses failed", error: e, stackTrace: stackTrace);
      return RawResponse(
        status: false,
        message: "An error occurred",
        responseCode: null,
        data: null,
      );
    }
  }

  /// Update Daily Cash Summaries by unique dcs_id
  Future<RawResponse> updateDailyCashSummaries({
    required String dcsId,
    required Map<String, dynamic> payload,
  }) async {
    final base = '${config.supabaseUrl}/rest/v1/daily_cash_summary';
    final patchUrl = '$base?dcs_id=eq.$dcsId'; // ← penting

    final headers = {
      'apikey':        config.supabaseAnonKey,
      'Authorization': 'Bearer ${config.supabaseAnonKey}',
      'Content-Type':  'application/json',
    };

    try {
      final resp = await dio.patch(
        patchUrl,
        data: payload,
        options: Options(headers: headers),
      );

      // 200: sukses + body (array). 204: sukses tanpa body (misal SELECT tidak diizinkan)
      if (resp.statusCode == 200) {
        return RawResponse(
          status: true,
          message: 'Patched DCS',
          responseCode: 200,
          data: resp.data, // biasanya List<Map> satu elemen; cek di pemanggil
        );
      }

      if (resp.statusCode == 204) {
        // Fallback ambil data terbaru (kalau SELECT diizinkan)
        return RawResponse(
          status: true,
          message: 'Patched DCS (no body)',
          responseCode: 204,
          data: null,
        );
      }

      return RawResponse(
        status: false,
        message: 'Patch failed: ${resp.statusCode} ${resp.statusMessage ?? ""}',
        responseCode: resp.statusCode,
        data: resp.data,
      );
    } on DioException catch (e, st) {
      logger.e('updateDailyCashSummaries failed', error: e, stackTrace: st);
      return RawResponse(
        status: false,
        message: 'Error: ${e.response?.data ?? e.message}',
        responseCode: e.response?.statusCode,
        data: e.response?.data,
      );
    } catch (e, st) {
      logger.e('updateDailyCashSummaries failed', error: e, stackTrace: st);
      return RawResponse(status: false, message: 'Error: $e', responseCode: null, data: null);
    }
  }


  // APIClient.dart
  Future<RawResponse> createExpense({
    required Map<String, dynamic> payload,
  }) async {
    final url = '${config.supabaseUrl}/rest/v1/expenses'; // ganti kalau nama tabel beda
    final headers = {
      'apikey':        config.supabaseAnonKey,
      'Authorization': 'Bearer ${config.supabaseAnonKey}',
      'Content-Type':  'application/json',
      'Accept':        'application/json',
      'Prefer':        'return=representation', // balikin row yg diinsert
    };

    try {
      final resp = await dio.post(url, data: payload, options: Options(headers: headers));

      // Supabase biasanya 201 (Created) saat insert; 200 juga OK
      if (resp.statusCode == 201 || resp.statusCode == 200) {
        return RawResponse(status: true, message: 'Created expense', responseCode: resp.statusCode, data: resp.data);
      }
      return RawResponse(status: false, message: 'Insert failed: ${resp.statusCode}', responseCode: resp.statusCode, data: resp.data);
    } on DioException catch (e, st) {
      logger.e('createExpense failed', error: e, stackTrace: st);
      return RawResponse(status: false, message: 'Error: ${e.message}', responseCode: e.response?.statusCode, data: e.response?.data);
    } catch (e, st) {
      logger.e('createExpense failed', error: e, stackTrace: st);
      return RawResponse(status: false, message: 'Error: $e', responseCode: null, data: null);
    }
  }


}
