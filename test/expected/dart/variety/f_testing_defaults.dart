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

class TestingDefaults implements thrift.TBase {
  static final thrift.TStruct _STRUCT_DESC = new thrift.TStruct("TestingDefaults");
  static final thrift.TField _I_D2_FIELD_DESC = new thrift.TField("ID2", thrift.TType.I64, 1);
  static final thrift.TField _EV1_FIELD_DESC = new thrift.TField("ev1", thrift.TType.STRUCT, 2);
  static final thrift.TField _EV2_FIELD_DESC = new thrift.TField("ev2", thrift.TType.STRUCT, 3);
  static final thrift.TField _ID_FIELD_DESC = new thrift.TField("ID", thrift.TType.I64, 4);
  static final thrift.TField _THING_FIELD_DESC = new thrift.TField("thing", thrift.TType.STRING, 5);
  static final thrift.TField _THING2_FIELD_DESC = new thrift.TField("thing2", thrift.TType.STRING, 6);
  static final thrift.TField _LISTFIELD_FIELD_DESC = new thrift.TField("listfield", thrift.TType.LIST, 7);
  static final thrift.TField _I_D3_FIELD_DESC = new thrift.TField("ID3", thrift.TType.I64, 8);
  static final thrift.TField _BIN_FIELD_FIELD_DESC = new thrift.TField("bin_field", thrift.TType.STRING, 9);
  static final thrift.TField _BIN_FIELD2_FIELD_DESC = new thrift.TField("bin_field2", thrift.TType.STRING, 10);
  static final thrift.TField _BIN_FIELD3_FIELD_DESC = new thrift.TField("bin_field3", thrift.TType.STRING, 11);
  static final thrift.TField _BIN_FIELD4_FIELD_DESC = new thrift.TField("bin_field4", thrift.TType.STRING, 12);
  static final thrift.TField _LIST2_FIELD_DESC = new thrift.TField("list2", thrift.TType.LIST, 13);
  static final thrift.TField _LIST3_FIELD_DESC = new thrift.TField("list3", thrift.TType.LIST, 14);
  static final thrift.TField _LIST4_FIELD_DESC = new thrift.TField("list4", thrift.TType.LIST, 15);
  static final thrift.TField _A_MAP_FIELD_DESC = new thrift.TField("a_map", thrift.TType.MAP, 16);
  static final thrift.TField _STATUS_FIELD_DESC = new thrift.TField("status", thrift.TType.I32, 17);
  static final thrift.TField _BASE_STATUS_FIELD_DESC = new thrift.TField("base_status", thrift.TType.I32, 18);

  int iD2;
  static const int ID2 = 1;
  t_variety.Event ev1;
  static const int EV1 = 2;
  t_variety.Event ev2;
  static const int EV2 = 3;
  int iD = 0;
  static const int ID = 4;
  String thing;
  static const int THING = 5;
  String thing2;
  static const int THING2 = 6;
  List<int> listfield;
  static const int LISTFIELD = 7;
  int iD3 = 0;
  static const int ID3 = 8;
  Uint8List bin_field;
  static const int BIN_FIELD = 9;
  Uint8List bin_field2;
  static const int BIN_FIELD2 = 10;
  Uint8List bin_field3;
  static const int BIN_FIELD3 = 11;
  Uint8List bin_field4;
  static const int BIN_FIELD4 = 12;
  List<int> list2;
  static const int LIST2 = 13;
  List<int> list3;
  static const int LIST3 = 14;
  List<int> list4;
  static const int LIST4 = 15;
  Map<String, String> a_map;
  static const int A_MAP = 16;
  int status;
  static const int STATUS = 17;
  int base_status;
  static const int BASE_STATUS = 18;


  TestingDefaults() {
    this.iD2 = t_variety.VarietyConstants.DEFAULT_ID;
    this.ev1 = new t_variety.Event()
      ..iD = t_variety.VarietyConstants.DEFAULT_ID
      ..message = "a message";
    this.ev2 = new t_variety.Event()
      ..iD = 5
      ..message = "a message2";
    this.iD = -2;
    this.thing = "a constant";
    this.thing2 = "another constant";
    this.listfield = [
      1,
      2,
      3,
      4,
      5,
    ];
    this.iD3 = t_variety.VarietyConstants.other_default;
    this.bin_field4 = t_variety.VarietyConstants.bin_const;
    this.list2 = [
      1,
      3,
      4,
      5,
      8,
    ];
    this.list4 = [
      1,
      2,
      3,
      6,
    ];
    this.a_map = {
      "k1": "v1",
      "k2": "v2",
    };
    this.status = t_variety.HealthCondition.PASS;
    this.base_status = t_actual_base_dart.base_health_condition.FAIL;
  }

  @deprecated
  bool isSetID2() => iD2 != null;

  @deprecated
  unsetID2() => iD2 = null;

  @deprecated
  bool isSetEv1() => ev1 != null;

  @deprecated
  unsetEv1() => ev1 = null;

  @deprecated
  bool isSetEv2() => ev2 != null;

  @deprecated
  unsetEv2() => ev2 = null;

  @deprecated
  bool isSetID() => iD != null;

  @deprecated
  unsetID() => iD = null;

  @deprecated
  bool isSetThing() => thing != null;

  @deprecated
  unsetThing() => thing = null;

  @deprecated
  bool isSetThing2() => thing2 != null;

  @deprecated
  unsetThing2() => thing2 = null;

  @deprecated
  bool isSetListfield() => listfield != null;

  @deprecated
  unsetListfield() => listfield = null;

  @deprecated
  bool isSetID3() => iD3 != null;

  @deprecated
  unsetID3() => iD3 = null;

  @deprecated
  bool isSetBin_field() => bin_field != null;

  @deprecated
  unsetBin_field() => bin_field = null;

  @deprecated
  bool isSetBin_field2() => bin_field2 != null;

  @deprecated
  unsetBin_field2() => bin_field2 = null;

  @deprecated
  bool isSetBin_field3() => bin_field3 != null;

  @deprecated
  unsetBin_field3() => bin_field3 = null;

  @deprecated
  bool isSetBin_field4() => bin_field4 != null;

  @deprecated
  unsetBin_field4() => bin_field4 = null;

  @deprecated
  bool isSetList2() => list2 != null;

  @deprecated
  unsetList2() => list2 = null;

  @deprecated
  bool isSetList3() => list3 != null;

  @deprecated
  unsetList3() => list3 = null;

  @deprecated
  bool isSetList4() => list4 != null;

  @deprecated
  unsetList4() => list4 = null;

  @deprecated
  bool isSetA_map() => a_map != null;

  @deprecated
  unsetA_map() => a_map = null;

  @deprecated
  bool isSetStatus() => status != null;

  @deprecated
  unsetStatus() => status = null;

  @deprecated
  bool isSetBase_status() => base_status != null;

  @deprecated
  unsetBase_status() => base_status = null;

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case ID2:
        return this.iD2;
      case EV1:
        return this.ev1;
      case EV2:
        return this.ev2;
      case ID:
        return this.iD;
      case THING:
        return this.thing;
      case THING2:
        return this.thing2;
      case LISTFIELD:
        return this.listfield;
      case ID3:
        return this.iD3;
      case BIN_FIELD:
        return this.bin_field;
      case BIN_FIELD2:
        return this.bin_field2;
      case BIN_FIELD3:
        return this.bin_field3;
      case BIN_FIELD4:
        return this.bin_field4;
      case LIST2:
        return this.list2;
      case LIST3:
        return this.list3;
      case LIST4:
        return this.list4;
      case A_MAP:
        return this.a_map;
      case STATUS:
        return this.status;
      case BASE_STATUS:
        return this.base_status;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object value) {
    switch(fieldID) {
      case ID2:
        if (value == null) {
          iD2 = null;
        } else if (value is int) {
          iD2 = value;
        }

        break;

      case EV1:
        if (value == null) {
          ev1 = null;
        } else if (value is t_variety.Event) {
          ev1 = value;
        }

        break;

      case EV2:
        if (value == null) {
          ev2 = null;
        } else if (value is t_variety.Event) {
          ev2 = value;
        }

        break;

      case ID:
        if (value == null) {
          iD = null;
        } else if (value is int) {
          iD = value;
        }

        break;

      case THING:
        if (value == null) {
          thing = null;
        } else if (value is String) {
          thing = value;
        }

        break;

      case THING2:
        if (value == null) {
          thing2 = null;
        } else if (value is String) {
          thing2 = value;
        }

        break;

      case LISTFIELD:
        if (value == null) {
          listfield = null;
        } else if (value is List<int>) {
          listfield = value;
        }

        break;

      case ID3:
        if (value == null) {
          iD3 = null;
        } else if (value is int) {
          iD3 = value;
        }

        break;

      case BIN_FIELD:
        if (value == null) {
          bin_field = null;
        } else if (value is Uint8List) {
          bin_field = value;
        }

        break;

      case BIN_FIELD2:
        if (value == null) {
          bin_field2 = null;
        } else if (value is Uint8List) {
          bin_field2 = value;
        }

        break;

      case BIN_FIELD3:
        if (value == null) {
          bin_field3 = null;
        } else if (value is Uint8List) {
          bin_field3 = value;
        }

        break;

      case BIN_FIELD4:
        if (value == null) {
          bin_field4 = null;
        } else if (value is Uint8List) {
          bin_field4 = value;
        }

        break;

      case LIST2:
        if (value == null) {
          list2 = null;
        } else if (value is List<int>) {
          list2 = value;
        }

        break;

      case LIST3:
        if (value == null) {
          list3 = null;
        } else if (value is List<int>) {
          list3 = value;
        }

        break;

      case LIST4:
        if (value == null) {
          list4 = null;
        } else if (value is List<int>) {
          list4 = value;
        }

        break;

      case A_MAP:
        if (value == null) {
          a_map = null;
        } else if (value is Map<String, String>) {
          a_map = value;
        }

        break;

      case STATUS:
        if (value == null) {
          status = null;
        } else if (value is int) {
          status = value;
        }

        break;

      case BASE_STATUS:
        if (value == null) {
          base_status = null;
        } else if (value is int) {
          base_status = value;
        }

        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if the field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch(fieldID) {
      case ID2:
        return iD2 == null;

      case EV1:
        return ev1 == null;

      case EV2:
        return ev2 == null;

      case ID:
        return iD == null;

      case THING:
        return thing == null;

      case THING2:
        return thing2 == null;

      case LISTFIELD:
        return listfield == null;

      case ID3:
        return iD3 == null;

      case BIN_FIELD:
        return bin_field == null;

      case BIN_FIELD2:
        return bin_field2 == null;

      case BIN_FIELD3:
        return bin_field3 == null;

      case BIN_FIELD4:
        return bin_field4 == null;

      case LIST2:
        return list2 == null;

      case LIST3:
        return list3 == null;

      case LIST4:
        return list4 == null;

      case A_MAP:
        return a_map == null;

      case STATUS:
        return status == null;

      case BASE_STATUS:
        return base_status == null;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  read(thrift.TProtocol iprot) {
    thrift.TField field;
    iprot.readStructBegin();
    while(true) {
      field = iprot.readFieldBegin();
      if(field.type == thrift.TType.STOP) {
        break;
      }
      switch(field.id) {
        case ID2:
          if(field.type == thrift.TType.I64) {
            iD2 = iprot.readI64();
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case EV1:
          if(field.type == thrift.TType.STRUCT) {
            ev1 = new t_variety.Event();
            ev1.read(iprot);
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case EV2:
          if(field.type == thrift.TType.STRUCT) {
            ev2 = new t_variety.Event();
            ev2.read(iprot);
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case ID:
          if(field.type == thrift.TType.I64) {
            iD = iprot.readI64();
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case THING:
          if(field.type == thrift.TType.STRING) {
            thing = iprot.readString();
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case THING2:
          if(field.type == thrift.TType.STRING) {
            thing2 = iprot.readString();
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case LISTFIELD:
          if(field.type == thrift.TType.LIST) {
            thrift.TList elem0 = iprot.readListBegin();
            listfield = new List<int>();
            for(int elem2 = 0; elem2 < elem0.length; ++elem2) {
              int elem1 = iprot.readI32();
              listfield.add(elem1);
            }
            iprot.readListEnd();
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case ID3:
          if(field.type == thrift.TType.I64) {
            iD3 = iprot.readI64();
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case BIN_FIELD:
          if(field.type == thrift.TType.STRING) {
            bin_field = iprot.readBinary();
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case BIN_FIELD2:
          if(field.type == thrift.TType.STRING) {
            bin_field2 = iprot.readBinary();
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case BIN_FIELD3:
          if(field.type == thrift.TType.STRING) {
            bin_field3 = iprot.readBinary();
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case BIN_FIELD4:
          if(field.type == thrift.TType.STRING) {
            bin_field4 = iprot.readBinary();
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case LIST2:
          if(field.type == thrift.TType.LIST) {
            thrift.TList elem3 = iprot.readListBegin();
            list2 = new List<int>();
            for(int elem5 = 0; elem5 < elem3.length; ++elem5) {
              int elem4 = iprot.readI32();
              list2.add(elem4);
            }
            iprot.readListEnd();
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case LIST3:
          if(field.type == thrift.TType.LIST) {
            thrift.TList elem6 = iprot.readListBegin();
            list3 = new List<int>();
            for(int elem8 = 0; elem8 < elem6.length; ++elem8) {
              int elem7 = iprot.readI32();
              list3.add(elem7);
            }
            iprot.readListEnd();
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case LIST4:
          if(field.type == thrift.TType.LIST) {
            thrift.TList elem9 = iprot.readListBegin();
            list4 = new List<int>();
            for(int elem11 = 0; elem11 < elem9.length; ++elem11) {
              int elem10 = iprot.readI32();
              list4.add(elem10);
            }
            iprot.readListEnd();
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case A_MAP:
          if(field.type == thrift.TType.MAP) {
            thrift.TMap elem12 = iprot.readMapBegin();
            a_map = new Map<String, String>();
            for(int elem14 = 0; elem14 < elem12.length; ++elem14) {
              String elem15 = iprot.readString();
              String elem13 = iprot.readString();
              a_map[elem15] = elem13;
            }
            iprot.readMapEnd();
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case STATUS:
          if(field.type == thrift.TType.I32) {
            status = iprot.readI32();
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case BASE_STATUS:
          if(field.type == thrift.TType.I32) {
            base_status = iprot.readI32();
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

    // check for required fields of primitive type, which can't be checked in the validate method
    if(status != null) {
      throw new thrift.TProtocolError(thrift.TProtocolErrorType.UNKNOWN, "Required field 'status' is not present in struct 'TestingDefaults'");
    }
    if(base_status != null) {
      throw new thrift.TProtocolError(thrift.TProtocolErrorType.UNKNOWN, "Required field 'base_status' is not present in struct 'TestingDefaults'");
    }
    validate();
  }

  write(thrift.TProtocol oprot) {
    validate();

    oprot.writeStructBegin(_STRUCT_DESC);
    if(ID2 != null) {
      oprot.writeFieldBegin(_I_D2_FIELD_DESC);
      oprot.writeI64(iD2);
      oprot.writeFieldEnd();
    }
    if(this.ev1 != null) {
      oprot.writeFieldBegin(_EV1_FIELD_DESC);
      ev1.write(oprot);
      oprot.writeFieldEnd();
    }
    if(this.ev2 != null) {
      oprot.writeFieldBegin(_EV2_FIELD_DESC);
      ev2.write(oprot);
      oprot.writeFieldEnd();
    }
    oprot.writeFieldBegin(_ID_FIELD_DESC);
    oprot.writeI64(iD);
    oprot.writeFieldEnd();
    if(this.thing != null) {
      oprot.writeFieldBegin(_THING_FIELD_DESC);
      oprot.writeString(thing);
      oprot.writeFieldEnd();
    }
    if(thing2 != null && this.thing2 != null) {
      oprot.writeFieldBegin(_THING2_FIELD_DESC);
      oprot.writeString(thing2);
      oprot.writeFieldEnd();
    }
    if(this.listfield != null) {
      oprot.writeFieldBegin(_LISTFIELD_FIELD_DESC);
      oprot.writeListBegin(new thrift.TList(thrift.TType.I32, listfield.length));
      for(var elem16 in listfield) {
        oprot.writeI32(elem16);
      }
      oprot.writeListEnd();
      oprot.writeFieldEnd();
    }
    oprot.writeFieldBegin(_I_D3_FIELD_DESC);
    oprot.writeI64(iD3);
    oprot.writeFieldEnd();
    if(this.bin_field != null) {
      oprot.writeFieldBegin(_BIN_FIELD_FIELD_DESC);
      oprot.writeBinary(bin_field);
      oprot.writeFieldEnd();
    }
    if(bin_field2 != null && this.bin_field2 != null) {
      oprot.writeFieldBegin(_BIN_FIELD2_FIELD_DESC);
      oprot.writeBinary(bin_field2);
      oprot.writeFieldEnd();
    }
    if(this.bin_field3 != null) {
      oprot.writeFieldBegin(_BIN_FIELD3_FIELD_DESC);
      oprot.writeBinary(bin_field3);
      oprot.writeFieldEnd();
    }
    if(bin_field4 != null && this.bin_field4 != null) {
      oprot.writeFieldBegin(_BIN_FIELD4_FIELD_DESC);
      oprot.writeBinary(bin_field4);
      oprot.writeFieldEnd();
    }
    if(list2 != null && this.list2 != null) {
      oprot.writeFieldBegin(_LIST2_FIELD_DESC);
      oprot.writeListBegin(new thrift.TList(thrift.TType.I32, list2.length));
      for(var elem17 in list2) {
        oprot.writeI32(elem17);
      }
      oprot.writeListEnd();
      oprot.writeFieldEnd();
    }
    if(list3 != null && this.list3 != null) {
      oprot.writeFieldBegin(_LIST3_FIELD_DESC);
      oprot.writeListBegin(new thrift.TList(thrift.TType.I32, list3.length));
      for(var elem18 in list3) {
        oprot.writeI32(elem18);
      }
      oprot.writeListEnd();
      oprot.writeFieldEnd();
    }
    if(this.list4 != null) {
      oprot.writeFieldBegin(_LIST4_FIELD_DESC);
      oprot.writeListBegin(new thrift.TList(thrift.TType.I32, list4.length));
      for(var elem19 in list4) {
        oprot.writeI32(elem19);
      }
      oprot.writeListEnd();
      oprot.writeFieldEnd();
    }
    if(a_map != null && this.a_map != null) {
      oprot.writeFieldBegin(_A_MAP_FIELD_DESC);
      oprot.writeMapBegin(new thrift.TMap(thrift.TType.STRING, thrift.TType.STRING, a_map.length));
      for(var elem20 in a_map.keys) {
        oprot.writeString(elem20);
        oprot.writeString(a_map[elem20]);
      }
      oprot.writeMapEnd();
      oprot.writeFieldEnd();
    }
    oprot.writeFieldBegin(_STATUS_FIELD_DESC);
    oprot.writeI32(status);
    oprot.writeFieldEnd();
    oprot.writeFieldBegin(_BASE_STATUS_FIELD_DESC);
    oprot.writeI32(base_status);
    oprot.writeFieldEnd();
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("TestingDefaults(");

    if(ID2 != null) {
      ret.write("iD2:");
      ret.write(this.iD2);
    }

    ret.write(", ");
    ret.write("ev1:");
    if(this.ev1 == null) {
      ret.write("null");
    } else {
      ret.write(this.ev1);
    }

    ret.write(", ");
    ret.write("ev2:");
    if(this.ev2 == null) {
      ret.write("null");
    } else {
      ret.write(this.ev2);
    }

    ret.write(", ");
    ret.write("iD:");
    ret.write(this.iD);

    ret.write(", ");
    ret.write("thing:");
    if(this.thing == null) {
      ret.write("null");
    } else {
      ret.write(this.thing);
    }

    if(thing2 != null) {
      ret.write(", ");
      ret.write("thing2:");
      if(this.thing2 == null) {
        ret.write("null");
      } else {
        ret.write(this.thing2);
      }
    }

    ret.write(", ");
    ret.write("listfield:");
    if(this.listfield == null) {
      ret.write("null");
    } else {
      ret.write(this.listfield);
    }

    ret.write(", ");
    ret.write("iD3:");
    ret.write(this.iD3);

    ret.write(", ");
    ret.write("bin_field:");
    if(this.bin_field == null) {
      ret.write("null");
    } else {
      ret.write("BINARY");
    }

    if(bin_field2 != null) {
      ret.write(", ");
      ret.write("bin_field2:");
      if(this.bin_field2 == null) {
        ret.write("null");
      } else {
        ret.write("BINARY");
      }
    }

    ret.write(", ");
    ret.write("bin_field3:");
    if(this.bin_field3 == null) {
      ret.write("null");
    } else {
      ret.write("BINARY");
    }

    if(bin_field4 != null) {
      ret.write(", ");
      ret.write("bin_field4:");
      if(this.bin_field4 == null) {
        ret.write("null");
      } else {
        ret.write("BINARY");
      }
    }

    if(list2 != null) {
      ret.write(", ");
      ret.write("list2:");
      if(this.list2 == null) {
        ret.write("null");
      } else {
        ret.write(this.list2);
      }
    }

    if(list3 != null) {
      ret.write(", ");
      ret.write("list3:");
      if(this.list3 == null) {
        ret.write("null");
      } else {
        ret.write(this.list3);
      }
    }

    ret.write(", ");
    ret.write("list4:");
    if(this.list4 == null) {
      ret.write("null");
    } else {
      ret.write(this.list4);
    }

    if(a_map != null) {
      ret.write(", ");
      ret.write("a_map:");
      if(this.a_map == null) {
        ret.write("null");
      } else {
        ret.write(this.a_map);
      }
    }

    ret.write(", ");
    ret.write("status:");
    String status_name = t_variety.HealthCondition.VALUES_TO_NAMES[this.status];
    if(status_name != null) {
      ret.write(status_name);
      ret.write(" (");
    }
    ret.write(this.status);
    if(status_name != null) {
      ret.write(")");
    }

    ret.write(", ");
    ret.write("base_status:");
    String base_status_name = t_actual_base_dart.base_health_condition.VALUES_TO_NAMES[this.base_status];
    if(base_status_name != null) {
      ret.write(base_status_name);
      ret.write(" (");
    }
    ret.write(this.base_status);
    if(base_status_name != null) {
      ret.write(")");
    }

    ret.write(")");

    return ret.toString();
  }

  bool operator ==(Object o) {
    if(o == null || !(o is TestingDefaults)) {
      return false;
    }
    TestingDefaults other = o as TestingDefaults;
    return this.iD2 == other.iD2
      && this.ev1 == other.ev1
      && this.ev2 == other.ev2
      && this.iD == other.iD
      && this.thing == other.thing
      && this.thing2 == other.thing2
      && this.listfield == other.listfield
      && this.iD3 == other.iD3
      && this.bin_field == other.bin_field
      && this.bin_field2 == other.bin_field2
      && this.bin_field3 == other.bin_field3
      && this.bin_field4 == other.bin_field4
      && this.list2 == other.list2
      && this.list3 == other.list3
      && this.list4 == other.list4
      && this.a_map == other.a_map
      && this.status == other.status
      && this.base_status == other.base_status;
  }

  int get hashCode {
    var value = 17;
    value = (value * 31) ^ iD2.hashCode;
    value = (value * 31) ^ ev1.hashCode;
    value = (value * 31) ^ ev2.hashCode;
    value = (value * 31) ^ iD.hashCode;
    value = (value * 31) ^ thing.hashCode;
    value = (value * 31) ^ thing2.hashCode;
    value = (value * 31) ^ listfield.hashCode;
    value = (value * 31) ^ iD3.hashCode;
    value = (value * 31) ^ bin_field.hashCode;
    value = (value * 31) ^ bin_field2.hashCode;
    value = (value * 31) ^ bin_field3.hashCode;
    value = (value * 31) ^ bin_field4.hashCode;
    value = (value * 31) ^ list2.hashCode;
    value = (value * 31) ^ list3.hashCode;
    value = (value * 31) ^ list4.hashCode;
    value = (value * 31) ^ a_map.hashCode;
    value = (value * 31) ^ status.hashCode;
    value = (value * 31) ^ base_status.hashCode;
    return value;
  }

  TestingDefaults clone({
    int iD2: null,
    t_variety.Event ev1: null,
    t_variety.Event ev2: null,
    int iD: null,
    String thing: null,
    String thing2: null,
    List<int> listfield: null,
    int iD3: null,
    Uint8List bin_field: null,
    Uint8List bin_field2: null,
    Uint8List bin_field3: null,
    Uint8List bin_field4: null,
    List<int> list2: null,
    List<int> list3: null,
    List<int> list4: null,
    Map<String, String> a_map: null,
    int status: null,
    int base_status: null,
  }) {
    return new TestingDefaults()
      ..iD2 = iD2 ?? this.iD2
      ..ev1 = ev1 ?? this.ev1
      ..ev2 = ev2 ?? this.ev2
      ..iD = iD ?? this.iD
      ..thing = thing ?? this.thing
      ..thing2 = thing2 ?? this.thing2
      ..listfield = listfield ?? this.listfield
      ..iD3 = iD3 ?? this.iD3
      ..bin_field = bin_field ?? this.bin_field
      ..bin_field2 = bin_field2 ?? this.bin_field2
      ..bin_field3 = bin_field3 ?? this.bin_field3
      ..bin_field4 = bin_field4 ?? this.bin_field4
      ..list2 = list2 ?? this.list2
      ..list3 = list3 ?? this.list3
      ..list4 = list4 ?? this.list4
      ..a_map = a_map ?? this.a_map
      ..status = status ?? this.status
      ..base_status = base_status ?? this.base_status;
  }

  validate() {
    // check for required fields
    if(status != null && !t_variety.HealthCondition.VALID_VALUES.contains(status)) {
      throw new thrift.TProtocolError(thrift.TProtocolErrorType.INVALID_DATA, "The field 'status' has been assigned the invalid value $status");
    }
    if(base_status != null && !t_actual_base_dart.base_health_condition.VALID_VALUES.contains(base_status)) {
      throw new thrift.TProtocolError(thrift.TProtocolErrorType.INVALID_DATA, "The field 'base_status' has been assigned the invalid value $base_status");
    }
  }
}
