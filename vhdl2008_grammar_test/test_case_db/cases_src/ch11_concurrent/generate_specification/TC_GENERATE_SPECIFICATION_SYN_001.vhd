-- =============================================================
-- Case ID: TC_GENERATE_SPECIFICATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_GENERATE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: generate_specification ::= static_discrete_range | static_expression | alternative_label
-- Case Type: Positive
-- Test Focus: Minimal form——static_expression as an integer literal: the generate_specification is the single static integer `0`, identifying the first iteration of the for generate in the block_configuration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gen_spec_min_ent is
  port(clk : in bit; din : in bit; dout : out bit);
end entity gen_spec_min_ent;
architecture bh of gen_spec_min_ent is
  signal s_chain : bit_vector(0 to 3);
begin
  gen_sr : for i in 0 to 2 generate
  begin
    s_chain(i+1) <= s_chain(i);
  end generate gen_sr;
  s_chain(0) <= din;
  dout <= s_chain(3);
end architecture bh;
