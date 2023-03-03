-- testbench for ShiftRegisterSIPO_7bit

-- Load Altera libraries for this chip
LIBRARY IEEE;
LIBRARY MAXII;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.MATH_REAL.uniform;
USE IEEE.MATH_REAL.floor;
USE MAXII.MAXII_COMPONENTS.ALL;

-- Set up this testbench as an entity
entity test_ShiftRegisterSIPO_7bit is
end test_ShiftRegisterSIPO_7bit;

-- Create an implementation of the entity
-- (May have several per entity)
architecture testbench1 of test_ShiftRegisterSIPO_7bit is

  -- Set up the signals on the ShiftRegisterSISO_7bit
  signal clk : std_logic;
  signal clrn : std_logic;
  signal in1 : std_logic;
  signal out1    : std_logic;
  signal out2    : std_logic;
  signal out3    : std_logic;
  signal out4    : std_logic;
  signal out5    : std_logic;
  signal out6    : std_logic;
  signal out7    : std_logic;

  -- Set up the vcc signal as 1
  signal vcc  : std_logic := '1';
  
  begin
    -- dut = device under test (same name as top project from Quartus)
    dut : entity work.ShiftRegisterSIPO_7bit
      -- Map the ports from the dut to this testbench
      port map (
        clk => clk,
        clrn => clrn,
	in1 => in1,
        out1 => out1,
        out2 => out2,
        out3 => out3,
        out4 => out4,
        out5 => out5,
        out6 => out6,
        out7 => out7);
    
    -- Set up the signals    
    stimulus : process is
      variable seed1 : positive;
      variable seed2 : positive;
      variable x : real;
      variable y : integer;
      begin
    	seed1 := 999;
    	seed2 := 999;
        -- Just make a clock on button1 to simulate pushing the button
        loop
      	  uniform(seed1, seed2, x);
      	  y := integer(x* 20.0);report "Number is " & integer'image(y);
	  in1 <= '0';
	  for i in 1 to y+1 loop
            clk <= '0'; wait for 10 ps;
            clk <= '1'; wait for 10 ps;
      	  end loop;
	
	  in1 <= '1';
  	  for i in 1 to y+1 loop
            clk <= '0'; wait for 10 ps;
            clk <= '1'; wait for 10 ps;
      	  end loop;
        end loop;
    end process stimulus;
end architecture testbench1;
