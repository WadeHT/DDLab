`timescale 1ns / 1ps

module ADC_Main(
	input CLK100MHZ,
	input vauxp3,
	input vauxn3,
	output reg [15:0] LED,
	output reg [7:0] an,
	output reg dp,
	output reg [6:0] seg
	);

	wire enable;  
	wire adcok;
	wire [15:0] adcout;
	
	reg [32:0] dec;
	reg [23:0] count;
	reg [3:0] dig0, dig1, dig2, dig3, dig4, dig5, dig6;

	adc adc (.DADDR_IN(8'h13), //告訴ADC說我是要從哪個Port接收類比信號 位置數值可參考Nexys4官方文件
			.DCLK_IN(CLK100MHZ), 
			.DEN_IN(enable),
			.DI_IN(), 
			.DWE_IN(), 
			.BUSY_OUT(),
			.VAUXP3(vauxp3), //類比信號正極
			.VAUXN3(vauxn3), //類比信號負極
			.VN_IN(), 
			.VP_IN(), 
			.ALARM_OUT(), 
			.DO_OUT(adcout), //數位訊號輸出 為16-bit 全為浮點 由左到右分別是2^-1, 2^-2, 2^-3, ... , 2^-16
			.RESET_IN(),
			.EOC_OUT(enable),
			.CHANNEL_OUT(),
			.DRDY_OUT(adcok));
				
	// You can connect your 7-seg converter here  
	
	always@(posedge CLK100MHZ) //ADC result to LED
	begin
		if(count[23]==1)
			LED <= adcout; //將ADC出來的16-bit信號直接輸出至LED
	end
		
	always@(posedge CLK100MHZ)
	begin
		//Write how to convert binary to 7-seg here
		{an, seg, dp} = 16'b1111111111111111; //控制七段顯示器不顯示任何數值
	end
	
	always@(posedge CLK100MHZ)
	begin
		if(count[23]==1)
			count <= 24'b0;
		else
			count <= count + 1;
	end
endmodule
