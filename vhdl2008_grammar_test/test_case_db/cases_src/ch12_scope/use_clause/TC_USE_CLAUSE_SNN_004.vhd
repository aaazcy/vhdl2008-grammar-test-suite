-- =============================================================
-- Case ID: TC_USE_CLAUSE_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_USE_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 12.4
-- Production: use_clause ::= use selected_name { , selected_name } ;
-- Case Type: Negative
-- Test Focus: SNN missing comma separator: use ieee.std_logic_1164.all ieee.numeric_std.all ; — the comma separator between the two selected_names is missing, verifying that the parser detects the missing comma with multiple selected_names
-- Expected Result: Triggers syntax error: missing "," between selected_names
-- Dependencies: None
-- =============================================================
entity uc_missing_comma is
  port (
    d : in  bit_vector(3 downto 0);
    q : out bit_vector(3 downto 0)
  );
end entity uc_missing_comma;

architecture rtl of uc_missing_comma is
  -- ERROR: missing comma between selected_names
  use ieee.std_logic_1164.all ieee.numeric_std.all;
  signal s_reg : std_logic_vector(3 downto 0);
begin
  s_reg <= to_stdlogicvector(d);
  q <= to_bitvector(s_reg);
end architecture rtl;
