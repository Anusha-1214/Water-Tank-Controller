`timescale 1ns/1ps

module water_tank_controller_tb;

    reg clk;
    reg reset;

    reg [1:0] water_level;
    reg source_available;

    wire pump;

    // Instantiate Water Tank Controller
    water_tank_controller uut (
        .clk(clk),
        .reset(reset),
        .water_level(water_level),
        .source_available(source_available),
        .pump(pump)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        // Generate waveform
        $dumpfile("water_tank_controller.vcd");
        $dumpvars(0, water_tank_controller_tb);

        // Initial values
        clk = 0;
        reset = 1;
        water_level = 2'b00;
        source_available = 1'b0;

        #10;

        // Release reset
        reset = 0;

        // -----------------------------------------
        // TEST 1: Empty Tank + Water Available
        // Pump should turn ON
        // -----------------------------------------

        #10;
        water_level = 2'b00;
        source_available = 1'b1;

        #10;

        // -----------------------------------------
        // TEST 2: Low Level + Water Available
        // Pump remains ON
        // -----------------------------------------

        water_level = 2'b01;
        source_available = 1'b1;

        #10;

        // -----------------------------------------
        // TEST 3: Medium Level + Water Available
        // Pump remains ON
        // -----------------------------------------

        water_level = 2'b10;
        source_available = 1'b1;

        #10;

        // -----------------------------------------
        // TEST 4: Full Tank
        // Pump should turn OFF
        // -----------------------------------------

        water_level = 2'b11;
        source_available = 1'b1;

        #10;

        // -----------------------------------------
        // TEST 5: Low Level + No Water Source
        // Pump should turn OFF
        // -----------------------------------------

        water_level = 2'b01;
        source_available = 1'b0;

        #10;

        // -----------------------------------------
        // TEST 6: Empty Tank + No Water Source
        // Pump should remain OFF
        // -----------------------------------------

        water_level = 2'b00;
        source_available = 1'b0;

        #20;

        $finish;

    end

    // Display simulation results
    initial begin

        $monitor(
            "Time=%0t | Water Level=%b | Source=%b | Pump=%b",
            $time,
            water_level,
            source_available,
            pump
        );

    end

endmodule
