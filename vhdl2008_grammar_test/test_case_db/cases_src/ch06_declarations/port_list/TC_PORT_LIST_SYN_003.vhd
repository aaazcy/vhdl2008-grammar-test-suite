-- =============================================================
-- Case ID: TC_PORT_LIST_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PORT_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: port_list ::= port_interface_list
-- Case Type: Positive
-- Test Focus: Exercises port_list with generic-parameterized port widths for a configurable-width ALU entity.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.numeric_bit.all;

entity port_list_alu is
  generic (
    WIDTH : integer := 16
  );
  port (
    a_in     : in  bit_vector(WIDTH-1 downto 0);
    b_in     : in  bit_vector(WIDTH-1 downto 0);
    opcode   : in  bit_vector(2 downto 0);
    result   : out bit_vector(WIDTH-1 downto 0);
    carry    : out bit;
    zero     : out bit;
    overflow : out bit;
    negative : out bit
  );
end entity port_list_alu;

architecture rtl of port_list_alu is
  signal s_result : bit_vector(WIDTH downto 0);
begin
  process(a_in, b_in, opcode)
  begin
    case opcode is
      when "000" => s_result <= bit_vector(unsigned('0' & a_in) + unsigned('0' & b_in));
      when "001" => s_result <= bit_vector(unsigned('0' & a_in) - unsigned('0' & b_in));
      when "010" => s_result <= '0' & (a_in and b_in);
      when "011" => s_result <= '0' & (a_in or b_in);
      when "100" => s_result <= '0' & (a_in xor b_in);
      when "101" => s_result <= '0' & (not a_in);
      when others => s_result <= (others => '0');
    end case;
  end process;
  result   <= s_result(WIDTH-1 downto 0);
  carry    <= s_result(WIDTH);
  zero     <= '1' when s_result(WIDTH-1 downto 0) = (WIDTH-1 downto 0 => '0') else '0';
  negative <= s_result(WIDTH-1);
  overflow <= s_result(WIDTH) xor a_in(WIDTH-1) xor b_in(WIDTH-1) xor s_result(WIDTH-1);
end architecture rtl;
