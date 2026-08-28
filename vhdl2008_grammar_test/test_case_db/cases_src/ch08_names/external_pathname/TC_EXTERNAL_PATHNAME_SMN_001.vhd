-- =============================================================
-- Case ID: TC_EXTERNAL_PATHNAME_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_EXTERNAL_PATHNAME_002
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_pathname ::= package_pathname | absolute_pathname | relative_pathname
-- Case Type: Negative
-- Rule Description: The subtype_indication in the external name formed by external_pathname must reference a declared type
-- Error Category: Undeclared subtype in external name
-- Test Focus: SMN: in an external signal name with absolute_pathname as the external_pathname, the subtype_indication references an undeclared type — in <<signal .tb_top.u_dut.sig : t_undef_extpath>>, t_undef_extpath has no declaration, so the type cannot be resolved during analysis
-- Expected Result: Triggers analysis error (no declaration for t_undef_extpath)
-- Dependencies: None
-- =============================================================
entity ext_path_undef_subtype is
end entity;

architecture vhdl2008 of ext_path_undef_subtype is
  alias bad_path is <<signal .tb_top.u_dut.sig : t_undef_extpath>>;
begin
end architecture vhdl2008;
