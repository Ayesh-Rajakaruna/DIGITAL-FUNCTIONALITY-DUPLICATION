LIBRARY IEEE;
LIBRARY MAXII;
LIBRARY STD;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.MATH_REAL.uniform;
USE IEEE.MATH_REAL.floor;
USE MAXII.MAXII_COMPONENTS.ALL;
USE STD.TEXTIO.ALL;

entity PISO_16bits_tb is
end PISO_16bits_tb;

architecture testbench1 of PISO_16bits_tb is
    signal Q3 : std_logic;
    signal Button : std_logic;
    signal Clock    : std_logic;
    signal B0    : std_logic;
    signal B1    : std_logic;
    signal B2    : std_logic;
    signal B3    : std_logic;
    signal B4    : std_logic;
    signal B5    : std_logic;
    signal B6    : std_logic;
    signal B7    : std_logic;
    signal B8    : std_logic;
    signal B9    : std_logic;
    signal B10    : std_logic;
    signal B11    : std_logic;
    signal B12    : std_logic;
    signal B13    : std_logic;
    signal B14    : std_logic;
    signal B15    : std_logic;
    signal \Shift/~Load\    : std_logic;
    signal vcc  : std_logic := '1';
    constant clk_period : time := 10 ns;

-- Set up file variables for writing to a file
file tb_file : text open write_mode is "tb_output.txt";

begin
    dut : entity work.PISO_16bits
    -- Map the ports from the dut to this testbench
    port map (
        B0 => B0,
        B1 => B1,
        B2 => B2,
        B3 => B3,
        B4 => B4,
        B5 => B5,
        B6 => B6,
        B7 => B7,
        B8 => B8,
        B9 => B9,
        B10 => B10,
        B11 => B11,
        B12 => B12,
        B13 => B13,
        B14 => B14,
        B15 => B15,
        B16 => B16,
        \Shift/~Load\ => \Shift/~Load\,
        Q1 => Q1,
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
            write(line, std_logic'image(B5));
        write(line, ' '); -- Separate with a space
            write(line, std_logic'image(B6));
        write(line, ' '); -- Separate with a space
            write(line, std_logic'image(B7));
        write(line, ' '); -- Separate with a space
            write(line, std_logic'image(B8));
        write(line, ' '); -- Separate with a space
            write(line, std_logic'image(B9));
        write(line, ' '); -- Separate with a space
            write(line, std_logic'image(B10));
        write(line, ' '); -- Separate with a space
            write(line, std_logic'image(B11));
        write(line, ' '); -- Separate with a space
            write(line, std_logic'image(B12));
        write(line, ' '); -- Separate with a space
            write(line, std_logic'image(B13));
        write(line, ' '); -- Separate with a space
            write(line, std_logic'image(B14));
        write(line, ' '); -- Separate with a space
            write(line, std_logic'image(B15));
        write(line, ' '); -- Separate with a space
            write(line, std_logic'image(Q3));
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
                    B5 <= '1';
                else
                    B5 <= '0';
                end if;
                uniform(seed1, seed2, r); 
                if r > 0.5 then
                    B6 <= '1';
                else
                    B6 <= '0';
                end if;  
                uniform(seed1, seed2, r); 
                if r > 0.5 then
                    B7 <= '1';
                else
                    B7 <= '0';
                end if;  
                uniform(seed1, seed2, r); 
                if r > 0.5 then
                    B8 <=  '1';
                else
                    B8 <=  '0';
                end if; 
                uniform(seed1, seed2, r); 
                if r > 0.5 then
                    B9 <=  '1';
                else
                    B9 <=  '0';
                end if;
                uniform(seed1, seed2, r); 
                if r > 0.5 then
                    B10 <= '1';
                else
                    B10 <= '0';
                end if;
                uniform(seed1, seed2, r); 
                if r > 0.5 then
                    B11 <= '1';
                else
                    B11 <= '0';
                end if;  
                uniform(seed1, seed2, r); 
                if r > 0.5 then
                    B12 <= '1';
                else
                    B12 <= '0';
                end if;  
                uniform(seed1, seed2, r); 
                if r > 0.5 then
                    B13 <=  '1';
                else
                    B13 <=  '0';
                end if; 
                uniform(seed1, seed2, r); 
                if r > 0.5 then
                    B14 <=  '1';
                else
                    B14<=  '0';
                end if;
                uniform(seed1, seed2, r); 
                if r > 0.5 then
                    B15 <=  '1';
                else
                    B15<=  '0';
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