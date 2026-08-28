-- =============================================================
-- Case ID: TC_USE_CLAUSE_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_USE_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 12.4
-- Production: use_clause ::= use selected_name { , selected_name } ;
-- Case Type: Positive
-- Test Focus: Mixing .all with specific items: use ieee.std_logic_1164.all, ieee.numeric_std."+" — verifies that comma-separated selected_names in the same use_clause can include both .all wildcards and specific items such as operators
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
entity uc_mixed_all_item is
  port (
    op_a   : in  bit_vector(3 downto 0);
    op_b   : in  bit_vector(3 downto 0);
    sum    : out bit_vector(4 downto 0)
  );
end entity uc_mixed_all_item;

architecture rtl of uc_mixed_all_item is
  use ieee.std_logic_1164.all, ieee.numeric_std."+", ieee.numeric_std.resize, ieee.numeric_std.unsigned;
  signal a_u : unsigned(3 downto 0);
  signal b_u : unsigned(3 downto 0);
  signal s_u : unsigned(4 downto 0);
begin
  a_u <= unsigned(to_stdlogicvector(op_a));
  b_u <= unsigned(to_stdlogicvector(op_b));
  s_u <= resize(a_u, 5) + resize(b_u, 5);
  sum <= to_bitvector(std_logic_vector(s_u));
end architecture rtl;
