library ieee;
use ieee.std_logic_1164.all;

entity demux_1x8 is
    port (in : in std_logic;
          sel : in std_logic_vector(2 downto 0);
          out : out std_logic_vector(7 downto 0));
end entity demux_1x8;

architecture behavioral of demux_1x8 is
begin
    process (in, sel)
    begin
        case sel is
            when "000" =>
                out(0) <= in;
            when "001" =>
                out(1) <= in;
            when "010" =>
                out(2) <= in;
            when "011" =>
                out(3) <= in;
            when "100" =>
                out(4) <= in;
            when "101" =>
                out(5) <= in;
            when "110" =>
                out(6) <= in;
            when "111" =>
                out(7) <= in;
            when others =>
                null;
        end case;
    end process;
end architecture behavioral;