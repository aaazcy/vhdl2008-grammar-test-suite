-- =============================================================
-- Case ID: TC_GENERATE_SPECIFICATION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_GENERATE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: generate_specification ::= static_discrete_range | static_expression | alternative_label
-- Case Type: Negative
-- Test Focus: SNN: incomplete discrete range in generate_specification——in the block configuration, the range in for gen_sr(2 to) has only the start point and direction keyword but no end point; the static_discrete_range structure is broken
-- Expected Result: Triggers syntax error: primary expression expected
-- Dependencies: None
-- =============================================================
entity gen_spec_bad_range is
end entity gen_spec_bad_range;
architecture vhdl2008 of gen_spec_bad_range is
begin
  gen_sr : for i in 0 to 2 generate
  begin
  end generate gen_sr;
end architecture vhdl2008;

configuration cfg of gen_spec_bad_range is
  for vhdl2008
    for gen_sr(2 to)
    end for;
  end for;
end configuration cfg;
