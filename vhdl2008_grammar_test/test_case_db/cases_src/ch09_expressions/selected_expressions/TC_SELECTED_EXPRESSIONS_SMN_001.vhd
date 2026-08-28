-- =============================================================
-- Case ID: TC_SELECTED_EXPRESSIONS_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_SELECTED_EXPRESSIONS_CHOICE_TYPE
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: selected_expressions ::= { expression when choices , } expression when choices
-- Case Type: Negative
-- Rule Description: Each choice value must be of the same type as the selector expression.
-- Error Category: Choice type mismatch
-- Test Focus: SMN: choice type does not match the selected expression type — selector is integer but choices use enumeration literals
-- Expected Result: Triggers type error: choice type does not match selector expression type
-- Dependencies: None
-- =============================================================

entity ent_se_smn_001 is
  port (sel : in integer range 0 to 1);
end entity ent_se_smn_001;

architecture choice_mismatch of ent_se_smn_001 is
  signal y : bit;
begin
  with sel select
    -- ERROR: Choice type mismatch — enumeration literal vs integer selector
    y <= '0' when RED,
         '1' when others;
end architecture choice_mismatch;
