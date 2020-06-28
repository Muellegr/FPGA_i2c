module SevenSegmentParser #(SEGMENT_DISPLAY_VALUE_B = 19, SEGMENT_DISPLAY_COUNT = 6) (
		input logic [SEGMENT_DISPLAY_VALUE_B:0] displayValue,
		output logic [SEGMENT_DISPLAY_COUNT - 1:0][6:0] segmentPins
	); 

	/* Generates each individual digit's logic */
	genvar i;
	generate
	 	for (i = 0 ; i < SEGMENT_DISPLAY_COUNT ; ++i) begin : Dislay_Generator
			SevenSegmentDisplay sevenSegmentDisplay(
				.data(SevenSegmentIndexValue(displayValue, i )),
				.segments(segmentPins[i])
			);
		end
	endgenerate
	
	/* Takes the displayValue and gets the 0-9 value to be displayed at the index position */
	function automatic reg[3:0] SevenSegmentIndexValue  ( logic[SEGMENT_DISPLAY_VALUE_B:0] data ,logic [4:0] indexPosition );
				SevenSegmentIndexValue = (data / (10 ** indexPosition) ) % 10;
		endfunction

 endmodule