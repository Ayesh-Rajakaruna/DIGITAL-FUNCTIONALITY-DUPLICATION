-- testbench for counter_16bit

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
entity test_counter_14bit is
end test_counter_14bit;

-- Create an implementation of the entity
-- (May have several per entity)
architecture testbench1 of test_counter_14bit is

  -- Set up the signals on the 10bit_counter
  signal button1 : std_logic;
  signal button4 : std_logic;
  signal led1    : std_logic;
  signal led2    : std_logic;
  signal led3    : std_logic;
  signal led4    : std_logic;
  signal led5    : std_logic;
  signal led6    : std_logic;
  signal led7    : std_logic;
  signal led8    : std_logic;
  signal led9    : std_logic;
  signal led10   : std_logic;
  signal led11   : std_logic;
  signal led12   : std_logic;
  signal led13   : std_logic;
  signal led14   : std_logic;

  -- Set up the vcc signal as 1
  signal vcc  : std_logic := '1';

  -- Set up the clock period
  constant clk_period : time := 10 ns;

  -- Set up file variables for writing to a file
  file tb_file : text open write_mode is "tb_output.txt";

  begin
    -- dut = device under test (same name as top project from Quartus)
    dut : entity work.counter_14bit
      -- Map the ports from the dut to this testbench
      port map (
        button1 => button1,
        button4 => button4,
        led1 => led1,
        led2 => led2,
        led3 => led3,
	led4 => led4,
	led5 => led5,
	led6 => led6,
	led7 => led7,
	led8 => led8,
	led9 => led9,
	led10 => led10,
	led11 => led11,
	led12 => led12,
	led13 => led13,
	led14 => led14 );

    -- Process to write signals to a file on a positive clock edge
    write_to_file : process(button1)
    variable line : line;
    begin
      if rising_edge(button1) then
          write(line, std_logic'image(button1));
	  write(line, ' '); -- Separate with a space
          write(line, std_logic'image(led1));
	  write(line, ' '); -- Separate with a space
          write(line, std_logic'image(led2));
	  write(line, ' '); -- Separate with a space
          write(line, std_logic'image(led3));
	  write(line, ' '); -- Separate with a space
          write(line, std_logic'image(led4));
	  write(line, ' '); -- Separate with a space
          write(line, std_logic'image(led5));
	  write(line, ' '); -- Separate with a space
          write(line, std_logic'image(led6));
	  write(line, ' '); -- Separate with a space
          write(line, std_logic'image(led7));
	  write(line, ' '); -- Separate with a space
          write(line, std_logic'image(led8));
	  write(line, ' '); -- Separate with a space
          write(line, std_logic'image(led9));
	  write(line, ' '); -- Separate with a space
          write(line, std_logic'image(led10));
	  write(line, ' '); -- Separate with a space
          write(line, std_logic'image(led11));
	  write(line, ' '); -- Separate with a space
          write(line, std_logic'image(led12));
	  write(line, ' '); -- Separate with a space
          write(line, std_logic'image(led13));
	  write(line, ' '); -- Separate with a space
          write(line, std_logic'image(led14));
          writeline(tb_file, line);
       end if;
     end process write_to_file;
   
    -- Set up the signals    
    stimulus : process is
      begin
        -- Just make a clock on button1 to simulate pushing the button
        loop
          button1 <= '0'; wait for clk_period/2;
          button1 <= '1'; wait for clk_period/2;
        end loop;
      end process stimulus;
end architecture testbench1;