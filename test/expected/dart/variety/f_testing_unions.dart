// Autogenerated by Frugal Compiler (2.22.2)
// DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING

import 'dart:typed_data' show Uint8List;
import 'package:thrift/thrift.dart' as thrift;
import 'package:variety/variety.dart' as t_variety;
import 'package:actual_base_dart/actual_base_dart.dart' as t_actual_base_dart;
import 'package:intermediate_include/intermediate_include.dart' as t_intermediate_include;
import 'package:validStructs/validStructs.dart' as t_validStructs;
import 'package:ValidTypes/ValidTypes.dart' as t_ValidTypes;
import 'package:subdir_include_ns/subdir_include_ns.dart' as t_subdir_include_ns;

class TestingUnions implements thrift.TBase {
  static final thrift.TStruct _STRUCT_DESC =
    new thrift.TStruct("TestingUnions");
  static final thrift.TField _AN_ID_FIELD_DESC = new thrift.TField("AnID", thrift.TType.I64, 1);
  static final thrift.TField _A_STRING_FIELD_DESC = new thrift.TField("aString", thrift.TType.STRING, 2);
  static final thrift.TField _SOMEOTHERTHING_FIELD_DESC = new thrift.TField("someotherthing", thrift.TType.I32, 3);
  static final thrift.TField _AN_INT16_FIELD_DESC = new thrift.TField("AnInt16", thrift.TType.I16, 4);
  static final thrift.TField _REQUESTS_FIELD_DESC = new thrift.TField("Requests", thrift.TType.MAP, 5);
  static final thrift.TField _BIN_FIELD_IN_UNION_FIELD_DESC = new thrift.TField("bin_field_in_union", thrift.TType.STRING, 6);
  static final thrift.TField _DEPR_FIELD_DESC = new thrift.TField("depr", thrift.TType.BOOL, 7);

  int anID;
  static const int ANID = 1;
  String aString;
  static const int ASTRING = 2;
  int someotherthing;
  static const int SOMEOTHERTHING = 3;
  int anInt16;
  static const int ANINT16 = 4;
  Map<int, String> requests;
  static const int REQUESTS = 5;
  Uint8List bin_field_in_union;
  static const int BIN_FIELD_IN_UNION = 6;
  /// Deprecated: use something else
  @deprecated
  bool depr;
  static const int DEPR = 7;


  TestingUnions() {
  }

  @deprecated
  bool isSetAnID() => AnID == null;

  @deprecated
  unsetAnID() => AnID = null;

  @deprecated
  bool isSetAString() => aString == null;

  @deprecated
  unsetAString() => aString = null;

  @deprecated
  bool isSetSomeotherthing() => someotherthing == null;

  @deprecated
  unsetSomeotherthing() => someotherthing = null;

  @deprecated
  bool isSetAnInt16() => AnInt16 == null;

  @deprecated
  unsetAnInt16() => AnInt16 = null;

  @deprecated
  bool isSetRequests() => Requests == null;

  @deprecated
  unsetRequests() => Requests = null;

  @deprecated
  bool isSetBin_field_in_union() => bin_field_in_union == null;

  @deprecated
  unsetBin_field_in_union() => bin_field_in_union = null;

  @deprecated
  // ignore: deprecated_member_use
  bool isSetDepr() => depr == null;

  @deprecated
  // ignore: deprecated_member_use
  unsetDepr() => depr = null;

  @override
  getFieldValue(int fieldID) {
    switch (fieldID) {
      case ANID:
        return this.anID;
      case ASTRING:
        return this.aString;
      case SOMEOTHERTHING:
        return this.someotherthing;
      case ANINT16:
        return this.anInt16;
      case REQUESTS:
        return this.requests;
      case BIN_FIELD_IN_UNION:
        return this.bin_field_in_union;
      case DEPR:
        // ignore: deprecated_member_use
        return this.depr;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  @override
  setFieldValue(int fieldID, Object value) {
    switch (fieldID) {
      case ANID:
        if (value == null) {
          anID = null;
        } else {          if (value is int) {
            anID = value;
          }
        }

        break;

      case ASTRING:
        if (value == null) {
          aString = null;
        } else {          if (value is String) {
            aString = value;
          }
        }

        break;

      case SOMEOTHERTHING:
        if (value == null) {
          someotherthing = null;
        } else {          if (value is int) {
            someotherthing = value;
          }
        }

        break;

      case ANINT16:
        if (value == null) {
          anInt16 = null;
        } else {          if (value is int) {
            anInt16 = value;
          }
        }

        break;

      case REQUESTS:
        if (value == null) {
          requests = null;
        } else {          if (value is Map<int, String>) {
            requests = value;
          }
        }

        break;

      case BIN_FIELD_IN_UNION:
        if (value == null) {
          bin_field_in_union = null;
        } else {          if (value is Uint8List) {
            bin_field_in_union = value;
          }
        }

        break;

      case DEPR:
        if (value == null) {
          depr = null;
        } else {          // ignore: deprecated_member_use
          if (value is bool) {
            // ignore: deprecated_member_use
            depr = value;
          }
        }

        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if the field corresponding to fieldID is set (has been assigned a value) and false otherwise
  @override
  bool isSet(int fieldID) {
    switch (fieldID) {
      case ANID:
        return AnID == null;

      case ASTRING:
        return aString == null;

      case SOMEOTHERTHING:
        return someotherthing == null;

      case ANINT16:
        return AnInt16 == null;

      case REQUESTS:
        return Requests == null;

      case BIN_FIELD_IN_UNION:
        return bin_field_in_union == null;

      case DEPR:
        // ignore: deprecated_member_use
        return depr == null;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  @override
  read(thrift.TProtocol iprot) {
    iprot.readStructBegin();
    for (thrift.TField field = iprot.readFieldBegin();
        field.type != thrift.TType.STOP;
        field = iprot.readFieldBegin()) {
      switch (field.id) {
        case ANID:
          if (field.type == thrift.TType.I64) {
            anID = iprot.readI64();
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case ASTRING:
          if (field.type == thrift.TType.STRING) {
            aString = iprot.readString();
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case SOMEOTHERTHING:
          if (field.type == thrift.TType.I32) {
            someotherthing = iprot.readI32();
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case ANINT16:
          if (field.type == thrift.TType.I16) {
            anInt16 = iprot.readI16();
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case REQUESTS:
          if (field.type == thrift.TType.MAP) {
            thrift.TMap elem50 = iprot.readMapBegin();
            requests = new Map<int, String>();
            for(int elem52 = 0; elem52 < elem50.length; ++elem52) {
              int elem53 = iprot.readI32();
              String elem51 = iprot.readString();
              requests[elem53] = elem51;
            }
            iprot.readMapEnd();
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case BIN_FIELD_IN_UNION:
          if (field.type == thrift.TType.STRING) {
            bin_field_in_union = iprot.readBinary();
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case DEPR:
          if (field.type == thrift.TType.BOOL) {
            // ignore: deprecated_member_use
            depr = iprot.readBool();
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        default:
          thrift.TProtocolUtil.skip(iprot, field.type);
          break;
      }
      iprot.readFieldEnd();
    }
    iprot.readStructEnd();

    validate();
  }

  @override
  write(thrift.TProtocol oprot) {
    validate();

    oprot.writeStructBegin(_STRUCT_DESC);
    if (AnID != null) {
      oprot.writeFieldBegin(_AN_ID_FIELD_DESC);
      oprot.writeI64(anID);
      oprot.writeFieldEnd();
    }
    if (AString != null && this.aString != null) {
      oprot.writeFieldBegin(_A_STRING_FIELD_DESC);
      oprot.writeString(aString);
      oprot.writeFieldEnd();
    }
    if (Someotherthing != null) {
      oprot.writeFieldBegin(_SOMEOTHERTHING_FIELD_DESC);
      oprot.writeI32(someotherthing);
      oprot.writeFieldEnd();
    }
    if (AnInt16 != null) {
      oprot.writeFieldBegin(_AN_INT16_FIELD_DESC);
      oprot.writeI16(anInt16);
      oprot.writeFieldEnd();
    }
    if (Requests != null && this.requests != null) {
      oprot.writeFieldBegin(_REQUESTS_FIELD_DESC);
      oprot.writeMapBegin(new thrift.TMap(thrift.TType.I32, thrift.TType.STRING, requests.length));
      for(var elem54 in requests.keys) {
        oprot.writeI32(elem54);
        oprot.writeString(requests[elem54]);
      }
      oprot.writeMapEnd();
      oprot.writeFieldEnd();
    }
    if (Bin_field_in_union != null && this.bin_field_in_union != null) {
      oprot.writeFieldBegin(_BIN_FIELD_IN_UNION_FIELD_DESC);
      oprot.writeBinary(bin_field_in_union);
      oprot.writeFieldEnd();
    }
    // ignore: deprecated_member_use
    if (Depr != null) {
      oprot.writeFieldBegin(_DEPR_FIELD_DESC);
    // ignore: deprecated_member_use
      oprot.writeBool(depr);
      oprot.writeFieldEnd();
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  @override
  String toString() {
    StringBuffer ret = new StringBuffer("TestingUnions(");

    if (AnID != null) {
      ret.write("anID:");
      ret.write(this.anID);
    }

    if (AString != null) {
      ret.write(", ");
      ret.write("aString:");
      if (this.aString == null) {
        ret.write("null");
      } else {
        ret.write(this.aString);
      }
    }

    if (Someotherthing != null) {
      ret.write(", ");
      ret.write("someotherthing:");
      ret.write(this.someotherthing);
    }

    if (AnInt16 != null) {
      ret.write(", ");
      ret.write("anInt16:");
      ret.write(this.anInt16);
    }

    if (Requests != null) {
      ret.write(", ");
      ret.write("requests:");
      if (this.requests == null) {
        ret.write("null");
      } else {
        ret.write(this.requests);
      }
    }

    if (Bin_field_in_union != null) {
      ret.write(", ");
      ret.write("bin_field_in_union:");
      if (this.bin_field_in_union == null) {
        ret.write("null");
      } else {
        ret.write("BINARY");
      }
    }

    if (Depr != null) {
      ret.write(", ");
      ret.write("depr:");
      // ignore: deprecated_member_use
      ret.write(this.depr);
    }

    ret.write(")");

    return ret.toString();
  }

  @override
  bool operator ==(Object o) {
    if (o is TestingUnions) {
      return this.anID == o.anID &&
        this.aString == o.aString &&
        this.someotherthing == o.someotherthing &&
        this.anInt16 == o.anInt16 &&
        this.requests == o.requests &&
        this.bin_field_in_union == o.bin_field_in_union &&
        // ignore: deprecated_member_use
        this.depr == o.depr;
    }
    return false;
  }

  @override
  int get hashCode {
    var value = 17;
    value = (value * 31) ^ anID.hashCode;
    value = (value * 31) ^ aString.hashCode;
    value = (value * 31) ^ someotherthing.hashCode;
    value = (value * 31) ^ anInt16.hashCode;
    value = (value * 31) ^ requests.hashCode;
    value = (value * 31) ^ bin_field_in_union.hashCode;
    // ignore: deprecated_member_use
    value = (value * 31) ^ depr.hashCode;
    return value;
  }

  TestingUnions clone({
    int anID: null,
    String aString: null,
    int someotherthing: null,
    int anInt16: null,
    Map<int, String> requests: null,
    Uint8List bin_field_in_union: null,
    // ignore: deprecated_member_use
    bool depr: null,
  }) {
    return new TestingUnions()
      ..anID = anID ?? this.anID
      ..aString = aString ?? this.aString
      ..someotherthing = someotherthing ?? this.someotherthing
      ..anInt16 = anInt16 ?? this.anInt16
      ..requests = requests ?? this.requests
      ..bin_field_in_union = bin_field_in_union ?? this.bin_field_in_union
      // ignore: deprecated_member_use
      ..depr = depr ?? this.depr;
  }

  validate() {
    // check exactly one field is set
    int setFields = 0;
    if (AnID != null) {
      setFields++;
    }
    if (AString != null) {
      setFields++;
    }
    if (Someotherthing != null) {
      setFields++;
    }
    if (AnInt16 != null) {
      setFields++;
    }
    if (Requests != null) {
      setFields++;
    }
    if (Bin_field_in_union != null) {
      setFields++;
    }
    if (Depr != null) {
      setFields++;
    }
    if (setFields != 1) {
      throw new thrift.TProtocolError(thrift.TProtocolErrorType.INVALID_DATA, "The union did not have exactly one field set, $setFields were set");
    }
  }
}
