-- =============================================================
-- Case ID: TC_PARTIAL_PATHNAME_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_PARTIAL_PATHNAME_002
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: partial_pathname ::= { pathname_element . } object_simple_name
-- Case Type: Negative
-- Rule Description: In an external name formed by a partial_pathname, the subtype_indication must reference a declared type
-- Error Category: Undeclared subtype in external name
-- Test Focus: SMN: In an external signal name formed by a partial_pathname the subtype_indication references an undeclared type——in <<signal .tb_top.u_dut.sig : t_undef_part>>, t_undef_part has no declaration and the type cannot be resolved at analysis time
-- Expected Result: Triggers analysis error (no declaration for t_undef_part)
-- Dependencies: None
-- =============================================================
entity part_path_undef_subtype is
end entity;

architecture vhdl2008 of part_path_undef_subtype is
  alias bad_ref is <<signal .tb_top.u_dut.sig : t_undef_part>>;
begin
end architecture vhdl2008;
