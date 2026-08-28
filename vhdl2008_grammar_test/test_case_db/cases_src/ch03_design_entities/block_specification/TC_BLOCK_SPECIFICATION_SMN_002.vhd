-- =============================================================
-- Case ID: TC_BLOCK_SPECIFICATION_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_BLOCK_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: block_specification ::= architecture_name block_statement_label | generate_statement_label [ ( generate_specification ) ]
-- Case Type: Negative
-- Test Focus: SMN: generate_specification of block_specification contains a non-integer index — generate declares an integer index with for i in 0 to 3, but the configuration uses a real index in for gen(1.5)
-- Expected Result: Triggers semantic error: generate index type mismatch
-- Dependencies: None
-- =============================================================
entity bspec_smn2_ent is
  port(clk, d : in bit; q : out bit);
end entity;
architecture rtl of bspec_smn2_ent is
  component dff is port(clk, d : in bit; q : out bit); end component;
begin
  gen_ff : for i in 0 to 7 generate
    u_ff : dff port map(clk => clk, d => d, q => q);
  end generate;
end architecture;
configuration bspec_smn2_cfg of bspec_smn2_ent is
  for rtl
    for gen_ff(1.5)
    end for;
  end for;
end configuration bspec_smn2_cfg;
