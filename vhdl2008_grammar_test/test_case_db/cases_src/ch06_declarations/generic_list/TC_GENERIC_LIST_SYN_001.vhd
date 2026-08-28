-- =============================================================
-- Case ID: TC_GENERIC_LIST_SYN_001
-- Rule Type: Syntax
-- BNF Production: GENERIC_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: generic_list ::= generic_interface_list
-- Test Focus: generic_list with a single generic_interface_declaration.
--   Verifies the simplest form of the generic_list: one interface constant
--   declaration with a type and default value. The generic_list reduces to
--   a single element within the generic_clause parentheses.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity bit_repeater is
  generic (
    REPEAT_COUNT : integer := 4
  );
  port (
    bit_in  : in  bit;
    bits_out : out bit_vector(REPEAT_COUNT-1 downto 0)
  );
end entity bit_repeater;

architecture rtl of bit_repeater is
begin
  gen_repeat : for i in 0 to REPEAT_COUNT-1 generate
    bits_out(i) <= bit_in;
  end generate;
end architecture rtl;
