// Autogenerated by Thrift Compiler (1.0.0-dev)
// DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING

package event

import (
	"bytes"
	"fmt"
	"git.apache.org/thrift.git/lib/go/thrift"
)

// (needed to ensure safety because of naive import list construction.)
var _ = thrift.ZERO
var _ = fmt.Printf
var _ = bytes.Equal

type Foo interface { //This is a thrift service. Frugal will generate bindings that include
	//a frugal Context for each service call.

	// Ping the server.
	Ping() (err error)
	// Blah the server.
	//
	// Parameters:
	//  - Num
	//  - Str
	//  - Event
	Blah(num int32, Str string, event *Event) (r int64, err error)
}

//This is a thrift service. Frugal will generate bindings that include
//a frugal Context for each service call.
type FooClient struct {
	Transport       thrift.TTransport
	ProtocolFactory thrift.TProtocolFactory
	InputProtocol   thrift.TProtocol
	OutputProtocol  thrift.TProtocol
	SeqId           int32
}

func NewFooClientFactory(t thrift.TTransport, f thrift.TProtocolFactory) *FooClient {
	return &FooClient{Transport: t,
		ProtocolFactory: f,
		InputProtocol:   f.GetProtocol(t),
		OutputProtocol:  f.GetProtocol(t),
		SeqId:           0,
	}
}

func NewFooClientProtocol(t thrift.TTransport, iprot thrift.TProtocol, oprot thrift.TProtocol) *FooClient {
	return &FooClient{Transport: t,
		ProtocolFactory: nil,
		InputProtocol:   iprot,
		OutputProtocol:  oprot,
		SeqId:           0,
	}
}

// Ping the server.
func (p *FooClient) Ping() (err error) {
	if err = p.sendPing(); err != nil {
		return
	}
	return p.recvPing()
}

func (p *FooClient) sendPing() (err error) {
	oprot := p.OutputProtocol
	if oprot == nil {
		oprot = p.ProtocolFactory.GetProtocol(p.Transport)
		p.OutputProtocol = oprot
	}
	p.SeqId++
	if err = oprot.WriteMessageBegin("ping", thrift.CALL, p.SeqId); err != nil {
		return
	}
	args := FooPingArgs{}
	if err = args.Write(oprot); err != nil {
		return
	}
	if err = oprot.WriteMessageEnd(); err != nil {
		return
	}
	return oprot.Flush()
}

func (p *FooClient) recvPing() (err error) {
	iprot := p.InputProtocol
	if iprot == nil {
		iprot = p.ProtocolFactory.GetProtocol(p.Transport)
		p.InputProtocol = iprot
	}
	method, mTypeId, seqId, err := iprot.ReadMessageBegin()
	if err != nil {
		return
	}
	if method != "ping" {
		err = thrift.NewTApplicationException(thrift.WRONG_METHOD_NAME, "ping failed: wrong method name")
		return
	}
	if p.SeqId != seqId {
		err = thrift.NewTApplicationException(thrift.BAD_SEQUENCE_ID, "ping failed: out of sequence response")
		return
	}
	if mTypeId == thrift.EXCEPTION {
		error0 := thrift.NewTApplicationException(thrift.UNKNOWN_APPLICATION_EXCEPTION, "Unknown Exception")
		var error1 error
		error1, err = error0.Read(iprot)
		if err != nil {
			return
		}
		if err = iprot.ReadMessageEnd(); err != nil {
			return
		}
		err = error1
		return
	}
	if mTypeId != thrift.REPLY {
		err = thrift.NewTApplicationException(thrift.INVALID_MESSAGE_TYPE_EXCEPTION, "ping failed: invalid message type")
		return
	}
	result := FooPingResult{}
	if err = result.Read(iprot); err != nil {
		return
	}
	if err = iprot.ReadMessageEnd(); err != nil {
		return
	}
	return
}

// Blah the server.
//
// Parameters:
//  - Num
//  - Str
//  - Event
func (p *FooClient) Blah(num int32, Str string, event *Event) (r int64, err error) {
	if err = p.sendBlah(num, Str, event); err != nil {
		return
	}
	return p.recvBlah()
}

func (p *FooClient) sendBlah(num int32, Str string, event *Event) (err error) {
	oprot := p.OutputProtocol
	if oprot == nil {
		oprot = p.ProtocolFactory.GetProtocol(p.Transport)
		p.OutputProtocol = oprot
	}
	p.SeqId++
	if err = oprot.WriteMessageBegin("blah", thrift.CALL, p.SeqId); err != nil {
		return
	}
	args := FooBlahArgs{
		Num:   num,
		Str:   Str,
		Event: event,
	}
	if err = args.Write(oprot); err != nil {
		return
	}
	if err = oprot.WriteMessageEnd(); err != nil {
		return
	}
	return oprot.Flush()
}

func (p *FooClient) recvBlah() (value int64, err error) {
	iprot := p.InputProtocol
	if iprot == nil {
		iprot = p.ProtocolFactory.GetProtocol(p.Transport)
		p.InputProtocol = iprot
	}
	method, mTypeId, seqId, err := iprot.ReadMessageBegin()
	if err != nil {
		return
	}
	if method != "blah" {
		err = thrift.NewTApplicationException(thrift.WRONG_METHOD_NAME, "blah failed: wrong method name")
		return
	}
	if p.SeqId != seqId {
		err = thrift.NewTApplicationException(thrift.BAD_SEQUENCE_ID, "blah failed: out of sequence response")
		return
	}
	if mTypeId == thrift.EXCEPTION {
		error2 := thrift.NewTApplicationException(thrift.UNKNOWN_APPLICATION_EXCEPTION, "Unknown Exception")
		var error3 error
		error3, err = error2.Read(iprot)
		if err != nil {
			return
		}
		if err = iprot.ReadMessageEnd(); err != nil {
			return
		}
		err = error3
		return
	}
	if mTypeId != thrift.REPLY {
		err = thrift.NewTApplicationException(thrift.INVALID_MESSAGE_TYPE_EXCEPTION, "blah failed: invalid message type")
		return
	}
	result := FooBlahResult{}
	if err = result.Read(iprot); err != nil {
		return
	}
	if err = iprot.ReadMessageEnd(); err != nil {
		return
	}
	if result.Awe != nil {
		err = result.Awe
		return
	}
	value = result.GetSuccess()
	return
}

type FooProcessor struct {
	processorMap map[string]thrift.TProcessorFunction
	handler      Foo
}

func (p *FooProcessor) AddToProcessorMap(key string, processor thrift.TProcessorFunction) {
	p.processorMap[key] = processor
}

func (p *FooProcessor) GetProcessorFunction(key string) (processor thrift.TProcessorFunction, ok bool) {
	processor, ok = p.processorMap[key]
	return processor, ok
}

func (p *FooProcessor) ProcessorMap() map[string]thrift.TProcessorFunction {
	return p.processorMap
}

func NewFooProcessor(handler Foo) *FooProcessor {

	self4 := &FooProcessor{handler: handler, processorMap: make(map[string]thrift.TProcessorFunction)}
	self4.processorMap["ping"] = &fooProcessorPing{handler: handler}
	self4.processorMap["blah"] = &fooProcessorBlah{handler: handler}
	return self4
}

func (p *FooProcessor) Process(iprot, oprot thrift.TProtocol) (success bool, err thrift.TException) {
	name, _, seqId, err := iprot.ReadMessageBegin()
	if err != nil {
		return false, err
	}
	if processor, ok := p.GetProcessorFunction(name); ok {
		return processor.Process(seqId, iprot, oprot)
	}
	iprot.Skip(thrift.STRUCT)
	iprot.ReadMessageEnd()
	x5 := thrift.NewTApplicationException(thrift.UNKNOWN_METHOD, "Unknown function "+name)
	oprot.WriteMessageBegin(name, thrift.EXCEPTION, seqId)
	x5.Write(oprot)
	oprot.WriteMessageEnd()
	oprot.Flush()
	return false, x5

}

type fooProcessorPing struct {
	handler Foo
}

func (p *fooProcessorPing) Process(seqId int32, iprot, oprot thrift.TProtocol) (success bool, err thrift.TException) {
	args := FooPingArgs{}
	if err = args.Read(iprot); err != nil {
		iprot.ReadMessageEnd()
		x := thrift.NewTApplicationException(thrift.PROTOCOL_ERROR, err.Error())
		oprot.WriteMessageBegin("ping", thrift.EXCEPTION, seqId)
		x.Write(oprot)
		oprot.WriteMessageEnd()
		oprot.Flush()
		return false, err
	}

	iprot.ReadMessageEnd()
	result := FooPingResult{}
	var err2 error
	if err2 = p.handler.Ping(); err2 != nil {
		x := thrift.NewTApplicationException(thrift.INTERNAL_ERROR, "Internal error processing ping: "+err2.Error())
		oprot.WriteMessageBegin("ping", thrift.EXCEPTION, seqId)
		x.Write(oprot)
		oprot.WriteMessageEnd()
		oprot.Flush()
		return true, err2
	}
	if err2 = oprot.WriteMessageBegin("ping", thrift.REPLY, seqId); err2 != nil {
		err = err2
	}
	if err2 = result.Write(oprot); err == nil && err2 != nil {
		err = err2
	}
	if err2 = oprot.WriteMessageEnd(); err == nil && err2 != nil {
		err = err2
	}
	if err2 = oprot.Flush(); err == nil && err2 != nil {
		err = err2
	}
	if err != nil {
		return
	}
	return true, err
}

type fooProcessorBlah struct {
	handler Foo
}

func (p *fooProcessorBlah) Process(seqId int32, iprot, oprot thrift.TProtocol) (success bool, err thrift.TException) {
	args := FooBlahArgs{}
	if err = args.Read(iprot); err != nil {
		iprot.ReadMessageEnd()
		x := thrift.NewTApplicationException(thrift.PROTOCOL_ERROR, err.Error())
		oprot.WriteMessageBegin("blah", thrift.EXCEPTION, seqId)
		x.Write(oprot)
		oprot.WriteMessageEnd()
		oprot.Flush()
		return false, err
	}

	iprot.ReadMessageEnd()
	result := FooBlahResult{}
	var retval int64
	var err2 error
	if retval, err2 = p.handler.Blah(args.Num, args.Str, args.Event); err2 != nil {
		switch v := err2.(type) {
		case *AwesomeException:
			result.Awe = v
		default:
			x := thrift.NewTApplicationException(thrift.INTERNAL_ERROR, "Internal error processing blah: "+err2.Error())
			oprot.WriteMessageBegin("blah", thrift.EXCEPTION, seqId)
			x.Write(oprot)
			oprot.WriteMessageEnd()
			oprot.Flush()
			return true, err2
		}
	} else {
		result.Success = &retval
	}
	if err2 = oprot.WriteMessageBegin("blah", thrift.REPLY, seqId); err2 != nil {
		err = err2
	}
	if err2 = result.Write(oprot); err == nil && err2 != nil {
		err = err2
	}
	if err2 = oprot.WriteMessageEnd(); err == nil && err2 != nil {
		err = err2
	}
	if err2 = oprot.Flush(); err == nil && err2 != nil {
		err = err2
	}
	if err != nil {
		return
	}
	return true, err
}

// HELPER FUNCTIONS AND STRUCTURES

type FooPingArgs struct {
}

func NewFooPingArgs() *FooPingArgs {
	return &FooPingArgs{}
}

func (p *FooPingArgs) Read(iprot thrift.TProtocol) error {
	if _, err := iprot.ReadStructBegin(); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T read error: ", p), err)
	}

	for {
		_, fieldTypeId, fieldId, err := iprot.ReadFieldBegin()
		if err != nil {
			return thrift.PrependError(fmt.Sprintf("%T field %d read error: ", p, fieldId), err)
		}
		if fieldTypeId == thrift.STOP {
			break
		}
		if err := iprot.Skip(fieldTypeId); err != nil {
			return err
		}
		if err := iprot.ReadFieldEnd(); err != nil {
			return err
		}
	}
	if err := iprot.ReadStructEnd(); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T read struct end error: ", p), err)
	}
	return nil
}

func (p *FooPingArgs) Write(oprot thrift.TProtocol) error {
	if err := oprot.WriteStructBegin("ping_args"); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T write struct begin error: ", p), err)
	}
	if err := oprot.WriteFieldStop(); err != nil {
		return thrift.PrependError("write field stop error: ", err)
	}
	if err := oprot.WriteStructEnd(); err != nil {
		return thrift.PrependError("write struct stop error: ", err)
	}
	return nil
}

func (p *FooPingArgs) String() string {
	if p == nil {
		return "<nil>"
	}
	return fmt.Sprintf("FooPingArgs(%+v)", *p)
}

type FooPingResult struct {
}

func NewFooPingResult() *FooPingResult {
	return &FooPingResult{}
}

func (p *FooPingResult) Read(iprot thrift.TProtocol) error {
	if _, err := iprot.ReadStructBegin(); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T read error: ", p), err)
	}

	for {
		_, fieldTypeId, fieldId, err := iprot.ReadFieldBegin()
		if err != nil {
			return thrift.PrependError(fmt.Sprintf("%T field %d read error: ", p, fieldId), err)
		}
		if fieldTypeId == thrift.STOP {
			break
		}
		if err := iprot.Skip(fieldTypeId); err != nil {
			return err
		}
		if err := iprot.ReadFieldEnd(); err != nil {
			return err
		}
	}
	if err := iprot.ReadStructEnd(); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T read struct end error: ", p), err)
	}
	return nil
}

func (p *FooPingResult) Write(oprot thrift.TProtocol) error {
	if err := oprot.WriteStructBegin("ping_result"); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T write struct begin error: ", p), err)
	}
	if err := oprot.WriteFieldStop(); err != nil {
		return thrift.PrependError("write field stop error: ", err)
	}
	if err := oprot.WriteStructEnd(); err != nil {
		return thrift.PrependError("write struct stop error: ", err)
	}
	return nil
}

func (p *FooPingResult) String() string {
	if p == nil {
		return "<nil>"
	}
	return fmt.Sprintf("FooPingResult(%+v)", *p)
}

// Attributes:
//  - Num
//  - Str
//  - Event
type FooBlahArgs struct {
	Num   int32  `thrift:"num,1,required" json:"num"`
	Str   string `thrift:"Str,2,required" json:"Str"`
	Event *Event `thrift:"event,3,required" json:"event"`
}

func NewFooBlahArgs() *FooBlahArgs {
	return &FooBlahArgs{}
}

func (p *FooBlahArgs) GetNum() int32 {
	return p.Num
}

func (p *FooBlahArgs) GetStr() string {
	return p.Str
}

var FooBlahArgs_Event_DEFAULT *Event

func (p *FooBlahArgs) GetEvent() *Event {
	if !p.IsSetEvent() {
		return FooBlahArgs_Event_DEFAULT
	}
	return p.Event
}
func (p *FooBlahArgs) IsSetEvent() bool {
	return p.Event != nil
}

func (p *FooBlahArgs) Read(iprot thrift.TProtocol) error {
	if _, err := iprot.ReadStructBegin(); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T read error: ", p), err)
	}

	var issetNum bool = false
	var issetStr bool = false
	var issetEvent bool = false

	for {
		_, fieldTypeId, fieldId, err := iprot.ReadFieldBegin()
		if err != nil {
			return thrift.PrependError(fmt.Sprintf("%T field %d read error: ", p, fieldId), err)
		}
		if fieldTypeId == thrift.STOP {
			break
		}
		switch fieldId {
		case 1:
			if err := p.readField1(iprot); err != nil {
				return err
			}
			issetNum = true
		case 2:
			if err := p.readField2(iprot); err != nil {
				return err
			}
			issetStr = true
		case 3:
			if err := p.readField3(iprot); err != nil {
				return err
			}
			issetEvent = true
		default:
			if err := iprot.Skip(fieldTypeId); err != nil {
				return err
			}
		}
		if err := iprot.ReadFieldEnd(); err != nil {
			return err
		}
	}
	if err := iprot.ReadStructEnd(); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T read struct end error: ", p), err)
	}
	if !issetNum {
		return thrift.NewTProtocolExceptionWithType(thrift.INVALID_DATA, fmt.Errorf("Required field Num is not set"))
	}
	if !issetStr {
		return thrift.NewTProtocolExceptionWithType(thrift.INVALID_DATA, fmt.Errorf("Required field Str is not set"))
	}
	if !issetEvent {
		return thrift.NewTProtocolExceptionWithType(thrift.INVALID_DATA, fmt.Errorf("Required field Event is not set"))
	}
	return nil
}

func (p *FooBlahArgs) readField1(iprot thrift.TProtocol) error {
	if v, err := iprot.ReadI32(); err != nil {
		return thrift.PrependError("error reading field 1: ", err)
	} else {
		p.Num = v
	}
	return nil
}

func (p *FooBlahArgs) readField2(iprot thrift.TProtocol) error {
	if v, err := iprot.ReadString(); err != nil {
		return thrift.PrependError("error reading field 2: ", err)
	} else {
		p.Str = v
	}
	return nil
}

func (p *FooBlahArgs) readField3(iprot thrift.TProtocol) error {
	p.Event = &Event{
		ID: -1,
	}
	if err := p.Event.Read(iprot); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T error reading struct: ", p.Event), err)
	}
	return nil
}

func (p *FooBlahArgs) Write(oprot thrift.TProtocol) error {
	if err := oprot.WriteStructBegin("blah_args"); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T write struct begin error: ", p), err)
	}
	if err := p.writeField1(oprot); err != nil {
		return err
	}
	if err := p.writeField2(oprot); err != nil {
		return err
	}
	if err := p.writeField3(oprot); err != nil {
		return err
	}
	if err := oprot.WriteFieldStop(); err != nil {
		return thrift.PrependError("write field stop error: ", err)
	}
	if err := oprot.WriteStructEnd(); err != nil {
		return thrift.PrependError("write struct stop error: ", err)
	}
	return nil
}

func (p *FooBlahArgs) writeField1(oprot thrift.TProtocol) (err error) {
	if err := oprot.WriteFieldBegin("num", thrift.I32, 1); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T write field begin error 1:num: ", p), err)
	}
	if err := oprot.WriteI32(int32(p.Num)); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T.num (1) field write error: ", p), err)
	}
	if err := oprot.WriteFieldEnd(); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T write field end error 1:num: ", p), err)
	}
	return err
}

func (p *FooBlahArgs) writeField2(oprot thrift.TProtocol) (err error) {
	if err := oprot.WriteFieldBegin("Str", thrift.STRING, 2); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T write field begin error 2:Str: ", p), err)
	}
	if err := oprot.WriteString(string(p.Str)); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T.Str (2) field write error: ", p), err)
	}
	if err := oprot.WriteFieldEnd(); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T write field end error 2:Str: ", p), err)
	}
	return err
}

func (p *FooBlahArgs) writeField3(oprot thrift.TProtocol) (err error) {
	if err := oprot.WriteFieldBegin("event", thrift.STRUCT, 3); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T write field begin error 3:event: ", p), err)
	}
	if err := p.Event.Write(oprot); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T error writing struct: ", p.Event), err)
	}
	if err := oprot.WriteFieldEnd(); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T write field end error 3:event: ", p), err)
	}
	return err
}

func (p *FooBlahArgs) String() string {
	if p == nil {
		return "<nil>"
	}
	return fmt.Sprintf("FooBlahArgs(%+v)", *p)
}

// Attributes:
//  - Success
//  - Awe
type FooBlahResult struct {
	Success *int64            `thrift:"success,0" json:"success,omitempty"`
	Awe     *AwesomeException `thrift:"awe,1" json:"awe,omitempty"`
}

func NewFooBlahResult() *FooBlahResult {
	return &FooBlahResult{}
}

var FooBlahResult_Success_DEFAULT int64

func (p *FooBlahResult) GetSuccess() int64 {
	if !p.IsSetSuccess() {
		return FooBlahResult_Success_DEFAULT
	}
	return *p.Success
}

var FooBlahResult_Awe_DEFAULT *AwesomeException

func (p *FooBlahResult) GetAwe() *AwesomeException {
	if !p.IsSetAwe() {
		return FooBlahResult_Awe_DEFAULT
	}
	return p.Awe
}
func (p *FooBlahResult) IsSetSuccess() bool {
	return p.Success != nil
}

func (p *FooBlahResult) IsSetAwe() bool {
	return p.Awe != nil
}

func (p *FooBlahResult) Read(iprot thrift.TProtocol) error {
	if _, err := iprot.ReadStructBegin(); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T read error: ", p), err)
	}

	for {
		_, fieldTypeId, fieldId, err := iprot.ReadFieldBegin()
		if err != nil {
			return thrift.PrependError(fmt.Sprintf("%T field %d read error: ", p, fieldId), err)
		}
		if fieldTypeId == thrift.STOP {
			break
		}
		switch fieldId {
		case 0:
			if err := p.readField0(iprot); err != nil {
				return err
			}
		case 1:
			if err := p.readField1(iprot); err != nil {
				return err
			}
		default:
			if err := iprot.Skip(fieldTypeId); err != nil {
				return err
			}
		}
		if err := iprot.ReadFieldEnd(); err != nil {
			return err
		}
	}
	if err := iprot.ReadStructEnd(); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T read struct end error: ", p), err)
	}
	return nil
}

func (p *FooBlahResult) readField0(iprot thrift.TProtocol) error {
	if v, err := iprot.ReadI64(); err != nil {
		return thrift.PrependError("error reading field 0: ", err)
	} else {
		p.Success = &v
	}
	return nil
}

func (p *FooBlahResult) readField1(iprot thrift.TProtocol) error {
	p.Awe = &AwesomeException{}
	if err := p.Awe.Read(iprot); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T error reading struct: ", p.Awe), err)
	}
	return nil
}

func (p *FooBlahResult) Write(oprot thrift.TProtocol) error {
	if err := oprot.WriteStructBegin("blah_result"); err != nil {
		return thrift.PrependError(fmt.Sprintf("%T write struct begin error: ", p), err)
	}
	if err := p.writeField0(oprot); err != nil {
		return err
	}
	if err := p.writeField1(oprot); err != nil {
		return err
	}
	if err := oprot.WriteFieldStop(); err != nil {
		return thrift.PrependError("write field stop error: ", err)
	}
	if err := oprot.WriteStructEnd(); err != nil {
		return thrift.PrependError("write struct stop error: ", err)
	}
	return nil
}

func (p *FooBlahResult) writeField0(oprot thrift.TProtocol) (err error) {
	if p.IsSetSuccess() {
		if err := oprot.WriteFieldBegin("success", thrift.I64, 0); err != nil {
			return thrift.PrependError(fmt.Sprintf("%T write field begin error 0:success: ", p), err)
		}
		if err := oprot.WriteI64(int64(*p.Success)); err != nil {
			return thrift.PrependError(fmt.Sprintf("%T.success (0) field write error: ", p), err)
		}
		if err := oprot.WriteFieldEnd(); err != nil {
			return thrift.PrependError(fmt.Sprintf("%T write field end error 0:success: ", p), err)
		}
	}
	return err
}

func (p *FooBlahResult) writeField1(oprot thrift.TProtocol) (err error) {
	if p.IsSetAwe() {
		if err := oprot.WriteFieldBegin("awe", thrift.STRUCT, 1); err != nil {
			return thrift.PrependError(fmt.Sprintf("%T write field begin error 1:awe: ", p), err)
		}
		if err := p.Awe.Write(oprot); err != nil {
			return thrift.PrependError(fmt.Sprintf("%T error writing struct: ", p.Awe), err)
		}
		if err := oprot.WriteFieldEnd(); err != nil {
			return thrift.PrependError(fmt.Sprintf("%T write field end error 1:awe: ", p), err)
		}
	}
	return err
}

func (p *FooBlahResult) String() string {
	if p == nil {
		return "<nil>"
	}
	return fmt.Sprintf("FooBlahResult(%+v)", *p)
}
