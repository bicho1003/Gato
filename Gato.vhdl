library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Gato is
    port(
        clk       : in std_logic;

        filas     : out std_logic_vector(7 downto 0)  := (others => '0');
        columnas  : out std_logic_vector(7 downto 0)  := (others => '0'));
end entity Gato;

architecture sim of Gato is

    signal clk_freq    : integer := 6e6;
    signal counter     : integer;

    signal row_counter : unsigned(2 downto 0);

begin
    
    COUNTER_PROC : process(clk)
    begin
        if rising_edge(clk) then
            if counter = clk_freq - 1 then
                counter <= 0;

<<<<<<< HEAD
                row_counter <= row_counter + 1;
=======
                row_counter = row_counter + 1;
>>>>>>> main

            else
                counter <= counter + 1; 



            end if;
        end if;
    end process;

    OUTPUT_PROC : process(row_counter)
    begin
        columnas(3) <= '1';

        filas <= (others => '0');
        filas(to_integer(row_counter)) <= '1';
        
    end process;

end architecture sim;