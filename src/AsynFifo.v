module AsynFifo #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 4          
)(
    input                       w_clk,
    input                       w_rst_n,      
    input                       wr,
    input  [DATA_WIDTH-1:0]     w_data,
    output                      full,

    input                       r_clk,
    input                       r_rst_n,      
    input                       rd,
    output [DATA_WIDTH-1:0]     r_data,
    output                      empty
);

    localparam DEPTH = 1 << ADDR_WIDTH;

    reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];

    reg  [ADDR_WIDTH:0] w_ptr_b, r_ptr_b;
    wire [ADDR_WIDTH:0] w_ptr_bnext, r_ptr_bnext;
    reg  [ADDR_WIDTH:0] w_ptr_g, r_ptr_g;
    wire [ADDR_WIDTH:0] w_ptr_gnext, r_ptr_gnext;

    reg [ADDR_WIDTH:0] r_ptr_g_sync1, r_ptr_g_sync2;
    reg [ADDR_WIDTH:0] w_ptr_g_sync1, w_ptr_g_sync2;

    wire wr_en = wr & ~full;
    wire rd_en = rd & ~empty;

    assign w_ptr_bnext = w_ptr_b + 1'b1;
    assign r_ptr_bnext = r_ptr_b + 1'b1;

    assign w_ptr_gnext = (w_ptr_bnext >> 1) ^ w_ptr_bnext;
    assign r_ptr_gnext = (r_ptr_bnext >> 1) ^ r_ptr_bnext;

    always @(posedge w_clk or negedge w_rst_n) begin
        if (!w_rst_n) begin
            w_ptr_b <= 0;
            w_ptr_g <= 0;
        end else if (wr_en) begin
            w_ptr_b <= w_ptr_bnext;
            w_ptr_g <= w_ptr_gnext;
        end
    end

    always @(posedge r_clk or negedge r_rst_n) begin
        if (!r_rst_n) begin
            r_ptr_b <= 0;
            r_ptr_g <= 0;
        end else if (rd_en) begin
            r_ptr_b <= r_ptr_bnext;
            r_ptr_g <= r_ptr_gnext;
        end
    end

    always @(posedge w_clk) begin
        if (wr_en) begin
            mem[w_ptr_b[ADDR_WIDTH-1:0]] <= w_data;
        end
    end

    reg [DATA_WIDTH-1:0] r_data_r;

    always @(posedge r_clk) begin
        if (rd_en) begin
            r_data_r <= mem[r_ptr_b[ADDR_WIDTH-1:0]];
        end
    end

    assign r_data = r_data_r;

    always @(posedge w_clk or negedge w_rst_n) begin
        if (!w_rst_n) begin
            r_ptr_g_sync1 <= 0;
            r_ptr_g_sync2 <= 0;
        end else begin
            r_ptr_g_sync1 <= r_ptr_g;
            r_ptr_g_sync2 <= r_ptr_g_sync1;
        end
    end

    always @(posedge r_clk or negedge r_rst_n) begin
        if (!r_rst_n) begin
            w_ptr_g_sync1 <= 0;
            w_ptr_g_sync2 <= 0;
        end else begin
            w_ptr_g_sync1 <= w_ptr_g;
            w_ptr_g_sync2 <= w_ptr_g_sync1;
        end
    end
    assign full = (w_ptr_gnext == {~r_ptr_g_sync2[ADDR_WIDTH:ADDR_WIDTH-1],r_ptr_g_sync2[ADDR_WIDTH-2:0]});
    assign empty = (r_ptr_g == w_ptr_g_sync2);
endmodule