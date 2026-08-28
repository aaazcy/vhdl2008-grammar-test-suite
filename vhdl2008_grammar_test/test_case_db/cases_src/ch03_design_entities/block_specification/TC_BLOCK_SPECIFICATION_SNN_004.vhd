-- =============================================================
-- Case ID: TC_BLOCK_SPECIFICATION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: block_specification ::= architecture_name block_statement_label | generate_statement_label [ ( generate_specification ) ]
-- Case Type: Negative
-- Test Focus: SNN: generate_label with index in block_specification missing the closing parenthesis — for gen(0 lacks ")", verifying that generate_specification parentheses must be paired
-- Expected Result: Triggers syntax error: ")" expected in generate specification
-- Dependencies: None
-- =============================================================
entity bspec_snn4_ent is
  port(clk, d : in bit; q : out bit);
end entity;
architecture rtl of bspec_snn4_ent is
  component dff is port(clk, d : in bit; q : out bit); end component;
begin
  gen_ff : for i in 0 to 1 generate
    u_ff : dff port map(clk => clk, d => d, q => q);
  end generate;
end architecture;
configuration bspec_snn4_cfg of bspec_snn4_ent is
  for rtl
    for gen_ff(0
    end for;
  end for;
end configuration bspec_snn4_cfg;
