import FIFO::*;
import Vector::*;
import SpeckTypes::*;

typedef 1000 TESTAMOUNT;
typedef 10 INITAMOUNT;

interface SetKey#(numeric type n, numeric type m, numeric type t);
    method Action setKey(Vector#(m,UInt#(n)) key);
    method ActionValue#(Bool) ready();
endinterface

module mkThroughputTest(EncryptDecrypt#(N,M,T) engine, SetKey#(N,M,T) ifc);
    FIFO#(Block#(N)) inputFIFO <- mkFIFO();
    Reg#(Bool) started <- mkReg(False);
    Reg#(int) countin <- mkReg(0);
    Reg#(int) countout <-mkReg(0);

    // FIRST TEST INPUTS
    Vector#(INITAMOUNT,Block#(N)) testvector = newVector();
    // generated with cpp program:
    testvector[0] = tuple2('h6d2073, 'h696874);
    testvector[1] = tuple2('h20796c, 'h6c6172);
    testvector[2] = tuple2('h83e5a0, 'h12d53f);
    testvector[3] = tuple2('h6574a8, 'h694c42);
    testvector[4] = tuple2('h746146, 'h736e61);
    testvector[5] = tuple2('h3b7265, 'h747543);
    testvector[6] = tuple2('h65776f, 'h68202c);
    testvector[7] = tuple2('h656761, 'h737520);
    testvector[8] = tuple2('h656d69, 'h74206e);
    testvector[9] = tuple2('h69202c, 'h726576);

    rule feed if(started);
        let x = ?;
        if(countout==0) begin // for the first 30 vectors, we take from testvector
            x = testvector[countin];
        end
        else begin // afterwards, we'll have something in the fifo
            x = inputFIFO.first();
            //$display("x = %h %h", tpl_1(x), tpl_2(x));
            inputFIFO.deq;
        end
        engine.inputMessage(x);
        countin <= countin +1;
        if(countin == fromInteger(valueof(TESTAMOUNT))-1) begin
            started <= False;
        end
    endrule

    rule receive;
        let x <- engine.getResult();
        if(started)
            inputFIFO.enq(x); // put encrypt results in fifo as new random inputs
        // this is allowed because input and output formats are the same and all we need is random inputs
        countout <= countout + 1;
    endrule

    method Action setKey(Vector#(M,UInt#(N)) key) if (!started);
        engine.setKey(key);
        started <= True;
    endmethod

    method ActionValue#(Bool) ready();
        return (countout == fromInteger(valueof(TESTAMOUNT)));
    endmethod
endmodule