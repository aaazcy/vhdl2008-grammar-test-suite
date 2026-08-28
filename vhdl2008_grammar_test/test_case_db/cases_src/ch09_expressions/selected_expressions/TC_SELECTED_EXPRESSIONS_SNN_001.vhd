-- =============================================================
-- Case ID: TC_SELECTED_EXPRESSIONS_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: selected_expressions ::= { expression when choices , } expression when choices
-- Case Type: Negative
-- Test Focus: SNN: missing "when" keyword — in with sel select y <= "00" 0; the when separator before choices is missing
-- Expected Result: Triggers syntax error: missing 'when' keyword in selected expression
-- Dependencies: None
-- =============================================================

entity ent_se_snn_001 is
  port (sel : in integer range 0 to 1);
end entity ent_se_snn_001;

architecture miss_when of ent_se_snn_001 is
  signal y : bit;
begin
  with sel select
    -- ERROR: Missing 'when' keyword before choices
    y <= '0' 0,
         '1' when 1;
end architecture miss_when;
