-- Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 14.1.0 Build 186 12/03/2014 SJ Web Edition"

-- DATE "02/19/2023 21:18:45"

-- 
-- Device: Altera EP4CE6E22C6 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	ShiftRegisterSIPO_16bit IS
    PORT (
	out1 : OUT std_logic;
	rst : IN std_logic;
	clk : IN std_logic;
	inp : IN std_logic;
	out2 : OUT std_logic;
	out3 : OUT std_logic;
	out4 : OUT std_logic;
	out5 : OUT std_logic;
	out6 : OUT std_logic;
	out7 : OUT std_logic;
	out8 : OUT std_logic;
	out9 : OUT std_logic;
	out10 : OUT std_logic;
	out11 : OUT std_logic;
	out12 : OUT std_logic;
	out13 : OUT std_logic;
	out14 : OUT std_logic;
	out15 : OUT std_logic;
	out16 : OUT std_logic
	);
END ShiftRegisterSIPO_16bit;

-- Design Ports Information
-- out1	=>  Location: PIN_39,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out2	=>  Location: PIN_30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out3	=>  Location: PIN_34,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out4	=>  Location: PIN_11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out5	=>  Location: PIN_42,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out6	=>  Location: PIN_32,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out7	=>  Location: PIN_31,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out8	=>  Location: PIN_33,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out9	=>  Location: PIN_50,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out10	=>  Location: PIN_28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out11	=>  Location: PIN_46,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out12	=>  Location: PIN_43,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out13	=>  Location: PIN_53,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out14	=>  Location: PIN_44,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out15	=>  Location: PIN_49,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out16	=>  Location: PIN_52,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- inp	=>  Location: PIN_38,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_24,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ShiftRegisterSIPO_16bit IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_out1 : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_inp : std_logic;
SIGNAL ww_out2 : std_logic;
SIGNAL ww_out3 : std_logic;
SIGNAL ww_out4 : std_logic;
SIGNAL ww_out5 : std_logic;
SIGNAL ww_out6 : std_logic;
SIGNAL ww_out7 : std_logic;
SIGNAL ww_out8 : std_logic;
SIGNAL ww_out9 : std_logic;
SIGNAL ww_out10 : std_logic;
SIGNAL ww_out11 : std_logic;
SIGNAL ww_out12 : std_logic;
SIGNAL ww_out13 : std_logic;
SIGNAL ww_out14 : std_logic;
SIGNAL ww_out15 : std_logic;
SIGNAL ww_out16 : std_logic;
SIGNAL \rst~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \out1~output_o\ : std_logic;
SIGNAL \out2~output_o\ : std_logic;
SIGNAL \out3~output_o\ : std_logic;
SIGNAL \out4~output_o\ : std_logic;
SIGNAL \out5~output_o\ : std_logic;
SIGNAL \out6~output_o\ : std_logic;
SIGNAL \out7~output_o\ : std_logic;
SIGNAL \out8~output_o\ : std_logic;
SIGNAL \out9~output_o\ : std_logic;
SIGNAL \out10~output_o\ : std_logic;
SIGNAL \out11~output_o\ : std_logic;
SIGNAL \out12~output_o\ : std_logic;
SIGNAL \out13~output_o\ : std_logic;
SIGNAL \out14~output_o\ : std_logic;
SIGNAL \out15~output_o\ : std_logic;
SIGNAL \out16~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \inp~input_o\ : std_logic;
SIGNAL \inst~feeder_combout\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \rst~inputclkctrl_outclk\ : std_logic;
SIGNAL \inst~q\ : std_logic;
SIGNAL \inst1~feeder_combout\ : std_logic;
SIGNAL \inst1~q\ : std_logic;
SIGNAL \inst2~feeder_combout\ : std_logic;
SIGNAL \inst2~q\ : std_logic;
SIGNAL \inst3~feeder_combout\ : std_logic;
SIGNAL \inst3~q\ : std_logic;
SIGNAL \inst4~feeder_combout\ : std_logic;
SIGNAL \inst4~q\ : std_logic;
SIGNAL \inst6~feeder_combout\ : std_logic;
SIGNAL \inst6~q\ : std_logic;
SIGNAL \inst7~feeder_combout\ : std_logic;
SIGNAL \inst7~q\ : std_logic;
SIGNAL \inst8~feeder_combout\ : std_logic;
SIGNAL \inst8~q\ : std_logic;
SIGNAL \inst9~feeder_combout\ : std_logic;
SIGNAL \inst9~q\ : std_logic;
SIGNAL \inst10~feeder_combout\ : std_logic;
SIGNAL \inst10~q\ : std_logic;
SIGNAL \inst11~feeder_combout\ : std_logic;
SIGNAL \inst11~q\ : std_logic;
SIGNAL \inst12~feeder_combout\ : std_logic;
SIGNAL \inst12~q\ : std_logic;
SIGNAL \inst13~feeder_combout\ : std_logic;
SIGNAL \inst13~q\ : std_logic;
SIGNAL \inst14~feeder_combout\ : std_logic;
SIGNAL \inst14~q\ : std_logic;
SIGNAL \inst15~feeder_combout\ : std_logic;
SIGNAL \inst15~q\ : std_logic;
SIGNAL \inst16~feeder_combout\ : std_logic;
SIGNAL \inst16~q\ : std_logic;

BEGIN

out1 <= ww_out1;
ww_rst <= rst;
ww_clk <= clk;
ww_inp <= inp;
out2 <= ww_out2;
out3 <= ww_out3;
out4 <= ww_out4;
out5 <= ww_out5;
out6 <= ww_out6;
out7 <= ww_out7;
out8 <= ww_out8;
out9 <= ww_out9;
out10 <= ww_out10;
out11 <= ww_out11;
out12 <= ww_out12;
out13 <= ww_out13;
out14 <= ww_out14;
out15 <= ww_out15;
out16 <= ww_out16;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\rst~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rst~input_o\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);

-- Location: IOOBUF_X1_Y0_N16
\out1~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst~q\,
	devoe => ww_devoe,
	o => \out1~output_o\);

-- Location: IOOBUF_X0_Y8_N16
\out2~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1~q\,
	devoe => ww_devoe,
	o => \out2~output_o\);

-- Location: IOOBUF_X0_Y5_N16
\out3~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2~q\,
	devoe => ww_devoe,
	o => \out3~output_o\);

-- Location: IOOBUF_X0_Y18_N23
\out4~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3~q\,
	devoe => ww_devoe,
	o => \out4~output_o\);

-- Location: IOOBUF_X3_Y0_N2
\out5~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4~q\,
	devoe => ww_devoe,
	o => \out5~output_o\);

-- Location: IOOBUF_X0_Y6_N16
\out6~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6~q\,
	devoe => ww_devoe,
	o => \out6~output_o\);

-- Location: IOOBUF_X0_Y7_N2
\out7~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7~q\,
	devoe => ww_devoe,
	o => \out7~output_o\);

-- Location: IOOBUF_X0_Y6_N23
\out8~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst8~q\,
	devoe => ww_devoe,
	o => \out8~output_o\);

-- Location: IOOBUF_X13_Y0_N2
\out9~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst9~q\,
	devoe => ww_devoe,
	o => \out9~output_o\);

-- Location: IOOBUF_X0_Y9_N9
\out10~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst10~q\,
	devoe => ww_devoe,
	o => \out10~output_o\);

-- Location: IOOBUF_X7_Y0_N2
\out11~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst11~q\,
	devoe => ww_devoe,
	o => \out11~output_o\);

-- Location: IOOBUF_X5_Y0_N23
\out12~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst12~q\,
	devoe => ww_devoe,
	o => \out12~output_o\);

-- Location: IOOBUF_X16_Y0_N2
\out13~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst13~q\,
	devoe => ww_devoe,
	o => \out13~output_o\);

-- Location: IOOBUF_X5_Y0_N16
\out14~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst14~q\,
	devoe => ww_devoe,
	o => \out14~output_o\);

-- Location: IOOBUF_X13_Y0_N16
\out15~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst15~q\,
	devoe => ww_devoe,
	o => \out15~output_o\);

-- Location: IOOBUF_X16_Y0_N9
\out16~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst16~q\,
	devoe => ww_devoe,
	o => \out16~output_o\);

-- Location: IOIBUF_X0_Y11_N8
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G2
\clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X1_Y0_N22
\inp~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_inp,
	o => \inp~input_o\);

-- Location: LCCOMB_X4_Y4_N4
\inst~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst~feeder_combout\ = \inp~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inp~input_o\,
	combout => \inst~feeder_combout\);

-- Location: IOIBUF_X0_Y11_N15
\rst~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: CLKCTRL_G4
\rst~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rst~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rst~inputclkctrl_outclk\);

-- Location: FF_X4_Y4_N5
inst : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst~feeder_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst~q\);

-- Location: LCCOMB_X4_Y4_N22
\inst1~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1~feeder_combout\ = \inst~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst~q\,
	combout => \inst1~feeder_combout\);

-- Location: FF_X4_Y4_N23
inst1 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst1~feeder_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1~q\);

-- Location: LCCOMB_X4_Y4_N0
\inst2~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2~feeder_combout\ = \inst1~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst1~q\,
	combout => \inst2~feeder_combout\);

-- Location: FF_X4_Y4_N1
inst2 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst2~feeder_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2~q\);

-- Location: LCCOMB_X4_Y4_N18
\inst3~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3~feeder_combout\ = \inst2~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst2~q\,
	combout => \inst3~feeder_combout\);

-- Location: FF_X4_Y4_N19
inst3 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst3~feeder_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3~q\);

-- Location: LCCOMB_X4_Y4_N24
\inst4~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst4~feeder_combout\ = \inst3~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst3~q\,
	combout => \inst4~feeder_combout\);

-- Location: FF_X4_Y4_N25
inst4 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst4~feeder_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst4~q\);

-- Location: LCCOMB_X4_Y4_N30
\inst6~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst6~feeder_combout\ = \inst4~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst4~q\,
	combout => \inst6~feeder_combout\);

-- Location: FF_X4_Y4_N31
inst6 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst6~feeder_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6~q\);

-- Location: LCCOMB_X4_Y4_N8
\inst7~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7~feeder_combout\ = \inst6~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst6~q\,
	combout => \inst7~feeder_combout\);

-- Location: FF_X4_Y4_N9
inst7 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst7~feeder_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7~q\);

-- Location: LCCOMB_X4_Y4_N10
\inst8~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst8~feeder_combout\ = \inst7~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst7~q\,
	combout => \inst8~feeder_combout\);

-- Location: FF_X4_Y4_N11
inst8 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst8~feeder_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst8~q\);

-- Location: LCCOMB_X4_Y4_N20
\inst9~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst9~feeder_combout\ = \inst8~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst8~q\,
	combout => \inst9~feeder_combout\);

-- Location: FF_X4_Y4_N21
inst9 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst9~feeder_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst9~q\);

-- Location: LCCOMB_X4_Y4_N2
\inst10~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10~feeder_combout\ = \inst9~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst9~q\,
	combout => \inst10~feeder_combout\);

-- Location: FF_X4_Y4_N3
inst10 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst10~feeder_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10~q\);

-- Location: LCCOMB_X4_Y4_N12
\inst11~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11~feeder_combout\ = \inst10~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst10~q\,
	combout => \inst11~feeder_combout\);

-- Location: FF_X4_Y4_N13
inst11 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst11~feeder_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst11~q\);

-- Location: LCCOMB_X4_Y4_N6
\inst12~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst12~feeder_combout\ = \inst11~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst11~q\,
	combout => \inst12~feeder_combout\);

-- Location: FF_X4_Y4_N7
inst12 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst12~feeder_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst12~q\);

-- Location: LCCOMB_X4_Y4_N28
\inst13~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst13~feeder_combout\ = \inst12~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst12~q\,
	combout => \inst13~feeder_combout\);

-- Location: FF_X4_Y4_N29
inst13 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst13~feeder_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst13~q\);

-- Location: LCCOMB_X4_Y4_N14
\inst14~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst14~feeder_combout\ = \inst13~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst13~q\,
	combout => \inst14~feeder_combout\);

-- Location: FF_X4_Y4_N15
inst14 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst14~feeder_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst14~q\);

-- Location: LCCOMB_X4_Y4_N16
\inst15~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst15~feeder_combout\ = \inst14~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst14~q\,
	combout => \inst15~feeder_combout\);

-- Location: FF_X4_Y4_N17
inst15 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst15~feeder_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst15~q\);

-- Location: LCCOMB_X4_Y4_N26
\inst16~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16~feeder_combout\ = \inst15~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst15~q\,
	combout => \inst16~feeder_combout\);

-- Location: FF_X4_Y4_N27
inst16 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst16~feeder_combout\,
	clrn => \rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst16~q\);

ww_out1 <= \out1~output_o\;

ww_out2 <= \out2~output_o\;

ww_out3 <= \out3~output_o\;

ww_out4 <= \out4~output_o\;

ww_out5 <= \out5~output_o\;

ww_out6 <= \out6~output_o\;

ww_out7 <= \out7~output_o\;

ww_out8 <= \out8~output_o\;

ww_out9 <= \out9~output_o\;

ww_out10 <= \out10~output_o\;

ww_out11 <= \out11~output_o\;

ww_out12 <= \out12~output_o\;

ww_out13 <= \out13~output_o\;

ww_out14 <= \out14~output_o\;

ww_out15 <= \out15~output_o\;

ww_out16 <= \out16~output_o\;
END structure;


