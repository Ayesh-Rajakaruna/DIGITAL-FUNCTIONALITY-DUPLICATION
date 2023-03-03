LIBRARY IEEE;
LIBRARY MAXII;
LIBRARY STD;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.MATH_REAL.uniform;
USE IEEE.MATH_REAL.floor;
USE MAXII.MAXII_COMPONENTS.ALL;
USE STD.TEXTIO.ALL;

entity PISO_5bits_tb is
end PISO_5bits_tb;


architecture testbench1 of PISO_5bits_tb is
    signal Q4 : std_logic;
    signal Button : std_logic;
    signal Clock    : std_logic;
    signal B0    : std_logic;
    signal B1    : std_logic;
    signal B2    : std_logic;
    signal B3    : std_logic;
    signal B4    : std_logic;
    signal \Shift/~Load\    : std_logic;
    signal vcc  : std_logic := '1';
    constant clk_period : time := 10 ns;

-- Set up file variables for writing to a file
file tb_file : text open write_mode is "tb_output.txt";

begin
    dut : entity work.PISO_5bits
    -- Map the ports from the dut to this testbench
    port map (
        B0 => B0,
        B1 => B1,
        B2 => B2,
        B3 => B3,
        B4 => B4,
        \Shift/~Load\ => \Shift/~Load\,
        Q4 => Q4,
        Button => Button,
        Clock => Clock);

    -- Process to write signals to a file on a positive clock edge
    write_to_file : process(Clock)
    variable line : line;
    begin
        if rising_edge(Clock) then
            write(line, std_logic'image(\Shift/~Load\));
        write(line, ' '); -- Separate with a space
            write(line, std_logic'image(B0));
        write(line, ' '); -- Separate with a space
            write(line, std_logic'image(B1));
        write(line, ' '); -- Separate with a space
            write(line, std_logic'image(B2));
        write(line, ' '); -- Separate with a space
            write(line, std_logic'image(B3));
        write(line, ' '); -- Separate with a space
            write(line, std_logic'image(B4));
        write(line, ' '); -- Separate with a space
            write(line, std_logic'image(Q4));
        write(line, ' '); -- Separate with a space
            writeline(tb_file, line);
        end if;
     end process write_to_file;

    clk_process :process
    begin
		Clock <= '0';
		wait for clk_period/2;
		Clock <= '1';
		wait for clk_period/2;
    end process;

    stimulus : process is
        variable seed1, seed2 : integer := 999;
        variable r : real;
        begin 
            wait for clk_period/5; 
            loop
                uniform(seed1, seed2, r); 
                if r > 0.5 then
                    B0 <= '1';
                else
                    B0 <= '0';
                end if;
                uniform(seed1, seed2, r); 
                if r > 0.5 then
                    B1 <= '1';
                else
                    B1 <= '0';
                end if;  
                uniform(seed1, seed2, r); 
                if r > 0.5 then
                    B2 <= '1';
                else
                    B2 <= '0';
                end if;  
                uniform(seed1, seed2, r); 
                if r > 0.5 then
                    B3 <=  '1';
                else
                    B3 <=  '0';
                end if; 
                uniform(seed1, seed2, r); 
                if r > 0.5 then
                    B4 <=  '1';
                else
                    B4 <=  '0';
                end if;
                uniform(seed1, seed2, r); 
                if r > 0.5 then
                    \Shift/~Load\ <=  '1';
                else
                    \Shift/~Load\ <=  '0';
                end if;    
                wait for clk_period/2; 
            end loop;
end process stimulus;
end architecture testbench1;