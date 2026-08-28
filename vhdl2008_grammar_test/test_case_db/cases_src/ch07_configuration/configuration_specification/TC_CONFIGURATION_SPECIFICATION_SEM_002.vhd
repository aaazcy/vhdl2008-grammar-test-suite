-- =============================================================
-- Case ID: TC_CONFIGURATION_SPECIFICATION_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: configuration_specification ::= simple_configuration_specification | compound_configuration_specification
-- Case Type: Positive (Semantic)
-- Test Focus: Combined simple and compound forms resolve correctly — verifies that one architecture can contain both a simple_configuration_specification for one component and a compound_configuration_specification (with vunits) for another, and that both bindings resolve independently without ambiguity
-- Expected Result: Compiles successfully; both forms semantically valid
-- Dependencies: None
-- =============================================================
entity gate_and is
  port (x1,x2 : in bit; z : out bit);
end entity gate_and;

architecture rtl of gate_and is
begin
end architecture rtl;

entity gate_nor is
  port (x1,x2 : in bit; z : out bit);
end entity gate_nor;

architecture beh of gate_nor is
begin
end architecture beh;

entity confspec_sem_dualform is
  port(a,b,c,d : in bit; y1,y2 : out bit);
end entity;

architecture bh of confspec_sem_dualform is
  component gate_and is
    port(x1,x2 : in bit; z : out bit);
  end component;
  component gate_nor is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_and : gate_and use entity work.gate_and(rtl)
    port map(x1=>a, x2=>b, z=>y1);
  end for;
  for u_nor : gate_nor use entity work.gate_nor(beh)
    port map(x1=>c, x2=>d, z=>y2);
    use vunit nor_assert;
    use vunit nor_check;
  end for;
  function f_debug(a1,b1 : bit) return bit is
  begin return a1 nor b1; end function;
  signal s_debug : bit;
begin
  u_and : gate_and port map(x1=>a, x2=>b, z=>y1);
  u_nor : gate_nor port map(x1=>c, x2=>d, z=>y2);
  s_debug <= f_debug(a, b);
end architecture bh;
