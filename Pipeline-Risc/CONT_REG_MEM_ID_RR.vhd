library ieee;
use ieee.std_logic_1164.all;

entity CONT_REG_MEM_ID_RR is
  port(inp : in std_logic_vector(1 downto 0);
       clk : in std_logic;
       op  : out std_logic_vector(1 downto 0));
end entity;

architecture desc of CONT_REG_MEM_ID_RR is
begin
process(clk)
begin
if rising_edge(clk) then
  op <= inp;
end if;
end process;
end architecture;
