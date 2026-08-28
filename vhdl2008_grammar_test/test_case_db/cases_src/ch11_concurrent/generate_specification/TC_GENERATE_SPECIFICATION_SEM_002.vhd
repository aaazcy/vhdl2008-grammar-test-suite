-- =============================================================
-- Case ID: TC_GENERATE_SPECIFICATION_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_GENERATE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: generate_specification ::= static_discrete_range | static_expression | alternative_label
-- Rule Description: A generate_specification in a block_specification selects one or more specific iterations of a for_generate_statement for configuration; the static_expression must evaluate to a value within the generate parameter range
-- Case Type: Positive
-- Test Focus: generate_specification is `0`, selecting exactly the first iteration of the for generate——the generate_specification identifies a specific iteration for configuration in the block configuration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gen_spec_sem2_ent is
  port(clk : in bit; din : in bit; dout : out bit);
end entity gen_spec_sem2_ent;
architecture bh of gen_spec_sem2_ent is
  signal s_chain : bit_vector(0 to 3);
begin
  gen_sr : for i in 0 to 2 generate
  begin
    s_chain(i+1) <= s_chain(i);
  end generate gen_sr;
  s_chain(0) <= din;
  dout <= s_chain(3);
end architecture bh;
