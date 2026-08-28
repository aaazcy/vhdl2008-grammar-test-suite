-- =============================================================
-- Case ID: TC_BLOCK_SPECIFICATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: block_specification ::= architecture_name block_statement_label | generate_statement_label [ ( generate_specification ) ]
-- Case Type: Positive
-- Test Focus: block_specification using the generate_statement_label form without index: for gen_label (generate_specification omitted) in the configuration specifies the whole generate block, verifying the legal syntax of generate_label without a parenthesized index
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bspec_gen_ent is
  port(clk, d : in bit; q : out bit);
end entity;
architecture rtl of bspec_gen_ent is
  component dff is port(clk, d : in bit; q : out bit); end component;
begin
  gen_ff : for i in 0 to 1 generate
    u_ff : dff port map(clk => clk, d => d, q => q);
  end generate;
end architecture;
configuration bspec_gen_cfg of bspec_gen_ent is
  for rtl
    for gen_ff
    end for;
  end for;
end configuration bspec_gen_cfg;
