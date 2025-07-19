module light(
   input wire clk,           // Clock input
   input wire reset,         // Reset input
   input wire sensor_input1,
   input wire sensor_input2,	 // Digital input from the LDR sensor
   input wire sensor_input3,	 // Digital input from the LDR sensor
   input wire sensor_input4,	 // Digital input from the LDR sensor	 
   output reg light_detected1, // Output indicating light detected
	output reg light_detected2,
	output reg light_detected3,
	output reg light_detected4
);

	// Simple state machine to detect light based on sensor input
	always @(posedge clk) begin
		 if (reset == 0) begin
			  light_detected1 <= 1'b0;
			  light_detected2 <= 1'b0;
			  light_detected3 <= 1'b0;
			  light_detected4 <= 1'b0;
		 end else begin
			  if (sensor_input1 == 1'b1) begin
					light_detected1 <= 1'b1;  // Light detected
			  end else begin
					light_detected1 <= 1'b0;  // No light detected
			  end
			  if (sensor_input2 == 1'b1) begin
					light_detected2 <= 1'b1;  // Light detected
			  end else begin
					light_detected2 <= 1'b0;  // No light detected
			  end
			  if (sensor_input3 == 1'b1) begin
					light_detected3 <= 1'b1;  // Light detected
			  end else begin
					light_detected3 <= 1'b0;  // No light detected
			  end
			  if (sensor_input4 == 1'b1) begin
					light_detected4 <= 1'b1;  // Light detected
			  end else begin
					light_detected4 <= 1'b0;  // No light detected
			  end
		 end
	end

endmodule