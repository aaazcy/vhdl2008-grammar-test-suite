-- =============================================================
-- Case ID: TC_GENERATE_SPECIFICATION_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_GENERATE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: generate_specification ::= static_discrete_range | static_expression | alternative_label
-- Rule Description: The label in a generate_specification must refer to a generate statement declared in the design hierarchy
-- Case Type: Negative
-- Error Category: unresolved_label
-- Test Focus: SMN: generate_specification referencing a nonexistent generate label——in the block configuration, ghost in for ghost(0) is not the label of any generate statement and cannot be resolved
-- Expected Result: Triggers analysis error: no declaration for "ghost"
-- Dependencies: None
-- =============================================================
entity gen_spec_ghost_ent is
end entity gen_spec_ghost_ent;
architecture vhdl2008 of gen_spec_ghost_ent is
begin
  gen_sr : for i in 0 to 2 generate
  begin
  end generate gen_sr;
end architecture vhdl2008;

configuration cfg of gen_spec_ghost_ent is
  for vhdl2008
    for ghost(0)
    end for;
  end for;
end configuration cfg;
