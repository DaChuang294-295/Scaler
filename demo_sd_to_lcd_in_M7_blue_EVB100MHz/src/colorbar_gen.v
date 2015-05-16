module colorbar_gen(
    clk,
    rstn,
    h_valid,
    v_valid
);
input clk;
input rstn;
output h_valid;
output v_valid;

parameter REG_HS_PIX   = 11'd1024;
parameter REG_VS_PIX   = 10'd768;
parameter REG_HW_PIX   = 11'd1344;
parameter REG_VW_PIX   = 10'd806;

reg h_valid;
reg v_valid;

reg         [10:0]  h_cnt   ;
reg         [9:0]   v_cnt   ;
wire i_fval, i_lval;

always@(posedge clk, negedge rstn) begin 
    if(!rstn) begin
        h_cnt   <= 0;
        v_cnt   <= 0;
    end
    else begin
        if(h_cnt<= REG_HW_PIX -1'b1) 
            h_cnt <= h_cnt + 1'b1 ;
        else 
            h_cnt <= 0;

        if(h_cnt == REG_HW_PIX -1'b1) begin 
            if(v_cnt<= REG_VW_PIX-1'b1) 
                v_cnt <= v_cnt + 1'b1 ;
            else 
                v_cnt <= 0 ;
        end
    end
end     

//assign i_lval = (h_cnt >= 11'd100) && (h_cnt <REG_HS_PIX + 11'd100) ;
//assign i_fval = (v_cnt >= 10'd10) && (v_cnt <REG_VS_PIX  + 10'd10) ;
assign i_lval = (h_cnt >= 11'd3) && (h_cnt <REG_HS_PIX + 11'd3) ;
assign i_fval = (v_cnt >= 10'd2) && (v_cnt <REG_VS_PIX  + 10'd2) ;
//assign i_lval = (h_cnt <REG_HS_PIX) ;
//assign i_fval = (v_cnt <REG_VS_PIX) ;

always@(posedge clk, negedge rstn) begin
    if(!rstn) begin
        h_valid <= 0;
        v_valid <= 0;
    end
    else begin
        h_valid <= i_lval;
        v_valid <= i_fval;
    end
end

endmodule

