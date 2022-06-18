library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Gato is
    port(
        clk       : in std_logic;

        filas     : out std_logic_vector(7 downto 0)  := (others <= '0');
        columnas  : out std_logic_vector(7 downto 0)  := (others <= '0'));
end entity Gato;

architecture sim of Gato is

begin





end architecture sim;