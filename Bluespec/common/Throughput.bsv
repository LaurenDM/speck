import FIFO::*;
import Vector::*;
import SpeckTypes::*;
import Speck::*;

typedef 1000 TESTAMOUNT;
typedef 30 INITAMOUNT;

interface SetKey(numeric type n, numeric type n, numeric type t);
    method Action setKey(Vector#(m,UInt#(n)) key);
    method ActionValue#(Bool) ready();
endinterface

module mkThroughputTest(EncryptDecrypt#(N,M,T) engine, SetKey#(N,M,T) ifc);
    FIFO#(Block#(N)) inputFIFO <- mkFIFO();
    Reg#(Bool) started <- mkReg(False);
    Reg#(int) countin <- mkReg(0);
    Reg#(int) countout <-mkReg(0);

    rule feed if(started);
        let x = ?;
        if(countin<fromInteger(valueof(INITAMOUNT))) // for the first 30 vectors, we take from testvector
            x = testvector[countin];
        else begin // afterwards, we'll have something in the fifo
            x = inputFIFO.first();
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

    Vector#(INITAMOUNT,Block#(N)) testvector = newVector();
    // generated with cpp program:
    testvectors[0] = tuple2('h6d2073 'h696874);
    testvectors[1] = tuple2('h20796c 'h6c6172);
    testvectors[2] = tuple2('h83e5a0 'h12d53f);
    testvectors[3] = tuple2('h6574a8 'h694c42);
    testvectors[4] = tuple2('h746146 'h736e61);
    testvectors[5] = tuple2('h3b7265 'h747543);
    testvectors[6] = tuple2('h65776f 'h68202c);
    testvectors[7] = tuple2('h656761 'h737520);
    testvectors[8] = tuple2('h656d69 'h74206e);
    testvectors[9] = tuple2('h69202c 'h726576);
    testvectors[10] = tuple2('h6c6176 'h697571);
    testvectors[11] = tuple2('h652074 'h692065);
    testvectors[12] = tuple2('h4616d2 'h726148);
    testvectors[13] = tuple2('h206665 'h696843);
    testvectors[14] = tuple2('h206f74 'h20746e);
    testvectors[15] = tuple2('h65736f 'h687420);
    testvectors[16] = tuple2('h6e4920 'h2e7265);
    testvectors[17] = tuple2('he6f6f7 'h410901);
    testvectors[18] = tuple2('he19806 'hf8d5c9);
    testvectors[19] = tuple2('hf9d76f 'hcad347);
    testvectors[20] = tuple2('hd7efb8 'h735e84);
    testvectors[21] = tuple2('h667490 'h9d18ae);
    testvectors[22] = tuple2('h5474cc 'h611878);
    testvectors[23] = tuple2('hd0a176 'h9ac020);
    testvectors[24] = tuple2('h7560bb 'h6b5731);
    testvectors[25] = tuple2('haa4a57 'h6f5706);
    testvectors[26] = tuple2('hab91ba 'hfe9ad8);
    testvectors[27] = tuple2('h8159ab 'h8d496f);
    testvectors[28] = tuple2('ha6b5b7 'h18c424);
    testvectors[29] = tuple2('hf6fafd 'h1c8e35);
endmodule
