-- =============================================================
-- Case ID: TC_SELECTED_EXPRESSIONS_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: selected_expressions ::= { expression when choices , } expression when choices
-- Case Type: Negative
-- Test Focus: SNN: choices use a non-static expression — in when s_val the choices use a signal (not locally static)
-- Expected Result: Triggers semantic error: choices in selected expression must be locally static
-- Dependencies: None
-- =============================================================

entity ent_se_snn_005 is
  port (sel : in integer range 0 to 3);
end entity ent_se_snn_005;

architecture non_static of ent_se_snn_005 is
  signal y     : bit;
  signal s_val : integer := 2;
begin
  with sel select
    -- ERROR: Choices must be locally static — cannot use signal
    y <= '0' when 0,
         '1' when s_val,
         '0' when others;
end architecture non_static;
