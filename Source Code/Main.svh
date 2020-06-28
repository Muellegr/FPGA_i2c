/*  
Main project types and enum declarations
*/
/*****************
*	CONSTANTS
*****************/
parameter SEGMENT_DISPLAY_COUNT = 6; /* Number of segment displays available */
parameter SEGMENT_DISPLAY_VALUE_B = 19; /* Bits needed to display 999999 */
parameter LED_COUNT = 10; /* Number of single color LEDs available */
parameter BUTTON_COUNT = 2; /* Number of buttons available */
parameter SWITCH_COUNT = 10; /* Number of switches available */
parameter MAIN_CLOCK = 50_000_000; /* Main bus clock speed at 50Mhz */

/*****************
*	   ENUMS
*****************/
/* */
`ifndef CLOCK_ENUM_D
	`define CLOCK_ENUM_D
	typedef enum 
		{ 
		CLK_LOW = 0,
		CLK_HIGH = 1
		} CLOCK_ENUM;
`endif

/*****************
*	  TYPES
*****************/