-- =============================================================
-- Case ID: TC_BLOCK_SPECIFICATION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: block_specification ::= architecture_name block_statement_label | generate_statement_label [ ( generate_specification ) ]
-- Case Type: Negative
-- Test Focus: SNN: incorrect syntax of the architecture_name form in block_specification — for is followed by a wrong entity name (it should actually be architecture_name followed by block_label or a plain architecture_name), causing a parse failure
-- Expected Result: Triggers syntax error: invalid block_specification
-- Dependencies: None
-- =============================================================
entity bspec_snn5_ent is
  port(a : in bit; y : out bit);
end entity;
architecture rtl of bspec_snn5_ent is
  component buf1 is port(a : in bit; z : out bit); end component;
  signal s_buf : bit;
begin
  u_buf : buf1 port map(a => a, z => s_buf);
  y <= s_buf;
end architecture;
configuration bspec_snn5_cfg of bspec_snn5_ent is
  for rtl u_buf
  end for;
end configuration bspec_snn5_cfg;
