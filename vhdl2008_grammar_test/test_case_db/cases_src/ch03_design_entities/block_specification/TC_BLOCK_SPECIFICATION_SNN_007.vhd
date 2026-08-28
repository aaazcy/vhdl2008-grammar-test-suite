-- =============================================================
-- Case ID: TC_BLOCK_SPECIFICATION_SNN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: block_specification ::= architecture_name block_statement_label | generate_statement_label [ ( generate_specification ) ]
-- Case Type: Negative
-- Test Focus: SNN: block_specification references a nonexistent architecture — for specifies an architecture name but the corresponding entity has no such architecture
-- Expected Result: Triggers semantic error: architecture name not found
-- Dependencies: None
-- =============================================================
entity bspec_snn7_ent is
  port(x : in bit; z : out bit);
end entity;
architecture rtl of bspec_snn7_ent is
  component inv is port(a : in bit; y : out bit); end component;
  signal s_inv : bit;
begin
  u_inv : inv port map(a => x, y => s_inv);
  z <= s_inv;
end architecture;
configuration bspec_snn7_cfg of bspec_snn7_ent is
  for bogus_arch
  end for;
end configuration bspec_snn7_cfg;
