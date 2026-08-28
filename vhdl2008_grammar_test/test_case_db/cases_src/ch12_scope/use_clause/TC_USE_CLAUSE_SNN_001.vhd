-- =============================================================
-- Case ID: TC_USE_CLAUSE_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_USE_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 12.4
-- Production: use_clause ::= use selected_name { , selected_name } ;
-- Case Type: Negative
-- Test Focus: SNN missing "use" keyword: selected_name {, selected_name} ; — starts directly with a selected_name, missing the first token "use" in the BNF, verifying that the parser detects the missing use keyword
-- Expected Result: Triggers syntax error: missing "use" keyword
-- Dependencies: None
-- =============================================================
entity uc_missing_use is
  port (
    d : in  bit;
    q : out bit
  );
end entity uc_missing_use;

architecture rtl of uc_missing_use is
  -- ERROR: missing "use" keyword in use_clause
  ieee.std_logic_1164.all;
  signal s_q : bit;
begin
  s_q <= d;
  q <= s_q;
end architecture rtl;
