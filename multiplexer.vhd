--Simple serializer data
--Design Software Quartus Prime Version 16.0 Lite Edition
--Tested on Cyclone iv DE0 Nano board  

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity multiplexer is
port(	clk1    : in std_logic;  --clock in 50 MHz
		entrada : in std_logic_vector(7 downto 0);--parallel in
		salida  : out std_logic); --serial out 
		
end multiplexer;

architecture behavior of multiplexer is

signal sel :std_logic_vector(2 downto 0); --signal for selection of "entrada" bits

begin

process(clk1, sel)

variable count : integer range 0 to 8; --variable used for the counter of the selection in

begin

	if clk1'event and clk1='1' then 
			
			count := count + 1; -- counter 
			
			if count=8 then
				count := 0;	 -- loop for count
			end if;
			
			case count is -- associated outputs for sel
				
				when 0 => sel <= "000";
				when 1 => sel <= "001";
				when 2 => sel <= "010";
				when 3 => sel <= "011";
				when 4 => sel <= "100";
				when 5 => sel <= "101";
				when 6 => sel <= "110";
				when 7 => sel <= "111";
				when others => sel <= "000";
				
			end case;
	

			case sel is -- associated outputs for ¨"salida"
		
				when "000" => salida <= entrada(0);
				when "001" => salida <= entrada(1);
				when "010" => salida <= entrada(2);
				when "011" => salida <= entrada(3);
				when "100" => salida <= entrada(4);
				when "101" => salida <= entrada(5);
				when "110" => salida <= entrada(6);
				when "111" => salida <= entrada(7);
				when others => salida <= '0';
			
			end case;
	
	end if;
end process;

end behavior;