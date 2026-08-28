-- =============================================================
-- Case ID: TC_ABSOLUTE_PATHNAME_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_ABSOLUTE_PATHNAME_002
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: absolute_pathname ::= . partial_pathname
-- Case Type: Negative
-- Rule Description: In an external name formed by absolute_pathname, the subtype_indication must reference a declared type
-- Error Category: Undeclared subtype in external name
-- Test Focus: SMN: in an external signal name formed by absolute_pathname, the subtype_indication references an undeclared type — in <<signal .tb_top.u_dut.clk : t_undef_path>>, t_undef_path has no declaration at all, so the type cannot be resolved during analysis
-- Expected Result: Triggers analysis error (no declaration for t_undef_path)
-- Dependencies: None
-- =============================================================
entity abs_path_undef_subtype is
end entity;

architecture vhdl2008 of abs_path_undef_subtype is
  alias bad_path is <<signal .tb_top.u_dut.clk : t_undef_path>>;
begin
end architecture vhdl2008;
