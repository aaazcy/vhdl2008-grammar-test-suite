-- =============================================================
-- Case ID: TC_USE_CLAUSE_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_USE_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 12.4
-- Production: use_clause ::= use selected_name { , selected_name } ;
-- Case Type: Negative
-- Test Focus: SNN missing ";" semicolon terminator: use ieee.std_logic_1164.all — a complete use_clause lacks the required semicolon at the end, verifying that the parser detects the missing semicolon at the end of the use_clause
-- Expected Result: Triggers syntax error: missing ";" at end of use_clause
-- Dependencies: None
-- =============================================================
entity uc_missing_semi is
  port (
    a : in  bit;
    y : out bit
  );
end entity uc_missing_semi;

architecture rtl of uc_missing_semi is
  -- ERROR: missing ";" at end of use_clause
  use ieee.std_logic_1164.all
  signal s : bit;
begin
  s <= a;
  y <= s;
end architecture rtl;
