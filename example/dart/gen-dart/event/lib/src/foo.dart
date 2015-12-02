/**
 * Autogenerated by Thrift Compiler (1.0.0-dev)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library event.src.foo;

import 'dart:async';
import 'dart:typed_data' show Uint8List;
import 'package:thrift/thrift.dart';
import 'package:event/event.dart';


/// This is a thrift service. Frugal will generate bindings that include
/// a frugal Context for each service call.
abstract class Foo {

  /// Ping the server.
  Future ping();

  /// Blah the server.
  /// 
  /// @param num
  /// @param str
  /// @param event
  Future<int> blah(int num, String str, Event event);
}

class FooClient implements Foo {

  FooClient(TProtocol iprot, [TProtocol oprot = null]) {
    _iprot = iprot;
    _oprot = (oprot == null) ? iprot : oprot;
  }

  TProtocol _iprot;

  TProtocol get iprot => _iprot;

  TProtocol _oprot;

  TProtocol get oprot => _oprot;

  int _seqid = 0;

  int get seqid => _seqid;

  int nextSeqid() => ++_seqid;

  Future ping() async {
    oprot.writeMessageBegin(new TMessage("ping", TMessageType.CALL, nextSeqid()));
    ping_args args = new ping_args();
    args.write(oprot);
    oprot.writeMessageEnd();

    await oprot.transport.flush();

    TMessage msg = iprot.readMessageBegin();
    if (msg.type == TMessageType.EXCEPTION) {
      TApplicationError error = TApplicationError.read(iprot);
      iprot.readMessageEnd();
      throw error;
    }

    ping_result result = new ping_result();
    result.read(iprot);
    iprot.readMessageEnd();
    return;
  }

  Future<int> blah(int num, String str, Event event) async {
    oprot.writeMessageBegin(new TMessage("blah", TMessageType.CALL, nextSeqid()));
    blah_args args = new blah_args();
    args.num = num;
    args.Str = Str;
    args.event = event;
    args.write(oprot);
    oprot.writeMessageEnd();

    await oprot.transport.flush();

    TMessage msg = iprot.readMessageBegin();
    if (msg.type == TMessageType.EXCEPTION) {
      TApplicationError error = TApplicationError.read(iprot);
      iprot.readMessageEnd();
      throw error;
    }

    blah_result result = new blah_result();
    result.read(iprot);
    iprot.readMessageEnd();
    if (result.isSetSuccess()) {
      return result.success;
    }

    if (result.awe != null) {
      throw result.awe;
    }
    throw new TApplicationError(TApplicationErrorType.MISSING_RESULT, "blah failed: unknown result");
  }

}

typedef void ProcessFunction(int seqid, TProtocol iprot, TProtocol oprot);

class FooProcessor implements TProcessor {
  FooProcessor(Foo iface) {
    iface_ = iface;
    PROCESS_MAP["ping"] = ping;
    PROCESS_MAP["blah"] = blah;
  }

  Foo iface_;
  final Map<String, ProcessFunction> PROCESS_MAP = {};

  bool process(TProtocol iprot, TProtocol oprot) {
    TMessage msg = iprot.readMessageBegin();
    ProcessFunction fn = PROCESS_MAP[msg.name];
    if (fn == null) {
      TProtocolUtil.skip(iprot, TType.STRUCT);
      iprot.readMessageEnd();
      TApplicationError x = new TApplicationError(TApplicationErrorType.UNKNOWN_METHOD, "Invalid method name: '"+msg.name+"'");
      oprot.writeMessageBegin(new TMessage(msg.name, TMessageType.EXCEPTION, msg.seqid));
      x.write(oprot);
      oprot.writeMessageEnd();
      oprot.transport.flush();
      return true;
    }
    fn(msg.seqid, iprot, oprot);
    return true;
  }

  ping(int seqid, TProtocol iprot, TProtocol oprot) {
    ping_args args = new ping_args();
    args.read(iprot);
    iprot.readMessageEnd();
    ping_result result = new ping_result();
    iface_.ping();
    oprot.writeMessageBegin(new TMessage("ping", TMessageType.REPLY, seqid));
    result.write(oprot);
    oprot.writeMessageEnd();
    oprot.transport.flush();
  }

  blah(int seqid, TProtocol iprot, TProtocol oprot) async {
    blah_args args = new blah_args();
    args.read(iprot);
    iprot.readMessageEnd();
    blah_result result = new blah_result();
    try {
      result.success = await iface_.blah(args.num, args.str, args.event);
    } on AwesomeException catch(awe) {
      result.awe = awe;
    } catch (th) {
      // Internal error
      TApplicationError x = new TApplicationError(TApplicationErrorType.INTERNAL_ERROR, "Internal error processing blah");
      oprot.writeMessageBegin(new TMessage("blah", TMessageType.EXCEPTION, seqid));
      x.write(oprot);
      oprot.writeMessageEnd();
      oprot.transport.flush();
      return;
    }
    oprot.writeMessageBegin(new TMessage("blah", TMessageType.REPLY, seqid));
    result.write(oprot);
    oprot.writeMessageEnd();
    oprot.transport.flush();
  }

}

class ping_args implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("ping_args");



  ping_args() {
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object value) {
    switch (fieldID) {
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch (fieldID) {
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  read(TProtocol iprot) {
    TField field;
    iprot.readStructBegin();
    while (true) {
      field = iprot.readFieldBegin();
      if (field.type == TType.STOP) {
        break;
      }
      switch (field.id) {
        default:
          TProtocolUtil.skip(iprot, field.type);
          break;
      }
      iprot.readFieldEnd();
    }
    iprot.readStructEnd();

    // check for required fields of primitive type, which can't be checked in the validate method
    validate();
  }

  write(TProtocol oprot) {
    validate();

    oprot.writeStructBegin(_STRUCT_DESC);
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("ping_args(");

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    // check that fields of type enum have valid values
  }

}

class ping_result implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("ping_result");



  ping_result() {
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object value) {
    switch (fieldID) {
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch (fieldID) {
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  read(TProtocol iprot) {
    TField field;
    iprot.readStructBegin();
    while (true) {
      field = iprot.readFieldBegin();
      if (field.type == TType.STOP) {
        break;
      }
      switch (field.id) {
        default:
          TProtocolUtil.skip(iprot, field.type);
          break;
      }
      iprot.readFieldEnd();
    }
    iprot.readStructEnd();

    // check for required fields of primitive type, which can't be checked in the validate method
    validate();
  }

  write(TProtocol oprot) {
    oprot.writeStructBegin(_STRUCT_DESC);


    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("ping_result(");

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    // check that fields of type enum have valid values
  }

}

class blah_args implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("blah_args");
  static final TField _NUM_FIELD_DESC = new TField("num", TType.I32, 1);
  static final TField _STR_FIELD_DESC = new TField("Str", TType.STRING, 2);
  static final TField _EVENT_FIELD_DESC = new TField("event", TType.STRUCT, 3);

  int _num;
  static const int NUM = 1;
  String _str;
  static const int STR = 2;
  Event _event;
  static const int EVENT = 3;

  bool __isset_num = false;

  blah_args() {
  }

  // num
  int get num => this._num;

  set num(int num) {
    this._num = num;
    this.__isset_num = true;
  }

  bool isSetNum() => this.__isset_num;

  unsetNum() {
    this.__isset_num = false;
  }

  // str
  String get str => this._str;

  set str(String str) {
    this._str = str;
  }

  bool isSetStr() => this.str != null;

  unsetStr() {
    this.str = null;
  }

  // event
  Event get event => this._event;

  set event(Event event) {
    this._event = event;
  }

  bool isSetEvent() => this.event != null;

  unsetEvent() {
    this.event = null;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case NUM:
        return this.num;
      case STR:
        return this.str;
      case EVENT:
        return this.event;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object value) {
    switch (fieldID) {
      case NUM:
        if (value == null) {
          unsetNum();
        } else {
          this.num = value;
        }
        break;

      case STR:
        if (value == null) {
          unsetStr();
        } else {
          this.str = value;
        }
        break;

      case EVENT:
        if (value == null) {
          unsetEvent();
        } else {
          this.event = value;
        }
        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch (fieldID) {
      case NUM:
        return isSetNum();
      case STR:
        return isSetStr();
      case EVENT:
        return isSetEvent();
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  read(TProtocol iprot) {
    TField field;
    iprot.readStructBegin();
    while (true) {
      field = iprot.readFieldBegin();
      if (field.type == TType.STOP) {
        break;
      }
      switch (field.id) {
        case NUM:
          if (field.type == TType.I32) {
            this.num = iprot.readI32();
            this.__isset_num = true;
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case STR:
          if (field.type == TType.STRING) {
            this.str = iprot.readString();
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case EVENT:
          if (field.type == TType.STRUCT) {
            this.event = new Event();
            this.event.read(iprot);
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        default:
          TProtocolUtil.skip(iprot, field.type);
          break;
      }
      iprot.readFieldEnd();
    }
    iprot.readStructEnd();

    // check for required fields of primitive type, which can't be checked in the validate method
    if (!__isset_num) {
        throw new TProtocolError(TProtocolErrorType.UNKNOWN, "Required field 'num' was not found in serialized data! Struct: " + toString());
    }

    validate();
  }

  write(TProtocol oprot) {
    validate();

    oprot.writeStructBegin(_STRUCT_DESC);
    oprot.writeFieldBegin(_NUM_FIELD_DESC);
    oprot.writeI32(this.num);
    oprot.writeFieldEnd();
    if (this.str != null) {
      oprot.writeFieldBegin(_STR_FIELD_DESC);
      oprot.writeString(this.str);
      oprot.writeFieldEnd();
    }
    if (this.event != null) {
      oprot.writeFieldBegin(_EVENT_FIELD_DESC);
      this.event.write(oprot);
      oprot.writeFieldEnd();
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("blah_args(");

    ret.write("num:");
    ret.write(this.num);

    ret.write(", ");
    ret.write("str:");
    if (this.str == null) {
      ret.write("null");
    } else {
      ret.write(this.str);
    }

    ret.write(", ");
    ret.write("event:");
    if (this.event == null) {
      ret.write("null");
    } else {
      ret.write(this.event);
    }

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    // alas, we cannot check 'num' because it's a primitive and you chose the non-beans generator.
    if (str == null) {
      throw new TProtocolError(TProtocolErrorType.UNKNOWN, "Required field 'str' was not present! Struct: " + toString());
    }
    if (event == null) {
      throw new TProtocolError(TProtocolErrorType.UNKNOWN, "Required field 'event' was not present! Struct: " + toString());
    }
    // check that fields of type enum have valid values
  }

}

class blah_result implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("blah_result");
  static final TField _SUCCESS_FIELD_DESC = new TField("success", TType.I64, 0);
  static final TField _AWE_FIELD_DESC = new TField("awe", TType.STRUCT, 1);

  int _success;
  static const int SUCCESS = 0;
  AwesomeException _awe;
  static const int AWE = 1;

  bool __isset_success = false;

  blah_result() {
  }

  // success
  int get success => this._success;

  set success(int success) {
    this._success = success;
    this.__isset_success = true;
  }

  bool isSetSuccess() => this.__isset_success;

  unsetSuccess() {
    this.__isset_success = false;
  }

  // awe
  AwesomeException get awe => this._awe;

  set awe(AwesomeException awe) {
    this._awe = awe;
  }

  bool isSetAwe() => this.awe != null;

  unsetAwe() {
    this.awe = null;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case SUCCESS:
        return this.success;
      case AWE:
        return this.awe;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object value) {
    switch (fieldID) {
      case SUCCESS:
        if (value == null) {
          unsetSuccess();
        } else {
          this.success = value;
        }
        break;

      case AWE:
        if (value == null) {
          unsetAwe();
        } else {
          this.awe = value;
        }
        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch (fieldID) {
      case SUCCESS:
        return isSetSuccess();
      case AWE:
        return isSetAwe();
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  read(TProtocol iprot) {
    TField field;
    iprot.readStructBegin();
    while (true) {
      field = iprot.readFieldBegin();
      if (field.type == TType.STOP) {
        break;
      }
      switch (field.id) {
        case SUCCESS:
          if (field.type == TType.I64) {
            this.success = iprot.readI64();
            this.__isset_success = true;
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case AWE:
          if (field.type == TType.STRUCT) {
            this.awe = new AwesomeException();
            this.awe.read(iprot);
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        default:
          TProtocolUtil.skip(iprot, field.type);
          break;
      }
      iprot.readFieldEnd();
    }
    iprot.readStructEnd();

    // check for required fields of primitive type, which can't be checked in the validate method
    validate();
  }

  write(TProtocol oprot) {
    oprot.writeStructBegin(_STRUCT_DESC);

    if (this.isSetSuccess()) {
      oprot.writeFieldBegin(_SUCCESS_FIELD_DESC);
      oprot.writeI64(this.success);
      oprot.writeFieldEnd();
    } else if (this.isSetAwe()) {
      oprot.writeFieldBegin(_AWE_FIELD_DESC);
      this.awe.write(oprot);
      oprot.writeFieldEnd();
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("blah_result(");

    ret.write("success:");
    ret.write(this.success);

    ret.write(", ");
    ret.write("awe:");
    if (this.awe == null) {
      ret.write("null");
    } else {
      ret.write(this.awe);
    }

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    // check that fields of type enum have valid values
  }

}

