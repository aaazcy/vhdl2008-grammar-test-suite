-- =============================================================
-- Case ID: TC_USE_CLAUSE_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_USE_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 12.4
-- Production: use_clause ::= use selected_name { , selected_name } ;
-- Case Type: Negative
-- Test Focus: SNN trailing comma: use ieee.std_logic_1164.all, ; — an extra comma follows the last selected_name before the semicolon; the BNF requires a comma only within the { , selected_name } repetition, verifying that the parser detects the superfluous trailing comma
-- Expected Result: Triggers syntax error: trailing comma before ";"
-- Dependencies: None
-- =============================================================
entity uc_trailing_comma is
  port (
    y : out bit
  );
end entity uc_trailing_comma;

architecture rtl of uc_trailing_comma is
  -- ERROR: trailing comma before semicolon
  use ieee.std_logic_1164.all, ;
  signal s : bit := '0';
begin
  y <= s;
end architecture rtl;
