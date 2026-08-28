-- =============================================================
-- Case ID: TC_BLOCK_SPECIFICATION_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_BLOCK_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: block_specification ::= architecture_name block_statement_label | generate_statement_label [ ( generate_specification ) ]
-- Case Type: Negative
-- Test Focus: SMN: block_specification redundantly uses architecture_name after generate_label — for gen_label rtl mixes the two syntaxes, violating the mutually exclusive syntax rule
-- Expected Result: Triggers syntax error: invalid block_specification syntax
-- Dependencies: None
-- =============================================================
entity bspec_smn1_ent is
  port(clk, d : in bit; q : out bit);
end entity;
architecture rtl of bspec_smn1_ent is
  component dff is port(clk, d : in bit; q : out bit); end component;
begin
  gen_ff : for i in 0 to 1 generate
    u_ff : dff port map(clk => clk, d => d, q => q);
  end generate;
end architecture;
configuration bspec_smn1_cfg of bspec_smn1_ent is
  for rtl
    for gen_ff rtl
    end for;
  end for;
end configuration bspec_smn1_cfg;
