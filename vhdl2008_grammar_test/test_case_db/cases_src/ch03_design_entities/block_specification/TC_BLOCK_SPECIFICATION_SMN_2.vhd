-- =============================================================
-- Case ID: TC_BLOCK_SPECIFICATION_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: BNF_BLOCK_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: block_specification ::= architecture_name block_statement_label | generate_statement_label [ ( generate_specification ) ]
-- Case Type: Negative
-- Test Focus: SEM: the generate_statement_label of block_specification references generate label no_such_gen which does not exist in architecture rtl, verifying name resolution checking of generate statement labels in configurations
-- Expected Result: Triggers semantic error: no declaration for no_such_gen
-- Dependencies: None
-- =============================================================
entity bspec_sem1_ent is
  port(clk, d : in bit; q : out bit);
end entity;
architecture rtl of bspec_sem1_ent is
  component dff is port(clk, d : in bit; q : out bit); end component;
begin
  gen_ff : for i in 0 to 3 generate
    u_ff : dff port map(clk => clk, d => d, q => q);
  end generate;
end architecture;
configuration bspec_sem1_cfg of bspec_sem1_ent is
  for rtl
    for no_such_gen(0)
    end for;
  end for;
end configuration bspec_sem1_cfg;
