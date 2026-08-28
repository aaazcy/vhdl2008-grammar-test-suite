-- =============================================================
-- Case ID: TC_COMPOUND_CONFIGURATION_SPECIFICATION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPOUND_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: compound_configuration_specification ::= for component_specification binding_indication ; verification_unit_binding_indication ; { verification_unit_binding_indication ; } end for ;
-- Case Type: Positive
-- Test Focus: Compound form with entity binding + generic_map_aspect + single vunit — exercises the full compound form clause order: binding_indication with generic map, a semicolon, then one verification_unit_binding_indication, then "end for ;"
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_and_gen is
  generic (DELAY : time := 1 ns);
  port (x1,x2 : in bit; z : out bit);
end entity gate_and_gen;

architecture rtl of gate_and_gen is
begin
end architecture rtl;

entity ccs_generic_vunit is
  port(a,b : in bit; y : out bit);
end entity;

architecture bh of ccs_generic_vunit is
  component gate_and_gen is
    generic(DELAY : time := 1 ns);
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_and : gate_and_gen use entity work.gate_and_gen(rtl)
    generic map(DELAY => 500 ps)
    port map(x1=>a, x2=>b, z=>y);
    use vunit and_timing;
  end for;
begin
  u_and : gate_and_gen port map(x1=>a, x2=>b, z=>y);
end architecture bh;
