-- =============================================================
-- Case ID: TC_CONFIGURATION_SPECIFICATION_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: configuration_specification ::= simple_configuration_specification | compound_configuration_specification
-- Test Focus: Configuration specification production-specific: demonstrates both alternatives (simple + compound) with multi-instance binding — validates the or-choice production by exercising both simple and compound configuration_specification forms in one architecture
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_and is
  port (x1,x2 : in bit; z : out bit);
end entity gate_and;

architecture rtl of gate_and is
begin
end architecture rtl;

entity gate_or is
  port (x1,x2 : in bit; z : out bit);
end entity gate_or;

architecture beh of gate_or is
begin
end architecture beh;

entity confspec_prod_specific is
  port(a,b,c,d : in bit; y1,y2 : out bit);
end entity;

architecture bh of confspec_prod_specific is
  component gate_and is
    port(x1,x2 : in bit; z : out bit);
  end component;
  component gate_or is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_and : gate_and use entity work.gate_and(rtl)
    port map(x1=>a, x2=>b, z=>y1);
  end for;
  for u_or : gate_or use entity work.gate_or(beh)
    port map(x1=>c, x2=>d, z=>y2);
    use vunit or_verify;
  end for;
begin
  u_and : gate_and port map(x1=>a, x2=>b, z=>y1);
  u_or : gate_or port map(x1=>c, x2=>d, z=>y2);
end architecture bh;
