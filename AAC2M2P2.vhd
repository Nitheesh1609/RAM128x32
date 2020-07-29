LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY RAM128_32 IS
	PORT
	(
		address	: IN STD_LOGIC_VECTOR (6 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END RAM128_32;
architecture arch of RAM128_32 is
 type array_type is array(0 to 127) of std_logic_vector(31 downto 0);
 signal array_reg:array_type;
signal radd:std_logic_vector(6 downto 0);
begin
proc:process(clock,wren,address,data)
begin
if rising_edge(clock) then 
if wren='1' then 
  array_reg(to_integer(unsigned(address))) <= data;
end if;
radd<=address;
end if;
end process proc;
q<= array_reg(to_integer(unsigned(radd)));
end architecture arch;
