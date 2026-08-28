-- =============================================================
-- Case ID: TC_BIT_STRING_LITERAL_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_BIT_STRING_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.8
-- Production: bit_string_literal ::= [ integer ] base_specifier " [ bit_value ] "
-- Case Type: Positive
-- Test Focus: Bit string literal all formats: B(binary)/O(octal)/X(hex)/UB/UO/UX(unsigned)/SB/SO/SX(signed)/D(decimal), with width prefix and don't-care(-), verify all base_specifiers and width control of bit_string_literal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;
entity bsl_ent is port(y:out integer); end entity;
architecture bh of bsl_ent is
  constant C_B:bit_vector(7 downto 0):=B"1111_0000";
  constant C_O:bit_vector(8 downto 0):=O"360";
  constant C_X:bit_vector(7 downto 0):=X"F0";
  constant C_UB:bit_vector(7 downto 0):=UB"11110000";
  constant C_SX:bit_vector(7 downto 0):=SX"F0";
  constant C_MATCH:std_logic_vector(3 downto 0):=B"01--";
  signal s_v:bit_vector(7 downto 0):=X"00";
begin
  s_v<=C_B or C_O(7 downto 0) or C_X;
  y<=1 when s_v/=X"00" else 0;
end architecture bh;
