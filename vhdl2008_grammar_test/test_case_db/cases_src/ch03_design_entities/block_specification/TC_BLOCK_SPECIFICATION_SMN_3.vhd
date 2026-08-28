-- =============================================================
-- Case ID: TC_BLOCK_SPECIFICATION_SMN_3
-- Rule Type: Semantic
-- Related Rule ID: BNF_BLOCK_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: block_specification ::= architecture_name block_statement_label | generate_statement_label [ ( generate_specification ) ]
-- Case Type: Negative
-- Test Focus: SEM: block_specification uses the architecture_name form to reference a nonexistent block — under for rtl, the block label in for nonexistent_block does not exist in the architecture
-- Expected Result: Triggers semantic error: block label not found in architecture body
-- Dependencies: None
-- =============================================================
entity bspec_sem2_ent is
  port(a, b : in bit; y : out bit);
end entity;
architecture rtl of bspec_sem2_ent is
  component and2 is port(i1, i2 : in bit; o : out bit); end component;
  signal s_and : bit;
begin
  u_and : and2 port map(i1 => a, i2 => b, o => s_and);
  y <= s_and;
end architecture;
configuration bspec_sem2_cfg of bspec_sem2_ent is
  for rtl
    for phantom_block
    end for;
  end for;
end configuration bspec_sem2_cfg;
