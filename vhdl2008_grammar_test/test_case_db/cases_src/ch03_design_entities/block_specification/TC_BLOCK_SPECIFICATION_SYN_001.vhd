-- =============================================================
-- Case ID: TC_BLOCK_SPECIFICATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: block_specification ::= architecture_name block_statement_label | generate_statement_label [ ( generate_specification ) ]
-- Case Type: Positive
-- Test Focus: minimal block_specification using the architecture_name form: for rtl in the configuration specifies the architecture name as the minimal configuration binding target, verifying the first alternative syntax of block_specification
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bspec_min_ent is
  port(a : in bit; y : out bit);
end entity;
architecture rtl of bspec_min_ent is
  component buf1 is port(a : in bit; z : out bit); end component;
  signal s_buf : bit;
begin
  u_buf : buf1 port map(a => a, z => s_buf);
  y <= s_buf;
end architecture;
configuration bspec_min_cfg of bspec_min_ent is
  for rtl
  end for;
end configuration bspec_min_cfg;
