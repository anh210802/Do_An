module main (
    input CLK, 
    input RST,
    input BUTTON1, BUTTON2, BUTTON3, BUTTON4,
    input [6:0] SWITCH,    
    output reg[6:0] TRANS, 
    output reg[6:0] LED7SEG
);
    
    reg MODE;
    wire[6:0] cTRANS;
    wire[6:0] cLED7SEG;
    wire button1_flag;
     
    always @(posedge CLK) begin
        if (button1_flag == 1'b1) begin
            MODE = ~MODE;
        end 
        TRANS = cTRANS;
        LED7SEG = cLED7SEG;
    end
    
    controller CRL (.clk(CLK),
                  .rst(RST),
                  .button2(BUTTON2),
                  .button3(BUTTON3),
                  .button4(BUTTON4),
                  .switch(SWITCH),
                  .mode(MODE),
                  .trans(cTRANS),
                  .led7seg(cLED7SEG));


    button CHANGE_MODE (.clk(CLK), .rst(RST), .btn(BUTTON1), .debounced(button1_flag));
     

endmodule