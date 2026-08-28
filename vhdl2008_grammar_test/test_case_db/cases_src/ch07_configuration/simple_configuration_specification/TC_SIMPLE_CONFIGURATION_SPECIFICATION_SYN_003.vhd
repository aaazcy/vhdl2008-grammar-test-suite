-- =============================================================
-- Case ID: TC_SIMPLE_CONFIGURATION_SPECIFICATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: simple_configuration_specification ::= for component_specification binding_indication [ ; ] end for [ ; ]
-- Case Type: Positive
-- Test Focus: Multiple simple config specs in one architecture — varied syntactic forms: with end for, without end for, with and without trailing semicolons, demonstrating flexibility of optional elements
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity half_add is
  port (x, y : in bit; s, c : out bit);
end entity half_add;

architecture rtl of half_add is
begin
end architecture rtl;

entity or_gate is
  port (x1, x2 : in bit; z : out bit);
end entity or_gate;

architecture rtl of or_gate is
begin
end architecture rtl;

entity scs_syn3_ent is
  port(a, b, cin : in bit; sum, cout : out bit);
end entity scs_syn3_ent;

architecture rtl of scs_syn3_ent is
  component half_add is
    port(x, y : in bit; s, c : out bit);
  end component half_add;
  component or_gate is
    port(x1, x2 : in bit; z : out bit);
  end component or_gate;

  -- Config spec with end for and trailing semicolons
  for u_ha1 : half_add use entity work.half_add(rtl)
    port map(x => a, y => b, s => s1, c => c1);
  end for;

  -- Config spec without end for, no trailing semicolon
  for u_ha2 : half_add use entity work.half_add(rtl)
    port map(x => s1, y => cin, s => sum, c => c2);

  -- Config spec with end for, trailing semicolons
  for u_or : or_gate use entity work.or_gate(rtl)
    port map(x1 => c1, x2 => c2, z => cout);
  end for;

  signal s1, c1, c2 : bit;
begin
  u_ha1 : half_add port map(x => a, y => b, s => s1, c => c1);
  u_ha2 : half_add port map(x => s1, y => cin, s => sum, c => c2);
  u_or  : or_gate port map(x1 => c1, x2 => c2, z => cout);
end architecture rtl;
