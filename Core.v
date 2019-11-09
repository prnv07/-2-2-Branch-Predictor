`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2019 02:01:25
// Design Name: 
// Module Name: Core
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Core(out, mode, inp);
output out;
reg out;
input [1:0] mode;
input inp;
reg [1:0] prev_out;
reg [1:0] out_nn, out_nt, out_tn, out_tt;

initial
begin
prev_out  = 2'b00;
out_nn = 2'b00;
out_nt = 2'b00;
out_tn = 2'b11;
out_tt = 2'b11;
out = 0;
end

always @(mode[0] or mode[1])
begin
    if(mode == 2'b00)
    begin
        if(prev_out == 2'b00)
        begin
        out<= out_nn[1];
//        $display("The prediction is %b", out_nn[1]);
        end
        else if(prev_out == 2'b01)
        begin
        out<= out_nt[1];
//        $display("The prediction is %b", out_nt[1]);
        end
        else if(prev_out == 2'b10)
        begin
        out<= out_tn[1];
//        $display("The prediction is %b", out_tn[1]);
        end
        else
        begin
        out<= out_tt[1];
//        $display("The prediction is %b", out_tt[1]);
        end
    end
    else if(mode == 2'b01)
    begin
        
        if(prev_out == 2'b00)
        begin
            if(out_nn == 2'b00)
            begin

                if(inp == 1)
                begin
                    out_nn = 2'b01;
                end
            end
            else if(out_nn == 2'b01)
            begin
                if(inp == 1)
                begin
                    out_nn = 2'b11;
                end
                else
                begin
                    out_nn = 2'b00;
                end
            end
            else if(out_nn == 2'b10)
            begin
                if(inp == 1)
                begin
                    out_nn = 2'b11;
                end
                else
                begin
                    out_nn = 2'b00;
                end
            end
            else if(out_nn == 2'b11)
            begin
                if(inp == 1)
                begin
                    out_nn = 2'b11;
                end
                else
                begin
                    out_nn = 2'b10;
                end
                
            end
        end
        else if(prev_out == 2'b01)
        begin
            if(out_nt == 2'b00)
            begin
                if(inp == 1)
                begin
                    out_nt = 2'b01;
                end
            end
            else if(out_nt == 2'b01)
            begin
                if(inp == 1)
                begin
                    out_nt = 2'b11;
                end
                else
                begin
                    out_nt = 2'b00;
                end
            end
            else if(out_nt == 2'b10)
            begin
                if(inp == 1)
                begin
                    out_nt = 2'b11;
                end
                else
                begin
                    out_nt = 2'b00;
                end
            end
            else if(out_nt == 2'b11)
            begin
                if(inp == 1)
                begin
                    out_nt = 2'b11;
                end
                else
                begin
                    out_nt = 2'b10;
                end
                
            end
        end
        else if(prev_out == 2'b10)
        begin
            if(out_tn == 2'b00)
            begin
                if(inp == 1)
                begin
                    out_tn = 2'b01;
                end
            end
            else if(out_tn == 2'b01)
            begin
                if(inp == 1)
                begin
                    out_tn = 2'b11;
                end
                else
                begin
                    out_tn = 2'b00;
                end
            end
            else if(out_tn == 2'b10)
            begin
                if(inp == 1)
                begin
                    out_tn = 2'b11;
                end
                else
                begin
                    out_tn = 2'b00;
                end
            end
            else if(out_tn == 2'b11)
            begin
                if(inp == 1)
                begin
                    out_tn = 2'b11;
                end
                else
                begin
                    out_tn = 2'b10;
                end
                
            end
        end
        else
        begin
            if(out_tt == 2'b00)
            begin
                if(inp == 1)
                begin
                    out_tt = 2'b01;
                end
            end
            else if(out_tt == 2'b01)
            begin
                if(inp == 1)
                begin
                    out_tt = 2'b11;
                end
                else
                begin
                    out_tt = 2'b00;
                end
            end
            else if(out_tt == 2'b10)
            begin
                if(inp == 1)
                begin
                    out_tt = 2'b11;
                end
                else
                begin
                    out_tt = 2'b00;
                end
            end
            else if(out_tt == 2'b11)
            begin
                if(inp == 1)
                begin
                    out_tt = 2'b11;
                end
                else
                begin
                    out_tt = 2'b10;
                end
                
            end
        end
        
     prev_out[1] <= prev_out[0];
        prev_out[0] <= inp;   
    end
    else if(mode == 2'b10)
    begin
        $display("%b, %b, %b, %b", out_nn, out_nt, out_tn, out_tt);
    end
    else
    begin
        out_nn = 2'b00;
        out_nt = 2'b00;
        out_tn = 2'b11;
        out_tt = 2'b11;
    end
    
    
end

endmodule
