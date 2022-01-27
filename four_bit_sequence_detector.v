module four_bit_sequence_detector (clock, reset, I, F);

input clock, reset, I;
output reg F;

parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b1000;

reg [2:0] CS, NS;// Holds the state of the FSM

// Changes or resets the state of the mashine
always @ (posedge clock)
begin
	if (reset)
	CS <= S0;
	else
	CS <= NS;
	end

always @ (CS, I)
begin 
	case(CS)
	
	S0:begin
	if(I==0)
	NS= S0;
	else
	NS = S1;
	end
	S1:begin
	if(I==0)
	NS = S2;
	else
	NS = S1;
	end
	S2: begin
	if(I==0)
	NS = S3;
	else 
	NS = S1;
	end
	S3: begin
	if(I==0)
	NS = S0;
	else
	NS = S4;
	end
	S4: begin
	if (I==0)
	NS = S2;
	else
	NS = S1;
	end
	
	default:NS = S0;
	endcase
	assign F = (CS==S4) ? 1:0;
	
end
	

endmodule
