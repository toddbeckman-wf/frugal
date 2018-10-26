// Autogenerated by Frugal Compiler (2.22.2)
// DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING



import 'dart:async';
import 'dart:typed_data' show Uint8List;

import 'package:thrift/thrift.dart' as thrift;
import 'package:frugal/frugal.dart' as frugal;

import 'package:variety/variety.dart' as t_variety;


const String delimiter = '.';

/// This docstring gets added to the generated code because it has
/// the @ sign. Prefix specifies topic prefix tokens, which can be static or
/// variable.
class EventsPublisher {
  frugal.FPublisherTransport transport;
  frugal.FProtocolFactory protocolFactory;
  List<frugal.Middleware> _combinedMiddleware;
  EventsPublisher(frugal.FScopeProvider provider, [List<frugal.Middleware> middleware]) {
    transport = provider.publisherTransportFactory.getTransport();
    protocolFactory = provider.protocolFactory;
    _combinedMiddleware = middleware ?? [];
    _combinedMiddleware.addAll(provider.middleware);
  }

  Future open() {
    return transport.open();
  }

  Future close() {
    return transport.close();
  }

  /// This is a docstring.
  Future publishEventCreated(frugal.FContext ctx, String user, t_variety.Event req) {
    return frugal.composeMiddleware(_publishEventCreated, _combinedMiddleware)('Events', 'publishEventCreated', [ctx, user, req]);
  }

  Future _publishEventCreated(frugal.FContext ctx, String user, t_variety.Event req) async {
    ctx.addRequestHeader('_topic_user', user);
    var op = "EventCreated";
    var prefix = "foo.${user}.";
    var topic = "${prefix}Events${delimiter}${op}";
    var memoryBuffer = new frugal.TMemoryOutputBuffer(transport.publishSizeLimit);
    var oprot = protocolFactory.getProtocol(memoryBuffer);
    var msg = new thrift.TMessage(op, thrift.TMessageType.CALL, 0);
    oprot.writeRequestHeader(ctx);
    oprot.writeMessageBegin(msg);
    req.write(oprot);
    oprot.writeMessageEnd();
    await transport.publish(topic, memoryBuffer.writeBytes);
  }


  Future publishSomeInt(frugal.FContext ctx, String user, int req) {
    return frugal.composeMiddleware(_publishSomeInt, _combinedMiddleware)('Events', 'publishSomeInt', [ctx, user, req]);
  }

  Future _publishSomeInt(frugal.FContext ctx, String user, int req) async {
    ctx.addRequestHeader('_topic_user', user);
    var op = "SomeInt";
    var prefix = "foo.${user}.";
    var topic = "${prefix}Events${delimiter}${op}";
    var memoryBuffer = new frugal.TMemoryOutputBuffer(transport.publishSizeLimit);
    var oprot = protocolFactory.getProtocol(memoryBuffer);
    var msg = new thrift.TMessage(op, thrift.TMessageType.CALL, 0);
    oprot.writeRequestHeader(ctx);
    oprot.writeMessageBegin(msg);
    oprot.writeI64(req);
    oprot.writeMessageEnd();
    await transport.publish(topic, memoryBuffer.writeBytes);
  }


  Future publishSomeStr(frugal.FContext ctx, String user, String req) {
    return frugal.composeMiddleware(_publishSomeStr, _combinedMiddleware)('Events', 'publishSomeStr', [ctx, user, req]);
  }

  Future _publishSomeStr(frugal.FContext ctx, String user, String req) async {
    ctx.addRequestHeader('_topic_user', user);
    var op = "SomeStr";
    var prefix = "foo.${user}.";
    var topic = "${prefix}Events${delimiter}${op}";
    var memoryBuffer = new frugal.TMemoryOutputBuffer(transport.publishSizeLimit);
    var oprot = protocolFactory.getProtocol(memoryBuffer);
    var msg = new thrift.TMessage(op, thrift.TMessageType.CALL, 0);
    oprot.writeRequestHeader(ctx);
    oprot.writeMessageBegin(msg);
    oprot.writeString(req);
    oprot.writeMessageEnd();
    await transport.publish(topic, memoryBuffer.writeBytes);
  }


  Future publishSomeList(frugal.FContext ctx, String user, List<Map<int, t_variety.Event>> req) {
    return frugal.composeMiddleware(_publishSomeList, _combinedMiddleware)('Events', 'publishSomeList', [ctx, user, req]);
  }

  Future _publishSomeList(frugal.FContext ctx, String user, List<Map<int, t_variety.Event>> req) async {
    ctx.addRequestHeader('_topic_user', user);
    var op = "SomeList";
    var prefix = "foo.${user}.";
    var topic = "${prefix}Events${delimiter}${op}";
    var memoryBuffer = new frugal.TMemoryOutputBuffer(transport.publishSizeLimit);
    var oprot = protocolFactory.getProtocol(memoryBuffer);
    var msg = new thrift.TMessage(op, thrift.TMessageType.CALL, 0);
    oprot.writeRequestHeader(ctx);
    oprot.writeMessageBegin(msg);
    oprot.writeListBegin(new thrift.TList(thrift.TType.MAP, req.length));
    for(var elem72 in req) {
      oprot.writeMapBegin(new thrift.TMap(thrift.TType.I64, thrift.TType.STRUCT, elem72.length));
      for(var elem73 in elem72.keys) {
        oprot.writeI64(elem73);
        elem72[elem73].write(oprot);
      }
      oprot.writeMapEnd();
    }
    oprot.writeListEnd();
    oprot.writeMessageEnd();
    await transport.publish(topic, memoryBuffer.writeBytes);
  }
}


/// This docstring gets added to the generated code because it has
/// the @ sign. Prefix specifies topic prefix tokens, which can be static or
/// variable.
class EventsSubscriber {
  final frugal.FScopeProvider provider;
  final List<frugal.Middleware> _middleware;

  EventsSubscriber(this.provider, [List<frugal.Middleware> middleware])
      : this._middleware = middleware ?? [] {
    this._middleware.addAll(provider.middleware);
}

  /// This is a docstring.
  Future<frugal.FSubscription> subscribeEventCreated(String user, dynamic onEvent(frugal.FContext ctx, t_variety.Event req)) async {
    var op = "EventCreated";
    var prefix = "foo.${user}.";
    var topic = "${prefix}Events${delimiter}${op}";
    var transport = provider.subscriberTransportFactory.getTransport();
    await transport.subscribe(topic, _recvEventCreated(op, provider.protocolFactory, onEvent));
    return new frugal.FSubscription(topic, transport);
  }

  frugal.FAsyncCallback _recvEventCreated(String op, frugal.FProtocolFactory protocolFactory, dynamic onEvent(frugal.FContext ctx, t_variety.Event req)) {
    callbackEventCreated(thrift.TTransport transport) {
      var iprot = protocolFactory.getProtocol(transport);
      var ctx = iprot.readRequestHeader();
      var tMsg = iprot.readMessageBegin();
      if (tMsg.name != op) {
        thrift.TProtocolUtil.skip(iprot, thrift.TType.STRUCT);
        iprot.readMessageEnd();
        throw new thrift.TApplicationError(
        frugal.FrugalTApplicationErrorType.UNKNOWN_METHOD, tMsg.name);
      }
      t_variety.Event req = new t_variety.Event();
      req.read(iprot);
      iprot.readMessageEnd();
      frugal.composeMiddleware(onEvent, _middleware)('Events', 'subscribeEvent', [ctx, req]);
    }
    return callbackEventCreated;
  }


  Future<frugal.FSubscription> subscribeSomeInt(String user, dynamic oni64(frugal.FContext ctx, int req)) async {
    var op = "SomeInt";
    var prefix = "foo.${user}.";
    var topic = "${prefix}Events${delimiter}${op}";
    var transport = provider.subscriberTransportFactory.getTransport();
    await transport.subscribe(topic, _recvSomeInt(op, provider.protocolFactory, oni64));
    return new frugal.FSubscription(topic, transport);
  }

  frugal.FAsyncCallback _recvSomeInt(String op, frugal.FProtocolFactory protocolFactory, dynamic oni64(frugal.FContext ctx, int req)) {
    callbackSomeInt(thrift.TTransport transport) {
      var iprot = protocolFactory.getProtocol(transport);
      var ctx = iprot.readRequestHeader();
      var tMsg = iprot.readMessageBegin();
      if (tMsg.name != op) {
        thrift.TProtocolUtil.skip(iprot, thrift.TType.STRUCT);
        iprot.readMessageEnd();
        throw new thrift.TApplicationError(
        frugal.FrugalTApplicationErrorType.UNKNOWN_METHOD, tMsg.name);
      }
      int req = iprot.readI64();
      iprot.readMessageEnd();
      frugal.composeMiddleware(oni64, _middleware)('Events', 'subscribei64', [ctx, req]);
    }
    return callbackSomeInt;
  }


  Future<frugal.FSubscription> subscribeSomeStr(String user, dynamic onstring(frugal.FContext ctx, String req)) async {
    var op = "SomeStr";
    var prefix = "foo.${user}.";
    var topic = "${prefix}Events${delimiter}${op}";
    var transport = provider.subscriberTransportFactory.getTransport();
    await transport.subscribe(topic, _recvSomeStr(op, provider.protocolFactory, onstring));
    return new frugal.FSubscription(topic, transport);
  }

  frugal.FAsyncCallback _recvSomeStr(String op, frugal.FProtocolFactory protocolFactory, dynamic onstring(frugal.FContext ctx, String req)) {
    callbackSomeStr(thrift.TTransport transport) {
      var iprot = protocolFactory.getProtocol(transport);
      var ctx = iprot.readRequestHeader();
      var tMsg = iprot.readMessageBegin();
      if (tMsg.name != op) {
        thrift.TProtocolUtil.skip(iprot, thrift.TType.STRUCT);
        iprot.readMessageEnd();
        throw new thrift.TApplicationError(
        frugal.FrugalTApplicationErrorType.UNKNOWN_METHOD, tMsg.name);
      }
      String req = iprot.readString();
      iprot.readMessageEnd();
      frugal.composeMiddleware(onstring, _middleware)('Events', 'subscribestring', [ctx, req]);
    }
    return callbackSomeStr;
  }


  Future<frugal.FSubscription> subscribeSomeList(String user, dynamic onlist(frugal.FContext ctx, List<Map<int, t_variety.Event>> req)) async {
    var op = "SomeList";
    var prefix = "foo.${user}.";
    var topic = "${prefix}Events${delimiter}${op}";
    var transport = provider.subscriberTransportFactory.getTransport();
    await transport.subscribe(topic, _recvSomeList(op, provider.protocolFactory, onlist));
    return new frugal.FSubscription(topic, transport);
  }

  frugal.FAsyncCallback _recvSomeList(String op, frugal.FProtocolFactory protocolFactory, dynamic onlist(frugal.FContext ctx, List<Map<int, t_variety.Event>> req)) {
    callbackSomeList(thrift.TTransport transport) {
      var iprot = protocolFactory.getProtocol(transport);
      var ctx = iprot.readRequestHeader();
      var tMsg = iprot.readMessageBegin();
      if (tMsg.name != op) {
        thrift.TProtocolUtil.skip(iprot, thrift.TType.STRUCT);
        iprot.readMessageEnd();
        throw new thrift.TApplicationError(
        frugal.FrugalTApplicationErrorType.UNKNOWN_METHOD, tMsg.name);
      }
      thrift.TList elem74 = iprot.readListBegin();
      List<Map<int, t_variety.Event>> req = new List<Map<int, t_variety.Event>>();
      for(int elem80 = 0; elem80 < elem74.length; ++elem80) {
        thrift.TMap elem76 = iprot.readMapBegin();
        Map<int, t_variety.Event> elem75 = new Map<int, t_variety.Event>();
        for(int elem78 = 0; elem78 < elem76.length; ++elem78) {
          int elem79 = iprot.readI64();
          t_variety.Event elem77 = new t_variety.Event();
          elem77.read(iprot);
          elem75[elem79] = elem77;
        }
        iprot.readMapEnd();
        req.add(elem75);
      }
      iprot.readListEnd();
      iprot.readMessageEnd();
      frugal.composeMiddleware(onlist, _middleware)('Events', 'subscribelist', [ctx, req]);
    }
    return callbackSomeList;
  }
}

