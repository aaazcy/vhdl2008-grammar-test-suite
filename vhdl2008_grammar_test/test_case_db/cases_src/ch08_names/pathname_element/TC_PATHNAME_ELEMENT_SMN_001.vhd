-- =============================================================
-- Case ID: TC_PATHNAME_ELEMENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_PATHNAME_ELEMENT_002
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: pathname_element ::= entity_simple_name | component_instantiation_label
-- Case Type: Negative
-- Rule Description: In an external name formed by concatenated pathname_elements, the subtype_indication must reference a declared type
-- Error Category: Undeclared subtype in external name
-- Test Focus: SMN: In an external signal name containing multiple pathname_elements the subtype_indication references an undeclared type——in <<signal .tb_top.u_dut.sig : t_undef_elem>>, t_undef_elem has no declaration and the type cannot be resolved at analysis time
-- Expected Result: Triggers analysis error (no declaration for t_undef_elem)
-- Dependencies: None
-- =============================================================
entity pn_elem_undef_subtype is
end entity;

architecture vhdl2008 of pn_elem_undef_subtype is
  alias bad_ref is <<signal .tb_top.u_dut.sig : t_undef_elem>>;
begin
end architecture vhdl2008;
