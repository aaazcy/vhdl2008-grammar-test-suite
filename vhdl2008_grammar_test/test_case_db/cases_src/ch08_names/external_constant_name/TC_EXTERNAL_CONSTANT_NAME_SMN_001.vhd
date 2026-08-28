-- =============================================================
-- Case ID: TC_EXTERNAL_CONSTANT_NAME_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_EXTERNAL_CONSTANT_NAME_002
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_constant_name ::= << constant external_pathname : subtype_indication >>
-- Case Type: Negative
-- Rule Description: The entity class declared by external_constant_name is constant, and a constant alias cannot be used as the target of a signal assignment
-- Error Category: Illegal assignment target
-- Test Focus: SMN: an external_constant_name alias used as a signal assignment target — in bad_const <= '1', bad_const is an alias of the <<constant ...>> external constant name; a constant is not a signal, so it cannot be the target of a signal assignment statement
-- Expected Result: Triggers analysis error (target alias is not a signal)
-- Dependencies: None
-- =============================================================
entity ext_const_assign_target is
end entity;

architecture vhdl2008 of ext_const_assign_target is
  alias bad_const is <<constant .tb_top.u_dut.cfg : bit>>;
begin
  bad_const <= '1';
end architecture vhdl2008;
