// To parse this JSON data, do
//
//     final paymentsModel = paymentsModelFromJson(jsonString);

import 'dart:convert';

PaymentsModel paymentsModelFromJson(String str) =>
    PaymentsModel.fromJson(json.decode(str));

String paymentsModelToJson(PaymentsModel data) => json.encode(data.toJson());

class PaymentsModel {
  PaymentsModel({
    required this.data,
  });

  List<PaymentModel> data;

  factory PaymentsModel.fromJson(Map<String, dynamic> json) => PaymentsModel(
        data: List<PaymentModel>.from(
            json["data"].map((x) => PaymentModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class PaymentModel {
  PaymentModel({
    required this.id,
    required this.namaClient,
    required this.tunaiKeseluruhan,
    required this.tanggal,
    required this.status,
    required this.keterangan,
    required this.createdAt,
    required this.updatedAt,
    required this.paymentDetails,
  });

  int id;
  String namaClient;
  int tunaiKeseluruhan;
  DateTime tanggal;
  String status;
  String keterangan;
  DateTime createdAt;
  DateTime updatedAt;
  List<PaymentDetailModel> paymentDetails;

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
        id: json["id"],
        namaClient: json["nama_client"],
        tunaiKeseluruhan: json["tunai_keseluruhan"],
        tanggal: DateTime.parse(json["tanggal"]),
        status: json["status"],
        keterangan: json["keterangan"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        paymentDetails: List<PaymentDetailModel>.from(
            json["payment_details"].map((x) => PaymentDetailModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_client": namaClient,
        "tunai_keseluruhan": tunaiKeseluruhan,
        "tanggal":
            "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
        "status": status,
        "keterangan": keterangan,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "payment_details":
            List<dynamic>.from(paymentDetails.map((x) => x.toJson())),
      };
}

class PaymentDetailModel {
  PaymentDetailModel({
    required this.id,
    required this.namaPayment,
    required this.bayar,
    required this.tanggal,
    required this.detail,
    required this.paymentId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String namaPayment;
  int bayar;
  DateTime tanggal;
  String detail;
  int paymentId;
  DateTime createdAt;
  DateTime updatedAt;

  factory PaymentDetailModel.fromJson(Map<String, dynamic> json) =>
      PaymentDetailModel(
        id: json["id"],
        namaPayment: json["nama_payment"],
        bayar: json["bayar"],
        tanggal: DateTime.parse(json["tanggal"]),
        detail: json["detail"],
        paymentId: json["payment_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_payment": namaPayment,
        "bayar": bayar,
        "tanggal": tanggal.toIso8601String(),
        "detail": detail,
        "payment_id": paymentId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
