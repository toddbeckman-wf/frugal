// Autogenerated by Frugal Compiler (2.9.0)
// DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING



import 'dart:async';

import 'package:thrift/thrift.dart' as thrift;
import 'package:frugal/frugal.dart' as frugal;

import 'package:some_vendored_place/vendor_namespace.dart' as t_vendor_namespace;
import 'package:include_vendor/include_vendor.dart' as t_include_vendor;


const String delimiter = '.';

class MyScopePublisher {
  frugal.FPublisherTransport transport;
  frugal.FProtocolFactory protocolFactory;
  Map<String, frugal.FMethod> _methods;
  MyScopePublisher(frugal.FScopeProvider provider, [List<frugal.Middleware> middleware]) {
    transport = provider.publisherTransportFactory.getTransport();
    protocolFactory = provider.protocolFactory;
    var combined = middleware ?? [];
    combined.addAll(provider.middleware);
    this._methods = {};
    this._methods['newItem'] = new frugal.FMethod(this._publishnewItem, 'MyScope', 'publishnewItem', combined);
  }

  Future open() {
    return transport.open();
  }

  Future close() {
    return transport.close();
  }

  Future publishnewItem(frugal.FContext ctx, t_vendor_namespace.Item req) {
    return this._methods['newItem']([ctx, req]);
  }

  Future _publishnewItem(frugal.FContext ctx, t_vendor_namespace.Item req) async {
    var op = "newItem";
    var prefix = "";
    var topic = "${prefix}MyScope${delimiter}${op}";
    var memoryBuffer = new frugal.TMemoryOutputBuffer(transport.publishSizeLimit);
    var oprot = protocolFactory.getProtocol(memoryBuffer);
    var msg = new thrift.TMessage(op, thrift.TMessageType.CALL, 0);
    oprot.writeRequestHeader(ctx);
    oprot.writeMessageBegin(msg);
    req.write(oprot);
    oprot.writeMessageEnd();
    await transport.publish(topic, memoryBuffer.writeBytes);
  }
}


class MyScopeSubscriber {
  final frugal.FScopeProvider provider;
  final List<frugal.Middleware> _middleware;

  MyScopeSubscriber(this.provider, [List<frugal.Middleware> middleware])
      : this._middleware = middleware ?? [] {
    this._middleware.addAll(provider.middleware);
}

  Future<frugal.FSubscription> subscribenewItem(dynamic onItem(frugal.FContext ctx, t_vendor_namespace.Item req)) async {
    var op = "newItem";
    var prefix = "";
    var topic = "${prefix}MyScope${delimiter}${op}";
    var transport = provider.subscriberTransportFactory.getTransport();
    await transport.subscribe(topic, _recvnewItem(op, provider.protocolFactory, onItem));
    return new frugal.FSubscription(topic, transport);
  }

  frugal.FAsyncCallback _recvnewItem(String op, frugal.FProtocolFactory protocolFactory, dynamic onItem(frugal.FContext ctx, t_vendor_namespace.Item req)) {
    frugal.FMethod method = new frugal.FMethod(onItem, 'MyScope', 'subscribeItem', this._middleware);
    callbacknewItem(thrift.TTransport transport) {
      var iprot = protocolFactory.getProtocol(transport);
      var ctx = iprot.readRequestHeader();
      var tMsg = iprot.readMessageBegin();
      if (tMsg.name != op) {
        thrift.TProtocolUtil.skip(iprot, thrift.TType.STRUCT);
        iprot.readMessageEnd();
        throw new thrift.TApplicationError(
        frugal.FrugalTApplicationErrorType.UNKNOWN_METHOD, tMsg.name);
      }
      t_vendor_namespace.Item req = new t_vendor_namespace.Item();
      req.read(iprot);
      iprot.readMessageEnd();
      method([ctx, req]);
    }
    return callbacknewItem;
  }
}
