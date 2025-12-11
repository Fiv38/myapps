import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:characters/characters.dart';
import '../models/receipt_item.dart';

class ReceiptBuilder {
  final _rupiah = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp. ', decimalDigits: 0);
  String _format(num v) => _rupiah.format(v);

  String rightAlign(String left, String right, {int width = 76}) {
    final n = (width - left.length - right.length);
    return '$left${' ' * (n >= 1 ? n : 1)}$right';
  }

  String build({
    required String storeName,
    String? storeAddress,
    String? storePhone,
    required String notaNumber,
    required DateTime dateTime,
    required String cashierName,
    required String customerName,
    required String jenisLayanan,
    required String statusPembayaran,
    required String caraPembayaran,
    required List<ReceiptItem> items,
    required num totalPembayaran,
    DateTime? estimasiSelesai,
    String? statusUmum,
    String? dilunasi,
    String? diambil,
    String? catatanTambahan,
    int lineWidth = 42, // 58mm ≈ 32 char; 80mm ≈ 42
  }) {
    final dmy = DateFormat('dd/MM/yyyy - HH:mm', 'id_ID').format(dateTime);
    final est = estimasiSelesai != null
        ? DateFormat('dd/MM/yyyy - HH:mm', 'id_ID').format(estimasiSelesai)
        : null;

    final sb = StringBuffer();
    // NOTE: hapus fence ini kalau output ke printer thermal asli
    sb.writeln('```');

    // ===== Header (center) =====
    _writelnWrap(sb, storeName.toUpperCase(), lineWidth, align: WrapAlign.center);
    if ((storeAddress ?? '').trim().isNotEmpty) {
      _writelnWrap(sb, storeAddress!.trim(), lineWidth, align: WrapAlign.center);
    }
    if ((storePhone ?? '').trim().isNotEmpty) {
      _writelnWrap(sb, 'No. HP $storePhone', lineWidth, align: WrapAlign.center);
    }

    sb.writeln('=' * lineWidth);

    // ===== Info kiri:label / kanan:value =====
    _kvWrap(sb, 'Tanggal', dmy, lineWidth);
    _kvWrap(sb, 'No Nota', notaNumber, lineWidth);
    _kvWrap(sb, 'Kasir', cashierName, lineWidth);
    _kvWrap(sb, 'Nama', customerName.isEmpty ? '-' : customerName, lineWidth);

    sb.writeln('=' * lineWidth);
    _kvWrap(sb, 'Jenis Layanan', jenisLayanan, lineWidth);
    _kvWrap(sb, 'Status Pembayaran', statusPembayaran, lineWidth);
    _kvWrap(sb, 'Cara Pembayaran', caraPembayaran, lineWidth);

    sb.writeln('');
    _writelnWrap(sb, 'List Item', lineWidth);

    // ===== Items =====
    for (final it in items) {
      final subtotal = it.price * it.qty;
      _writelnWrap(sb, '- ${it.name}', lineWidth, hangingIndent: 2);
      if ((it.keterangan).trim().isNotEmpty) {
        _writelnWrap(sb, ' Ket : ${it.keterangan}', lineWidth, hangingIndent: 2);
      }
      final left = 'x${it.qty}';
      final right = _format(subtotal);
      sb.writeln(_lr(left, right, lineWidth, minSpace: 1));
    }

    sb.writeln('');
    sb.writeln(_lr('Total Pembayaran', _format(totalPembayaran), lineWidth, minSpace: 1));
    sb.writeln('');
    sb.writeln('-' * lineWidth);

    // ===== Estimasi selesai =====
    if (est != null) {
      _writelnWrap(sb, 'Perkiraan Selesai :', lineWidth);
      _writelnWrap(sb, est, lineWidth);
      sb.writeln('=' * lineWidth);
    }

    // ===== Status akhir =====
    if (statusUmum != null) _kvWrap(sb, 'Status', statusUmum, lineWidth);
    if (dilunasi != null)   _kvWrap(sb, 'Dilunasi', dilunasi, lineWidth);
    if (diambil != null)    _kvWrap(sb, 'Diambil', diambil, lineWidth);
    if (statusUmum != null || dilunasi != null || diambil != null) {
      sb.writeln('=' * lineWidth);
    }

    // ===== Footer =====
    _writelnWrap(sb, 'PERHATIAN!!', lineWidth);
    _writelnWrap(sb, 'Komplain kami layani 2 x 24 jam disertakan Nota Transaksi.', lineWidth);
    _writelnWrap(sb, 'KAMI TIDAK BERTANGGUNG JAWAB ATAS:', lineWidth);
    _writelnWrap(sb, '• Susut atau luntur karena sifat bahannya.', lineWidth, prefix: '');
    _writelnWrap(sb, '• Pengambilan laundry >15 hari dari hari penyerahan.', lineWidth, prefix: '');
    _writelnWrap(sb, '• Barang berharga yang terbawa di dalam cucian.', lineWidth, prefix: '');
    sb.writeln('');
    sb.writeln('');
    _writelnWrap(sb, 'Terima kasih telah menggunakan jasa kami, sepatumu kotor ?', lineWidth);
    _writelnWrap(sb, 'Cuci di *MaxClean* aja', lineWidth);
    sb.writeln('');
    if ((catatanTambahan ?? '').trim().isNotEmpty) {
      sb.writeln('');
      _writelnWrap(sb, catatanTambahan!.trim(), lineWidth);
    }

    sb.writeln('```');
    return sb.toString();
  }
}

/// ===== Helpers =====
enum WrapAlign { left, center }

void _writelnWrap(
    StringBuffer sb,
    String text,
    int width, {
      String prefix = '',
      int hangingIndent = 0,
      WrapAlign align = WrapAlign.left,
    }) {
  if (text.isEmpty) {
    sb.writeln('');
    return;
  }
  final words = text.split(RegExp(r'\s+'));
  final lines = <String>[];
  var line = '';

  for (final w in words) {
    final candidate = line.isEmpty ? w : '$line $w';
    final avail = width - (lines.isEmpty ? prefix.length : hangingIndent);
    if (candidate.characters.length <= avail) {
      line = candidate;
    } else {
      lines.add(line);
      line = w;
    }
  }
  if (line.isNotEmpty) lines.add(line);

  for (var i = 0; i < lines.length; i++) {
    final isFirst = i == 0;
    final padLeft = isFirst ? prefix.length : hangingIndent;
    final raw = (' ' * padLeft) + lines[i];
    if (align == WrapAlign.center) {
      sb.writeln(_center(raw, width));
    } else {
      sb.writeln(raw);
    }
  }
}

/// Label kiri + ":" + value kanan; wrap jika tak muat
void _kvWrap(StringBuffer sb, String label, String value, int width) {
  final lab = '$label :';
  final oneLine = _lr(lab, value, width, minSpace: 1);
  if (oneLine.characters.length <= width) {
    sb.writeln(oneLine);
    return;
  }
  // bungkus label ke beberapa baris, value di baris terakhir (kanan)
  _writelnWrap(sb, lab, width);
  sb.writeln(_lr('', value, width, minSpace: 0));
}

/// Buat "left .... right" lebar tetap; value selalu menempel kanan.
String _lr(String left, String right, int width, {int minSpace = 1}) {
  final maxLeft = (width - right.characters.length - minSpace).clamp(0, width);
  var l = left;
  if (l.characters.length > maxLeft) {
    l = l.characters.take(maxLeft).toString();
  }
  final spaces = (width - l.characters.length - right.characters.length).clamp(0, width);
  return '$l${' ' * spaces}$right';
}

String _center(String s, int width) {
  final len = s.characters.length;
  if (len >= width) return s.characters.take(width).toString();
  final pad = width - len;
  final left = pad ~/ 2;
  final right = pad - left;
  return '${' ' * left}$s${' ' * right}';
}
