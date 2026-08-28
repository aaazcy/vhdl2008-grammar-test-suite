-- =============================================================
-- Case ID: TC_GENERATE_SPECIFICATION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_GENERATE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: generate_specification ::= static_discrete_range | static_expression | alternative_label
-- Case Type: Positive
-- Test Focus: alternative_label form——the generate_specification is the name of an alternative_label declared in a case generate, referencing a specific case generate branch in the configuration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gen_spec_label_ent is
  port(a, b : in bit_vector(3 downto 0); y : out bit_vector(3 downto 0));
end entity gen_spec_label_ent;
architecture bh of gen_spec_label_ent is
  constant op : integer := 0;
begin
  gen_op : case op generate
    when alt_add : 0 =>
      y <= a xor b;
    when alt_sub : 1 =>
      y <= a and b;
    when others =>
      y <= a;
  end generate gen_op;
end architecture bh;
