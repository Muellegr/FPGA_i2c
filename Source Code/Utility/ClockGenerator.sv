
/*********************
* ClockGenerator - generates a slower clock using edge counting
*	Note - The maximum output speed is 1/2 of input clock.
*		Additionally, some rounding may occur.
*********************/

module ClockGenerator #(INPUT_CLOCK_SPEED = 50000000, OUTPUT_CLOCK_SPEED = 60) ( 
		/* INPUT */
		input logic inputClock, /* Primary input clock signal */
		input logic reset_n, /* Active low reset */
		/* OUTPUT */
		output logic outputClock /* Primary output clock signal */
		);
		/* CONSTANTS */
		localparam  EDGES_TO_COUNT_FULL = ( INPUT_CLOCK_SPEED / OUTPUT_CLOCK_SPEED );
		localparam  EDGES_TO_COUNT_HALF = ( EDGES_TO_COUNT_FULL / 2 ); /* Retain some accuracy by seperating the two */
		localparam  EDGES_TO_COUNT_FULL_B = $clog2( EDGES_TO_COUNT_FULL );

		logic [EDGES_TO_COUNT_FULL_B - 1 : 0] counter ;

		always_ff @(posedge inputClock, negedge reset_n) begin
			/* RESET LOGIC */
			if (reset_n == 0 ) begin
				counter <= 0;
				outputClock <= CLK_LOW;
			end
			/* PRIMARY LOGIC */
			else begin
				/* Single output clock complete. */
				if (counter == EDGES_TO_COUNT_FULL - 1) begin
					outputClock <= ~outputClock; /* At very close output to input, it is possible to not hit half clock */
					counter <= 0;
				end
				/* Flip output clock */
				else if (counter == EDGES_TO_COUNT_HALF - 1) begin
					outputClock <= ~outputClock;
					counter++;
				end
				else begin
					counter++;
				end 
			end /* Main logic loop */
		end/* always_ff */
		
endmodule


/* Reduces need for header file due to limited scope of this file. */
`ifndef CLOCK_ENUM_D
	`define CLOCK_ENUM_D
	typedef enum 
		{ 
		CLK_LOW = 0,
		CLK_HIGH = 1
		} CLOCK_ENUM;
`endif

