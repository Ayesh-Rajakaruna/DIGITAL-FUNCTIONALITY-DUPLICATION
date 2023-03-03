-- testbench for ShiftRegisterSIPO_4bit

-- Load Altera libraries for this chip
LIBRARY IEEE;
LIBRARY MAXII;
LIBRARY STD;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.MATH_REAL.uniform;
USE IEEE.MATH_REAL.floor;
USE MAXII.MAXII_COMPONENTS.ALL;
USE STD.TEXTIO.ALL;

-- Set up this testbench as an entity
entity test_ShiftRegisterSIPO_4bit is
end test_ShiftRegisterSIPO_4bit;

-- Create an implementation of the entity
-- (May have several per entity)
architecture testbench1 of test_ShiftRegisterSIPO_4bit is

  -- Set up the signals on the ShiftRegisterSISO_4bit
  signal clk : std_logic;
  signal clrn : std_logic;
  signal in1 : std_logic;
  signal out1    : std_logic;
  signal out2    : std_logic;
  signal out3    : std_logic;
  signal out4    : std_logic;

  -- Set up the vcc signal as 1
  signal vcc  : std_logic := '1';
  -- Set up the clock period
  constant clk_period : time := 10 ns;

  -- Set up file variables for writing to a file
  file tb_file : text open write_mode is "tb_output.txt";
  
  begin
    -- dut = device under test (same name as top project from Quartus)
    dut : entity work.ShiftRegisterSIPO_4bit
      -- Map the ports from the dut to this testbench
      port map (
        clk => clk,
        clrn => clrn,
	in1 => in1,
        out1 => out1,
        out2 => out2,
        out3 => out3,
        out4 => out4);

    -- Process to write signals to a file on a positive clock edge
    write_to_file : process(clk)
    variable line : line;
    begin
      if rising_edge(clk) then
          write(line, std_logic'image(in1));
	  write(line, ' '); -- Separate with a space
          write(line, std_logic'image(out1));
	  write(line, ' '); -- Separate with a space
          write(line, std_logic'image(out2));
	  write(line, ' '); -- Separate with a space
          write(line, std_logic'image(out3));
	  write(line, ' '); -- Separate with a space
          write(line, std_logic'image(out4));
	  write(line, ' '); -- Separate with a space
          writeline(tb_file, line);
       end if;
     end process write_to_file;

     clk_process :process
     begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
     end process;

    -- Set up the signals    
    stimulus : process is
      variable seed1, seed2, seed3, seed4 : positive;
      variable rand1, rand2 : real;
      -- Declare your width and interval variables
      variable width, interval : time;

      -- test CLR 
      begin
      -- Set the initial values of the seed variables
      seed1 := 123;
      seed2 := 456;
      seed3 := 789;
      seed4 := 1011;
           loop
                -- Call the uniform function to generate your random values
                uniform(seed1, seed2, rand1);
                uniform(seed1, seed2, rand2);
		report "rand1: " & real'image(rand1) & ", rand2: " & real'image(rand2);
    		width := (rand1)*50 ns; 
    		interval := (rand2)*50 ns; 
		in1 <= '0'; 
		wait for width + 10 ns; 
		in1 <= '1'; 
		wait for interval + 10 ns;
	
           end loop;
    end process stimulus;
end architecture testbench1;
