-- =============================================================
-- Case ID: TC_SELECTED_EXPRESSIONS_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_SELECTED_EXPRESSIONS_BRANCH_TYPE
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: selected_expressions ::= { expression when choices , } expression when choices
-- Case Type: Negative
-- Rule Description: All branch expressions in a selected signal assignment must have the same type.
-- Error Category: Branch expression type mismatch
-- Test Focus: SMN: branch expression types differ — one branch returns bit_vector while another returns bit, all branch expressions must have the same type
-- Expected Result: Triggers type error: branch expression types differ in selected assignment
-- Dependencies: None
-- =============================================================

entity ent_se_smn_002 is
  port (sel : in integer range 0 to 1);
end entity ent_se_smn_002;

architecture branch_mismatch of ent_se_smn_002 is
  signal y : bit_vector(1 downto 0);
begin
  with sel select
    -- ERROR: Branch expression type mismatch — bit vs bit_vector
    y <= "00" when 0,
         '1'  when others;
end architecture branch_mismatch;
