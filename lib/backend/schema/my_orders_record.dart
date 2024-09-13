import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MyOrdersRecord extends FirestoreRecord {
  MyOrdersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "Status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "CarName" field.
  String? _carName;
  String get carName => _carName ?? '';
  bool hasCarName() => _carName != null;

  // "RentPrice" field.
  int? _rentPrice;
  int get rentPrice => _rentPrice ?? 0;
  bool hasRentPrice() => _rentPrice != null;

  // "OwnerEmail" field.
  String? _ownerEmail;
  String get ownerEmail => _ownerEmail ?? '';
  bool hasOwnerEmail() => _ownerEmail != null;

  // "RenterEmail" field.
  String? _renterEmail;
  String get renterEmail => _renterEmail ?? '';
  bool hasRenterEmail() => _renterEmail != null;

  // "OwnerPhone" field.
  int? _ownerPhone;
  int get ownerPhone => _ownerPhone ?? 0;
  bool hasOwnerPhone() => _ownerPhone != null;

  // "RenterPhone" field.
  int? _renterPhone;
  int get renterPhone => _renterPhone ?? 0;
  bool hasRenterPhone() => _renterPhone != null;

  // "Image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "LicenceImage" field.
  String? _licenceImage;
  String get licenceImage => _licenceImage ?? '';
  bool hasLicenceImage() => _licenceImage != null;

  // "NoOrder" field.
  String? _noOrder;
  String get noOrder => _noOrder ?? '';
  bool hasNoOrder() => _noOrder != null;

  // "renterName" field.
  String? _renterName;
  String get renterName => _renterName ?? '';
  bool hasRenterName() => _renterName != null;

  // "renterimage" field.
  String? _renterimage;
  String get renterimage => _renterimage ?? '';
  bool hasRenterimage() => _renterimage != null;

  void _initializeFields() {
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _status = snapshotData['Status'] as bool?;
    _carName = snapshotData['CarName'] as String?;
    _rentPrice = castToType<int>(snapshotData['RentPrice']);
    _ownerEmail = snapshotData['OwnerEmail'] as String?;
    _renterEmail = snapshotData['RenterEmail'] as String?;
    _ownerPhone = castToType<int>(snapshotData['OwnerPhone']);
    _renterPhone = castToType<int>(snapshotData['RenterPhone']);
    _image = snapshotData['Image'] as String?;
    _licenceImage = snapshotData['LicenceImage'] as String?;
    _noOrder = snapshotData['NoOrder'] as String?;
    _renterName = snapshotData['renterName'] as String?;
    _renterimage = snapshotData['renterimage'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('MyOrders');

  static Stream<MyOrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MyOrdersRecord.fromSnapshot(s));

  static Future<MyOrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MyOrdersRecord.fromSnapshot(s));

  static MyOrdersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MyOrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MyOrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MyOrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MyOrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MyOrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMyOrdersRecordData({
  DateTime? createdTime,
  bool? status,
  String? carName,
  int? rentPrice,
  String? ownerEmail,
  String? renterEmail,
  int? ownerPhone,
  int? renterPhone,
  String? image,
  String? licenceImage,
  String? noOrder,
  String? renterName,
  String? renterimage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'createdTime': createdTime,
      'Status': status,
      'CarName': carName,
      'RentPrice': rentPrice,
      'OwnerEmail': ownerEmail,
      'RenterEmail': renterEmail,
      'OwnerPhone': ownerPhone,
      'RenterPhone': renterPhone,
      'Image': image,
      'LicenceImage': licenceImage,
      'NoOrder': noOrder,
      'renterName': renterName,
      'renterimage': renterimage,
    }.withoutNulls,
  );

  return firestoreData;
}

class MyOrdersRecordDocumentEquality implements Equality<MyOrdersRecord> {
  const MyOrdersRecordDocumentEquality();

  @override
  bool equals(MyOrdersRecord? e1, MyOrdersRecord? e2) {
    return e1?.createdTime == e2?.createdTime &&
        e1?.status == e2?.status &&
        e1?.carName == e2?.carName &&
        e1?.rentPrice == e2?.rentPrice &&
        e1?.ownerEmail == e2?.ownerEmail &&
        e1?.renterEmail == e2?.renterEmail &&
        e1?.ownerPhone == e2?.ownerPhone &&
        e1?.renterPhone == e2?.renterPhone &&
        e1?.image == e2?.image &&
        e1?.licenceImage == e2?.licenceImage &&
        e1?.noOrder == e2?.noOrder &&
        e1?.renterName == e2?.renterName &&
        e1?.renterimage == e2?.renterimage;
  }

  @override
  int hash(MyOrdersRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.status,
        e?.carName,
        e?.rentPrice,
        e?.ownerEmail,
        e?.renterEmail,
        e?.ownerPhone,
        e?.renterPhone,
        e?.image,
        e?.licenceImage,
        e?.noOrder,
        e?.renterName,
        e?.renterimage
      ]);

  @override
  bool isValidKey(Object? o) => o is MyOrdersRecord;
}
