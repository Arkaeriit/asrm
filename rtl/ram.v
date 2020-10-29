/*-------------------------------------\
|This module codes for a ram block with|
|the same input and output addresses   |
\-------------------------------------*/

module ram
    #(parameter addrSize = 9,
    contentSize = 8
    )(
    input clk,
    input reset,
    input output_en,
    input [addrSize-1:0] addr,
    input [contentSize-1:0] data_in,
    input write_rq,
    output [contentSize-1:0] data_out
    );
    

	// Declare memory 
	reg [contentSize-1:0] memory_ram [(2**addrSize)-1:0];
	
	always @(posedge clk)
		if(!reset)
			for (integer i=0;i<(2**addrSize); i=i+1)
            begin
				memory_ram[i] = 0;
            end
		else
        begin
            if(write_rq)
                memory_ram[addr] = data_in;
        end
        
   assign data_out = (output_en ? memory_ram[addr] : 0);

endmodule

