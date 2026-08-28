-- =============================================================
-- Case ID: TC_GENERATE_SPECIFICATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_GENERATE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: generate_specification ::= static_discrete_range | static_expression | alternative_label
-- Case Type: Positive
-- Test Focus: static_discrete_range form——the generate_specification is the range `0 to 3`, identifying several consecutive for generate iterations in the block configuration context
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gen_spec_range_ent is
  port(clk : in bit; din : in bit_vector(3 downto 0); dout : out bit_vector(3 downto 0));
end entity gen_spec_range_ent;
architecture bh of gen_spec_range_ent is
  type t_arr is array(0 to 3) of bit_vector(3 downto 0);
  signal s_stages : t_arr;
begin
  gen_pipe : for i in 0 to 3 generate
  begin
    s_stages(i) <= din when i = 0 else s_stages(i-1);
  end generate gen_pipe;
  dout <= s_stages(3);
end architecture bh;
