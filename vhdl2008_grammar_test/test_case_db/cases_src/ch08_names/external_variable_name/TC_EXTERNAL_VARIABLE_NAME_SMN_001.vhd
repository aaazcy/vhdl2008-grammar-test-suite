-- =============================================================
-- Case ID: TC_EXTERNAL_VARIABLE_NAME_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_EXTERNAL_VARIABLE_NAME_002
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_variable_name ::= << variable external_pathname : subtype_indication >>
-- Case Type: Negative
-- Rule Description: The entity class declared by external_variable_name is variable, so a variable alias cannot be the target of a signal assignment
-- Error Category: Illegal assignment target
-- Test Focus: SMN: an external_variable_name alias used as a signal assignment target — in bad_var <= '1', bad_var is the alias of a <<variable ...>> external variable name, and a variable is not a signal, so it cannot be the target of a signal assignment statement
-- Expected Result: Triggers analysis error (target alias is not a signal)
-- Dependencies: None
-- =============================================================
entity ext_var_signal_target is
end entity;

architecture vhdl2008 of ext_var_signal_target is
  alias bad_var is <<variable .tb_top.u_dut.cnt : bit>>;
begin
  bad_var <= '1';
end architecture vhdl2008;
