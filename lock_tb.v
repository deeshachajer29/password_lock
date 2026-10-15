`timescale 1ns/1ps

module password_lock_tb;

    reg clk;
    reg rst;
    reg password_bit;
    wire unlock;

    password_lock uut (
        .clk(clk),
        .rst(rst),
        .password_bit(password_bit),
        .unlock(unlock)
    );

    always #5 clk = ~clk;

    initial begin

        clk = 0;
        rst = 1;
        password_bit = 0;

        $dumpfile("password_lock.vcd");
        $dumpvars(0, password_lock_tb);

        #10;
        rst = 0;

        password_bit = 1;
        #10;

        password_bit = 0;
        #10;

        password_bit = 1;
        #10;

        password_bit = 1;
        #10;

        $finish;
    end

endmodule