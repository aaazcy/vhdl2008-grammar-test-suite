-- =============================================================
-- Case ID: TC_BLOCK_SPECIFICATION_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: block_specification ::= architecture_name block_statement_label | generate_statement_label [ ( generate_specification ) ]
-- Case Type: Negative
-- Test Focus: SNN: discrete range of generate_specification in block_specification missing the right bound — in for gen_ff(0 to) the bound expression after "to" is missing, verifying that the discrete_range of generate_specification requires complete bound expressions on both sides
-- Expected Result: Triggers syntax error: primary expression expected
-- Dependencies: None
-- =============================================================
entity bspec_snn6_ent is
  port(clk, d : in bit; q : out bit);
end entity;
architecture rtl of bspec_snn6_ent is
  component dff is port(clk, d : in bit; q : out bit); end component;
begin
  gen_ff : for i in 0 to 3 generate
    u_ff : dff port map(clk => clk, d => d, q => q);
  end generate;
end architecture;
configuration bspec_snn6_cfg of bspec_snn6_ent is
  for rtl
    for gen_ff(0 to)
    end for;
  end for;
end configuration bspec_snn6_cfg;
