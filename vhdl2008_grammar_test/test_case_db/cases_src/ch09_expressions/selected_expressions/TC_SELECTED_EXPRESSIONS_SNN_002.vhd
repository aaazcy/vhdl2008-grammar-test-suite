-- =============================================================
-- Case ID: TC_SELECTED_EXPRESSIONS_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: selected_expressions ::= { expression when choices , } expression when choices
-- Case Type: Negative
-- Test Focus: SNN: missing choices — in with sel select y <= "00" when , the choice value list after when is missing
-- Expected Result: Triggers syntax error: missing choices after 'when' in selected expression
-- Dependencies: None
-- =============================================================

entity ent_se_snn_002 is
  port (sel : in integer range 0 to 1);
end entity ent_se_snn_002;

architecture miss_choices of ent_se_snn_002 is
  signal y : bit;
begin
  with sel select
    -- ERROR: Missing choices after 'when' keyword
    y <= '0' when ,
         '1' when 1;
end architecture miss_choices;
