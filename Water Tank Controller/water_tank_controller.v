`timescale 1ns/1ps

module water_tank_controller (
    input  wire       clk,
    input  wire       reset,

    // Water level sensor
    // 00 = Empty
    // 01 = Low
    // 10 = Medium
    // 11 = Full
    input  wire [1:0] water_level,

    // Water source availability
    // 0 = No water source
    // 1 = Water source available
    input  wire       source_available,

    // Pump output
    output reg        pump
);

    // Water level definitions
    parameter EMPTY  = 2'b00;
    parameter LOW    = 2'b01;
    parameter MEDIUM = 2'b10;
    parameter FULL   = 2'b11;

    always @(posedge clk or posedge reset) begin

        if (reset) begin
            pump <= 1'b0;
        end

        else begin

            case (water_level)

                // --------------------------------
                // Empty Tank
                // --------------------------------
                EMPTY: begin

                    if (source_available)
                        pump <= 1'b1;
                    else
                        pump <= 1'b0;

                end

                // --------------------------------
                // Low Water Level
                // --------------------------------
                LOW: begin

                    if (source_available)
                        pump <= 1'b1;
                    else
                        pump <= 1'b0;

                end

                // --------------------------------
                // Medium Water Level
                // --------------------------------
                MEDIUM: begin

                    if (source_available)
                        pump <= 1'b1;
                    else
                        pump <= 1'b0;

                end

                // --------------------------------
                // Full Tank
                // --------------------------------
                FULL: begin
                    pump <= 1'b0;
                end

                default: begin
                    pump <= 1'b0;
                end

            endcase
        end

    end

endmodule
