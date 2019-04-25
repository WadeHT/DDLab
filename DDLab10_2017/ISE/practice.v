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
	wire [15:0] aadcout;
	reg [32:0] dec;
	reg [23:0] count;
	reg [3:0] dig0, dig1, dig2, dig3, dig4, dig5, dig6;

	adc adc (.DADDR_IN(8'h13), //�i�DADC���ڬO�n�q����Port��������H�� ��m�ƭȥi�Ѧ�Nexys4�x����
			.DCLK_IN(CLK100MHZ),
			.DEN_IN(enable),
			.DI_IN(),
			.DWE_IN(),
			.BUSY_OUT(),
			.VAUXP3(vauxp3), //����H������
			.VAUXN3(vauxn3), //����H���t��
			.VN_IN(),
			.VP_IN(),
			.ALARM_OUT(),
			.DO_OUT(adcout), //�Ʀ�T����X ��16-bit �����B�I �ѥ���k���O�O2^-1, 2^-2, 2^-3, ... , 2^-16
			.RESET_IN(),
			.EOC_OUT(enable),
			.CHANNEL_OUT(),
			.DRDY_OUT(adcok));

	// You can connect your 7-seg converter here

	always@(posedge CLK100MHZ) //ADC result to LED
	begin
		if(count[23]==1)
			LED <= adcout; //�NADC�X�Ӫ�16-bit�H��������X��LED
	end

	always@(posedge CLK100MHZ)
	begin
		//Write how to convert binary to 7-seg here
		if(count[23]==1)
            aadcout <= adcout;
            aadcout <= aadcout>>4;
            aadcout <= (aadcout<<4+aadcout<<7+aadcout<<12+aadcout<<14+aadcout<<15+aadcout<<16+aadcout<<17)>>10;
            {an, seg, dp} = aadcout|16'b1000000000000000; //����C�q��ܾ�����ܥ���ƭ�
	end

	always@(posedge CLK100MHZ)
	begin
		if(count[23]==1)
			count <= 24'b0;
		else
			count <= count + 1;
	end
endmodule
