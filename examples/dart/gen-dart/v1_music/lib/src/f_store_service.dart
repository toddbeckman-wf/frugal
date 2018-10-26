// Autogenerated by Frugal Compiler (2.22.2)
// DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING



import 'dart:async';

import 'dart:typed_data' show Uint8List;
import 'package:logging/logging.dart' as logging;
import 'package:thrift/thrift.dart' as thrift;
import 'package:frugal/frugal.dart' as frugal;

import 'package:v1_music/v1_music.dart' as t_v1_music;


/// Services are the API for client and server interaction.
/// Users can buy an album or enter a giveaway for a free album.
abstract class FStore {

  Future<t_v1_music.Album> buyAlbum(frugal.FContext ctx, String aSIN, String acct);

  /// Deprecated: use something else
  @deprecated
  Future<bool> enterAlbumGiveaway(frugal.FContext ctx, String email, String name);
}

/// Services are the API for client and server interaction.
/// Users can buy an album or enter a giveaway for a free album.
class FStoreClient implements FStore {
  static final logging.Logger _frugalLog = new logging.Logger('Store');
  Map<String, frugal.FMethod> _methods;

  FStoreClient(frugal.FServiceProvider provider, [List<frugal.Middleware> middleware]) {
    _transport = provider.transport;
    _protocolFactory = provider.protocolFactory;
    var combined = middleware ?? [];
    combined.addAll(provider.middleware);
    this._methods = {};
    this._methods['buyAlbum'] = new frugal.FMethod(this._buyAlbum, 'Store', 'buyAlbum', combined);
    this._methods['enterAlbumGiveaway'] = new frugal.FMethod(this._enterAlbumGiveaway, 'Store', 'enterAlbumGiveaway', combined);
  }

  frugal.FTransport _transport;
  frugal.FProtocolFactory _protocolFactory;

  Future<t_v1_music.Album> buyAlbum(frugal.FContext ctx, String aSIN, String acct) {
    return this._methods['buyAlbum']([ctx, aSIN, acct]) as Future<t_v1_music.Album>;
  }

  Future<t_v1_music.Album> _buyAlbum(frugal.FContext ctx, String aSIN, String acct) async {
    var memoryBuffer = new frugal.TMemoryOutputBuffer(_transport.requestSizeLimit);
    var oprot = _protocolFactory.getProtocol(memoryBuffer);
    oprot.writeRequestHeader(ctx);
    oprot.writeMessageBegin(new thrift.TMessage("buyAlbum", thrift.TMessageType.CALL, 0));
    buyAlbum_args args = new buyAlbum_args();
    args.aSIN = aSIN;
    args.acct = acct;
    args.write(oprot);
    oprot.writeMessageEnd();
    var response = await _transport.request(ctx, memoryBuffer.writeBytes);

    var iprot = _protocolFactory.getProtocol(response);
    iprot.readResponseHeader(ctx);
    thrift.TMessage msg = iprot.readMessageBegin();
    if (msg.type == thrift.TMessageType.EXCEPTION) {
      thrift.TApplicationError error = thrift.TApplicationError.read(iprot);
      iprot.readMessageEnd();
      if (error.type == frugal.FrugalTTransportErrorType.REQUEST_TOO_LARGE) {
        throw new thrift.TTransportError(frugal.FrugalTTransportErrorType.RESPONSE_TOO_LARGE, error.message);
      }
      throw error;
    }

    buyAlbum_result result = new buyAlbum_result();
    result.read(iprot);
    iprot.readMessageEnd();
    if (result.success != null) {
      return result.success;
    }

    if (result.error != null) {
      throw result.error;
    }
    throw new thrift.TApplicationError(
      frugal.FrugalTApplicationErrorType.MISSING_RESULT, "buyAlbum failed: unknown result"
    );
  }
  /// Deprecated: use something else
  @deprecated
  Future<bool> enterAlbumGiveaway(frugal.FContext ctx, String email, String name) {
    _frugalLog.warning("Call to deprecated function 'Store.enterAlbumGiveaway'");
    return this._methods['enterAlbumGiveaway']([ctx, email, name]) as Future<bool>;
  }

  Future<bool> _enterAlbumGiveaway(frugal.FContext ctx, String email, String name) async {
    var memoryBuffer = new frugal.TMemoryOutputBuffer(_transport.requestSizeLimit);
    var oprot = _protocolFactory.getProtocol(memoryBuffer);
    oprot.writeRequestHeader(ctx);
    oprot.writeMessageBegin(new thrift.TMessage("enterAlbumGiveaway", thrift.TMessageType.CALL, 0));
    enterAlbumGiveaway_args args = new enterAlbumGiveaway_args();
    args.email = email;
    args.name = name;
    args.write(oprot);
    oprot.writeMessageEnd();
    var response = await _transport.request(ctx, memoryBuffer.writeBytes);

    var iprot = _protocolFactory.getProtocol(response);
    iprot.readResponseHeader(ctx);
    thrift.TMessage msg = iprot.readMessageBegin();
    if (msg.type == thrift.TMessageType.EXCEPTION) {
      thrift.TApplicationError error = thrift.TApplicationError.read(iprot);
      iprot.readMessageEnd();
      if (error.type == frugal.FrugalTTransportErrorType.REQUEST_TOO_LARGE) {
        throw new thrift.TTransportError(frugal.FrugalTTransportErrorType.RESPONSE_TOO_LARGE, error.message);
      }
      throw error;
    }

    enterAlbumGiveaway_result result = new enterAlbumGiveaway_result();
    result.read(iprot);
    iprot.readMessageEnd();
    if (result.success != null) {
      return result.success;
    }

    throw new thrift.TApplicationError(
      frugal.FrugalTApplicationErrorType.MISSING_RESULT, "enterAlbumGiveaway failed: unknown result"
    );
  }
}

class buyAlbum_args implements thrift.TBase {
  static final thrift.TStruct _STRUCT_DESC = new thrift.TStruct("buyAlbum_args");
  static final thrift.TField _ASIN_FIELD_DESC = new thrift.TField("ASIN", thrift.TType.STRING, 1);
  static final thrift.TField _ACCT_FIELD_DESC = new thrift.TField("acct", thrift.TType.STRING, 2);

  String aSIN;
  static const int ASIN = 1;
  String acct;
  static const int ACCT = 2;


  buyAlbum_args() {
  }

  @deprecated
  bool isSetASIN() => aSIN != null;

  @deprecated
  unsetASIN() => aSIN = null;

  @deprecated
  bool isSetAcct() => acct != null;

  @deprecated
  unsetAcct() => acct = null;

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case ASIN:
        return this.aSIN;
      case ACCT:
        return this.acct;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object value) {
    switch(fieldID) {
      case ASIN:
        if (value == null) {
          aSIN = null;
        } else if (value is String) {
          aSIN = value;
        }

        break;

      case ACCT:
        if (value == null) {
          acct = null;
        } else if (value is String) {
          acct = value;
        }

        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if the field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch(fieldID) {
      case ASIN:
        return aSIN == null;

      case ACCT:
        return acct == null;

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
        case ASIN:
          if(field.type == thrift.TType.STRING) {
            aSIN = iprot.readString();
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case ACCT:
          if(field.type == thrift.TType.STRING) {
            acct = iprot.readString();
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

  write(thrift.TProtocol oprot) {
    validate();

    oprot.writeStructBegin(_STRUCT_DESC);
    if(this.aSIN != null) {
      oprot.writeFieldBegin(_ASIN_FIELD_DESC);
      oprot.writeString(aSIN);
      oprot.writeFieldEnd();
    }
    if(this.acct != null) {
      oprot.writeFieldBegin(_ACCT_FIELD_DESC);
      oprot.writeString(acct);
      oprot.writeFieldEnd();
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("buyAlbum_args(");

    ret.write("aSIN:");
    if(this.aSIN == null) {
      ret.write("null");
    } else {
      ret.write(this.aSIN);
    }

    ret.write(", ");
    ret.write("acct:");
    if(this.acct == null) {
      ret.write("null");
    } else {
      ret.write(this.acct);
    }

    ret.write(")");

    return ret.toString();
  }

  bool operator ==(Object o) {
    if(o == null || !(o is buyAlbum_args)) {
      return false;
    }
    buyAlbum_args other = o as buyAlbum_args;
    return this.aSIN == other.aSIN
      && this.acct == other.acct;
  }

  int get hashCode {
    var value = 17;
    value = (value * 31) ^ aSIN.hashCode;
    value = (value * 31) ^ acct.hashCode;
    return value;
  }

  buyAlbum_args clone({
    String aSIN: null,
    String acct: null,
  }) {
    return new buyAlbum_args()
      ..aSIN = aSIN ?? this.aSIN
      ..acct = acct ?? this.acct;
  }

  validate() {
  }
}
class buyAlbum_result implements thrift.TBase {
  static final thrift.TStruct _STRUCT_DESC = new thrift.TStruct("buyAlbum_result");
  static final thrift.TField _SUCCESS_FIELD_DESC = new thrift.TField("success", thrift.TType.STRUCT, 0);
  static final thrift.TField _ERROR_FIELD_DESC = new thrift.TField("error", thrift.TType.STRUCT, 1);

  t_v1_music.Album success;
  static const int SUCCESS = 0;
  t_v1_music.PurchasingError error;
  static const int ERROR = 1;


  buyAlbum_result() {
  }

  @deprecated
  bool isSetSuccess() => success != null;

  @deprecated
  unsetSuccess() => success = null;

  @deprecated
  bool isSetError() => error != null;

  @deprecated
  unsetError() => error = null;

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case SUCCESS:
        return this.success;
      case ERROR:
        return this.error;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object value) {
    switch(fieldID) {
      case SUCCESS:
        if (value == null) {
          success = null;
        } else if (value is t_v1_music.Album) {
          success = value;
        }

        break;

      case ERROR:
        if (value == null) {
          error = null;
        } else if (value is t_v1_music.PurchasingError) {
          error = value;
        }

        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if the field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch(fieldID) {
      case SUCCESS:
        return success == null;

      case ERROR:
        return error == null;

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
        case SUCCESS:
          if(field.type == thrift.TType.STRUCT) {
            success = new t_v1_music.Album();
            success.read(iprot);
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case ERROR:
          if(field.type == thrift.TType.STRUCT) {
            error = new t_v1_music.PurchasingError();
            error.read(iprot);
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

  write(thrift.TProtocol oprot) {
    validate();

    oprot.writeStructBegin(_STRUCT_DESC);
    if(success != null && this.success != null) {
      oprot.writeFieldBegin(_SUCCESS_FIELD_DESC);
      success.write(oprot);
      oprot.writeFieldEnd();
    }
    if(error != null && this.error != null) {
      oprot.writeFieldBegin(_ERROR_FIELD_DESC);
      error.write(oprot);
      oprot.writeFieldEnd();
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("buyAlbum_result(");

    if(success != null) {
      ret.write("success:");
      if(this.success == null) {
        ret.write("null");
      } else {
        ret.write(this.success);
      }
    }

    if(error != null) {
      ret.write(", ");
      ret.write("error:");
      if(this.error == null) {
        ret.write("null");
      } else {
        ret.write(this.error);
      }
    }

    ret.write(")");

    return ret.toString();
  }

  bool operator ==(Object o) {
    if(o == null || !(o is buyAlbum_result)) {
      return false;
    }
    buyAlbum_result other = o as buyAlbum_result;
    return this.success == other.success
      && this.error == other.error;
  }

  int get hashCode {
    var value = 17;
    value = (value * 31) ^ success.hashCode;
    value = (value * 31) ^ error.hashCode;
    return value;
  }

  buyAlbum_result clone({
    t_v1_music.Album success: null,
    t_v1_music.PurchasingError error: null,
  }) {
    return new buyAlbum_result()
      ..success = success ?? this.success
      ..error = error ?? this.error;
  }

  validate() {
  }
}
class enterAlbumGiveaway_args implements thrift.TBase {
  static final thrift.TStruct _STRUCT_DESC = new thrift.TStruct("enterAlbumGiveaway_args");
  static final thrift.TField _EMAIL_FIELD_DESC = new thrift.TField("email", thrift.TType.STRING, 1);
  static final thrift.TField _NAME_FIELD_DESC = new thrift.TField("name", thrift.TType.STRING, 2);

  String email;
  static const int EMAIL = 1;
  String name;
  static const int NAME = 2;


  enterAlbumGiveaway_args() {
  }

  @deprecated
  bool isSetEmail() => email != null;

  @deprecated
  unsetEmail() => email = null;

  @deprecated
  bool isSetName() => name != null;

  @deprecated
  unsetName() => name = null;

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case EMAIL:
        return this.email;
      case NAME:
        return this.name;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object value) {
    switch(fieldID) {
      case EMAIL:
        if (value == null) {
          email = null;
        } else if (value is String) {
          email = value;
        }

        break;

      case NAME:
        if (value == null) {
          name = null;
        } else if (value is String) {
          name = value;
        }

        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if the field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch(fieldID) {
      case EMAIL:
        return email == null;

      case NAME:
        return name == null;

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
        case EMAIL:
          if(field.type == thrift.TType.STRING) {
            email = iprot.readString();
          } else {
            thrift.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case NAME:
          if(field.type == thrift.TType.STRING) {
            name = iprot.readString();
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

  write(thrift.TProtocol oprot) {
    validate();

    oprot.writeStructBegin(_STRUCT_DESC);
    if(this.email != null) {
      oprot.writeFieldBegin(_EMAIL_FIELD_DESC);
      oprot.writeString(email);
      oprot.writeFieldEnd();
    }
    if(this.name != null) {
      oprot.writeFieldBegin(_NAME_FIELD_DESC);
      oprot.writeString(name);
      oprot.writeFieldEnd();
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("enterAlbumGiveaway_args(");

    ret.write("email:");
    if(this.email == null) {
      ret.write("null");
    } else {
      ret.write(this.email);
    }

    ret.write(", ");
    ret.write("name:");
    if(this.name == null) {
      ret.write("null");
    } else {
      ret.write(this.name);
    }

    ret.write(")");

    return ret.toString();
  }

  bool operator ==(Object o) {
    if(o == null || !(o is enterAlbumGiveaway_args)) {
      return false;
    }
    enterAlbumGiveaway_args other = o as enterAlbumGiveaway_args;
    return this.email == other.email
      && this.name == other.name;
  }

  int get hashCode {
    var value = 17;
    value = (value * 31) ^ email.hashCode;
    value = (value * 31) ^ name.hashCode;
    return value;
  }

  enterAlbumGiveaway_args clone({
    String email: null,
    String name: null,
  }) {
    return new enterAlbumGiveaway_args()
      ..email = email ?? this.email
      ..name = name ?? this.name;
  }

  validate() {
  }
}
class enterAlbumGiveaway_result implements thrift.TBase {
  static final thrift.TStruct _STRUCT_DESC = new thrift.TStruct("enterAlbumGiveaway_result");
  static final thrift.TField _SUCCESS_FIELD_DESC = new thrift.TField("success", thrift.TType.BOOL, 0);

  bool success;
  static const int SUCCESS = 0;


  enterAlbumGiveaway_result() {
  }

  @deprecated
  bool isSetSuccess() => success != null;

  @deprecated
  unsetSuccess() => success = null;

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case SUCCESS:
        return this.success;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object value) {
    switch(fieldID) {
      case SUCCESS:
        if (value == null) {
          success = null;
        } else if (value is bool) {
          success = value;
        }

        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if the field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch(fieldID) {
      case SUCCESS:
        return success == null;

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
        case SUCCESS:
          if(field.type == thrift.TType.BOOL) {
            success = iprot.readBool();
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

  write(thrift.TProtocol oprot) {
    validate();

    oprot.writeStructBegin(_STRUCT_DESC);
    if(success != null) {
      oprot.writeFieldBegin(_SUCCESS_FIELD_DESC);
      oprot.writeBool(success);
      oprot.writeFieldEnd();
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("enterAlbumGiveaway_result(");

    if(success != null) {
      ret.write("success:");
      ret.write(this.success);
    }

    ret.write(")");

    return ret.toString();
  }

  bool operator ==(Object o) {
    if(o == null || !(o is enterAlbumGiveaway_result)) {
      return false;
    }
    enterAlbumGiveaway_result other = o as enterAlbumGiveaway_result;
    return this.success == other.success;
  }

  int get hashCode {
    var value = 17;
    value = (value * 31) ^ success.hashCode;
    return value;
  }

  enterAlbumGiveaway_result clone({
    bool success: null,
  }) {
    return new enterAlbumGiveaway_result()
      ..success = success ?? this.success;
  }

  validate() {
  }
}
