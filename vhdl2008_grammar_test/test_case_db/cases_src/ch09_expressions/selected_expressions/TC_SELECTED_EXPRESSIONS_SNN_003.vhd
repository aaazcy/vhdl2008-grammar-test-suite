-- =============================================================
-- Case ID: TC_SELECTED_EXPRESSIONS_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: selected_expressions ::= { expression when choices , } expression when choices
-- Case Type: Negative
-- Test Focus: SNN: missing comma between branches — in y <= "00" when 0 "01" when 1 the two when branches lack a comma separator
-- Expected Result: Triggers syntax error: missing comma between selected expression branches
-- Dependencies: None
-- =============================================================

entity ent_se_snn_003 is
  port (sel : in integer range 0 to 1);
end entity ent_se_snn_003;

architecture miss_comma of ent_se_snn_003 is
  signal y : bit;
begin
  with sel select
    -- ERROR: Missing comma between when-branches
    y <= '0' when 0
         '1' when 1;
end architecture miss_comma;
