import 'package:flutter/foundation.dart'; // for debugPrint
import 'package:url_launcher/url_launcher.dart';

class WaService {
  // --- util logging kecil dengan timestamp ---
  void _log(String tag, String msg) {
    final ts = DateTime.now().toIso8601String();
    debugPrint('[WA][$tag][$ts] $msg');
  }

  String normalize(String raw) {
    _log('NORMALIZE', 'raw="$raw"');
    var s = raw.replaceAll(RegExp(r'[^0-9+]'), '');
    _log('NORMALIZE', 'strip non-digit/plus -> "$s"');

    if (s.startsWith('+')) {
      s = s.substring(1);
      _log('NORMALIZE', 'removed leading plus -> "$s"');
    }
    if (s.startsWith('0')) {
      s = '62${s.substring(1)}';
      _log('NORMALIZE', 'leading 0 -> 62..., now "$s"');
    }

    s = s.replaceAll(RegExp(r'[^0-9]'), '');
    _log('NORMALIZE', 'final="$s"');
    return s;
  }

  bool isValid(String phone62) {
    final ok = RegExp(r'^62\d{8,13}$').hasMatch(phone62);
    _log('VALIDATE', 'phone="$phone62" -> $ok');
    return ok;
  }

  Future<void> send({required String phone, required String message}) async {
    final sw = Stopwatch()..start();

    // Log awal
    _log('SEND', 'in: phone="$phone", message.len=${message.length}');

    final encoded = Uri.encodeComponent(message);
    final appUri = Uri.parse('whatsapp://send?phone=$phone&text=$encoded');
    final webUri = Uri.parse('https://wa.me/$phone?text=$encoded');

    try {
      _log('LAUNCH_APP', 'uri=$appUri');
      final okApp = await launchUrl(appUri, mode: LaunchMode.externalApplication);
      _log('LAUNCH_APP', 'result=$okApp (${sw.elapsedMilliseconds}ms)');

      if (okApp) {
        sw.stop();
        _log('DONE', 'opened via APP in ${sw.elapsedMilliseconds}ms');
        return;
      }

      _log('FALLBACK_WEB', 'trying web uri=$webUri');
      final okWeb = await launchUrl(webUri, mode: LaunchMode.externalApplication);
      _log('FALLBACK_WEB', 'result=$okWeb (${sw.elapsedMilliseconds}ms)');

      sw.stop();
      if (okWeb) {
        _log('DONE', 'opened via WEB in ${sw.elapsedMilliseconds}ms');
      } else {
        _log('ERROR', 'both APP and WEB failed (${sw.elapsedMilliseconds}ms)');
      }
    } catch (e, st) {
      sw.stop();
      _log('EXCEPTION', 'error=$e\n$st');
      rethrow; // biar caller bisa nangani (toast, dsb)
    }
  }
}
