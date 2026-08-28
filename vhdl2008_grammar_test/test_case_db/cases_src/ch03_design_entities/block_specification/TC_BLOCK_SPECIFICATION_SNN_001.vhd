-- =============================================================
-- Case ID: TC_BLOCK_SPECIFICATION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: block_specification ::= architecture_name block_statement_label | generate_statement_label [ ( generate_specification ) ]
-- Case Type: Negative
-- Test Focus: SNN: architecture_name form of block_specification missing the architecture_name — a space directly follows for with no identifier, verifying that the BNF requires a legal architecture_name or label after for
-- Expected Result: Triggers syntax error: identifier expected after "for"
-- Dependencies: None
-- =============================================================
entity bspec_snn1_ent is
  port(a : in bit; y : out bit);
end entity;
architecture rtl of bspec_snn1_ent is
  component inv is port(a : in bit; y : out bit); end component;
  signal s_inv : bit;
begin
  u_inv : inv port map(a => a, y => s_inv);
  y <= s_inv;
end architecture;
configuration bspec_snn1_cfg of bspec_snn1_ent is
  for
  end for;
end configuration bspec_snn1_cfg;
