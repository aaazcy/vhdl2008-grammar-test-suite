-- =============================================================
-- Case ID: TC_SELECTED_EXPRESSIONS_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: selected_expressions ::= { expression when choices , } expression when choices
-- Case Type: Negative
-- Test Focus: SNN: trailing comma — in y <= "00" when 0, "01" when 1, there is a comma after the last when branch but no next branch
-- Expected Result: Triggers syntax error: trailing comma in selected expressions
-- Dependencies: None
-- =============================================================

entity ent_se_snn_004 is
  port (sel : in integer range 0 to 1);
end entity ent_se_snn_004;

architecture trailing of ent_se_snn_004 is
  signal y : bit;
begin
  with sel select
    -- ERROR: Trailing comma — no expression after comma
    y <= '0' when 0,
         '1' when 1, ;
end architecture trailing;
