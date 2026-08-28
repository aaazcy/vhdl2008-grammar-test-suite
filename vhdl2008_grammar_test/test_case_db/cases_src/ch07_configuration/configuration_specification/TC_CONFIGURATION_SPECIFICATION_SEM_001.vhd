-- =============================================================
-- Case ID: TC_CONFIGURATION_SPECIFICATION_SEM_001
-- Related Rule ID: SEM_CONFIGUR_001
-- Rule Type: Semantic
-- BNF Production: CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: configuration_specification ::= simple_configuration_specification | compound_configuration_specification
-- Case Type: Positive (Semantic)
-- Test Focus: Semantic validation of simple configuration specification with full entity + architecture binding — verifies the configuration correctly binds an instance to a specific entity/architecture pair with port mapping
-- Expected Result: Compiles successfully; semantic binding is correctly resolved
-- Dependencies: None
-- =============================================================
entity gate_xnor is
  port (x1,x2 : in bit; z : out bit);
end entity gate_xnor;

architecture beh of gate_xnor is
begin
end architecture beh;

entity confspec_sem_simple is
  port(a,b : in bit; y : out bit);
end entity;

architecture bh of confspec_sem_simple is
  component gate_xnor is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_xnor : gate_xnor use entity work.gate_xnor(beh)
    port map(x1=>a, x2=>b, z=>y);
  end for;
  function f_bit_and(x,y : bit) return bit is
  begin return x and y; end function;
  signal s_local : bit;
begin
  u_xnor : gate_xnor port map(x1=>a, x2=>b, z=>y);
  s_local <= f_bit_and(a, b);
end architecture bh;
