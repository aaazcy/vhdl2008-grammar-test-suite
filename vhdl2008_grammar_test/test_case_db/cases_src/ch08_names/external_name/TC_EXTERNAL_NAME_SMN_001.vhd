-- =============================================================
-- Case ID: TC_EXTERNAL_NAME_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_EXTERNAL_NAME_002
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_name ::= external_constant_name | external_signal_name | external_variable_name
-- Case Type: Negative
-- Rule Description: The subtype_indication in an external_name must reference a declared type
-- Error Category: Undeclared subtype in external name
-- Test Focus: SMN: in an external_name of the external_variable_name form, the subtype_indication references an undeclared type — in <<variable .tb_top.u_dut.cnt : t_undef_ext>>, t_undef_ext has no declaration, so the type cannot be resolved during analysis
-- Expected Result: Triggers analysis error (no declaration for t_undef_ext)
-- Dependencies: None
-- =============================================================
entity ext_name_undef_subtype is
end entity;

architecture vhdl2008 of ext_name_undef_subtype is
  alias bad_var is <<variable .tb_top.u_dut.cnt : t_undef_ext>>;
begin
end architecture vhdl2008;
