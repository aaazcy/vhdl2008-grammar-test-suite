-- =============================================================
-- Case ID: TC_RELATIVE_PATHNAME_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_RELATIVE_PATHNAME_002
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: relative_pathname ::= { ^ . } partial_pathname
-- Case Type: Negative
-- Rule Description: In an external name formed by a relative_pathname, the subtype_indication must reference a declared type
-- Error Category: Undeclared subtype in external name
-- Test Focus: SMN: In an external signal name formed by a relative_pathname the subtype_indication references an undeclared type——in <<signal ^.^.u_dut.sig : t_undef_rel>>, t_undef_rel has no declaration and the type cannot be resolved at analysis time
-- Expected Result: Triggers analysis error (no declaration for t_undef_rel)
-- Dependencies: None
-- =============================================================
entity rel_path_undef_subtype is
end entity;

architecture vhdl2008 of rel_path_undef_subtype is
  alias bad_ref is <<signal ^.^.u_dut.sig : t_undef_rel>>;
begin
end architecture vhdl2008;
