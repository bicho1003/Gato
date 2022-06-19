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

    constant clk_freq    : integer := 1e3; --Muliplexación

    
    signal counter     : integer; --Contador para el multiplexado               
    signal row_counter : unsigned(2 downto 0); --Contador de filas en binario que luego se convierte en entero


    type background_type is array (7 downto 0) of std_logic_vector(7 downto 0);
    constant background : background_type := (
        ('0','0','1','0','0','1','0','0'),
        ('0','0','1','0','0','1','0','0'),
        ('0','0','1','0','0','1','0','0'),
        ('0','0','1','0','0','1','0','0'),
        ('0','0','1','0','0','1','0','0'),
        ('0','0','1','0','0','1','0','0'),
        ('0','0','1','0','0','1','0','0'),
        ('0','0','1','0','0','1','0','0')
    );


begin
    
    COUNTER_PROC : process(clk)
    begin
        if rising_edge(clk) then
            if counter = clk_freq - 1 then
                counter <= 0;
                row_counter <= row_counter + 1;


            else
                counter <= counter + 1; 



            end if;
        end if;
    end process;

    OUTPUT_PROC : process(row_counter)
    begin
        
        columnas <= background(to_integer(row_counter));

        filas <= (others => '0');
        filas(to_integer(row_counter)) <= '1';
        
    end process;

end architecture sim;