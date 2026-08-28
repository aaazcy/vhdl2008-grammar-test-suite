-- =============================================================
-- Case ID: TC_BLOCK_SPECIFICATION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: block_specification ::= architecture_name block_statement_label | generate_statement_label [ ( generate_specification ) ]
-- Case Type: Positive
-- Test Focus: block_specification multiple instances: multiple architecture_name forms used in the same configuration — outer for rtl, inner for block_label(b_inner) locating a named block in the architecture, and innermost for u_comp:comp binding a concrete entity
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity xor2 is
  port (i1, i2 : in bit; o : out bit);
end entity xor2;

architecture rtl of xor2 is
begin
end architecture rtl;

entity bspec_nested_ent is
  port(x, y : in bit; z : out bit);
end entity;
architecture rtl of bspec_nested_ent is
  component xor2 is port(i1, i2 : in bit; o : out bit); end component;
  signal s_xor : bit;
begin
  b_inner : block
    signal s_local : bit;
  begin
    u_xor : xor2 port map(i1 => x, i2 => y, o => s_local);
    s_xor <= s_local;
  end block;
  z <= s_xor;
end architecture;
configuration bspec_nested_cfg of bspec_nested_ent is
  for rtl
    for b_inner
      for u_xor : xor2 use entity work.xor2(rtl);
      end for;
    end for;
  end for;
end configuration bspec_nested_cfg;
