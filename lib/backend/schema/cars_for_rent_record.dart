import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarsForRentRecord extends FirestoreRecord {
  CarsForRentRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "CarName" field.
  String? _carName;
  String get carName => _carName ?? '';
  bool hasCarName() => _carName != null;

  // "Model" field.
  int? _model;
  int get model => _model ?? 0;
  bool hasModel() => _model != null;

  // "Owner" field.
  String? _owner;
  String get owner => _owner ?? '';
  bool hasOwner() => _owner != null;

  // "Location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "RentPrice" field.
  int? _rentPrice;
  int get rentPrice => _rentPrice ?? 0;
  bool hasRentPrice() => _rentPrice != null;

  // "TimeAvalibale" field.
  String? _timeAvalibale;
  String get timeAvalibale => _timeAvalibale ?? '';
  bool hasTimeAvalibale() => _timeAvalibale != null;

  // "CarOwner" field.
  DocumentReference? _carOwner;
  DocumentReference? get carOwner => _carOwner;
  bool hasCarOwner() => _carOwner != null;

  // "OwnerPhone" field.
  String? _ownerPhone;
  String get ownerPhone => _ownerPhone ?? '';
  bool hasOwnerPhone() => _ownerPhone != null;

  // "OwnerEmail" field.
  String? _ownerEmail;
  String get ownerEmail => _ownerEmail ?? '';
  bool hasOwnerEmail() => _ownerEmail != null;

  // "IsLive" field.
  bool? _isLive;
  bool get isLive => _isLive ?? false;
  bool hasIsLive() => _isLive != null;

  // "MainImage" field.
  String? _mainImage;
  String get mainImage => _mainImage ?? '';
  bool hasMainImage() => _mainImage != null;

  // "DateAdded" field.
  DateTime? _dateAdded;
  DateTime? get dateAdded => _dateAdded;
  bool hasDateAdded() => _dateAdded != null;

  // "Category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "AvilableTo" field.
  DateTime? _avilableTo;
  DateTime? get avilableTo => _avilableTo;
  bool hasAvilableTo() => _avilableTo != null;

  void _initializeFields() {
    _carName = snapshotData['CarName'] as String?;
    _model = castToType<int>(snapshotData['Model']);
    _owner = snapshotData['Owner'] as String?;
    _location = snapshotData['Location'] as String?;
    _rentPrice = castToType<int>(snapshotData['RentPrice']);
    _timeAvalibale = snapshotData['TimeAvalibale'] as String?;
    _carOwner = snapshotData['CarOwner'] as DocumentReference?;
    _ownerPhone = snapshotData['OwnerPhone'] as String?;
    _ownerEmail = snapshotData['OwnerEmail'] as String?;
    _isLive = snapshotData['IsLive'] as bool?;
    _mainImage = snapshotData['MainImage'] as String?;
    _dateAdded = snapshotData['DateAdded'] as DateTime?;
    _category = snapshotData['Category'] as String?;
    _avilableTo = snapshotData['AvilableTo'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('CarsForRent');

  static Stream<CarsForRentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CarsForRentRecord.fromSnapshot(s));

  static Future<CarsForRentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CarsForRentRecord.fromSnapshot(s));

  static CarsForRentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CarsForRentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CarsForRentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CarsForRentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CarsForRentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CarsForRentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCarsForRentRecordData({
  String? carName,
  int? model,
  String? owner,
  String? location,
  int? rentPrice,
  String? timeAvalibale,
  DocumentReference? carOwner,
  String? ownerPhone,
  String? ownerEmail,
  bool? isLive,
  String? mainImage,
  DateTime? dateAdded,
  String? category,
  DateTime? avilableTo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'CarName': carName,
      'Model': model,
      'Owner': owner,
      'Location': location,
      'RentPrice': rentPrice,
      'TimeAvalibale': timeAvalibale,
      'CarOwner': carOwner,
      'OwnerPhone': ownerPhone,
      'OwnerEmail': ownerEmail,
      'IsLive': isLive,
      'MainImage': mainImage,
      'DateAdded': dateAdded,
      'Category': category,
      'AvilableTo': avilableTo,
    }.withoutNulls,
  );

  return firestoreData;
}

class CarsForRentRecordDocumentEquality implements Equality<CarsForRentRecord> {
  const CarsForRentRecordDocumentEquality();

  @override
  bool equals(CarsForRentRecord? e1, CarsForRentRecord? e2) {
    return e1?.carName == e2?.carName &&
        e1?.model == e2?.model &&
        e1?.owner == e2?.owner &&
        e1?.location == e2?.location &&
        e1?.rentPrice == e2?.rentPrice &&
        e1?.timeAvalibale == e2?.timeAvalibale &&
        e1?.carOwner == e2?.carOwner &&
        e1?.ownerPhone == e2?.ownerPhone &&
        e1?.ownerEmail == e2?.ownerEmail &&
        e1?.isLive == e2?.isLive &&
        e1?.mainImage == e2?.mainImage &&
        e1?.dateAdded == e2?.dateAdded &&
        e1?.category == e2?.category &&
        e1?.avilableTo == e2?.avilableTo;
  }

  @override
  int hash(CarsForRentRecord? e) => const ListEquality().hash([
        e?.carName,
        e?.model,
        e?.owner,
        e?.location,
        e?.rentPrice,
        e?.timeAvalibale,
        e?.carOwner,
        e?.ownerPhone,
        e?.ownerEmail,
        e?.isLive,
        e?.mainImage,
        e?.dateAdded,
        e?.category,
        e?.avilableTo
      ]);

  @override
  bool isValidKey(Object? o) => o is CarsForRentRecord;
}
