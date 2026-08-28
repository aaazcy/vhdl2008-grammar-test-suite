-- =============================================================
-- Case ID: TC_USE_CLAUSE_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_USE_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 12.4
-- Production: use_clause ::= use selected_name { , selected_name } ;
-- Case Type: Negative
-- Test Focus: SNN missing selected_name: use ; — a semicolon directly follows the "use" keyword with an empty selected_name, verifying that the parser detects the missing required selected_name after use
-- Expected Result: Triggers syntax error: missing selected_name after "use"
-- Dependencies: None
-- =============================================================
entity uc_empty_selected is
  port (
    y : out bit
  );
end entity uc_empty_selected;

architecture rtl of uc_empty_selected is
  -- ERROR: empty selected_name after "use"
  use ;
  signal s : bit := '0';
begin
  y <= s;
end architecture rtl;
