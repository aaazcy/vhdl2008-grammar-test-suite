-- =============================================================
-- Case ID: TC_CONFIGURATION_SPECIFICATION_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: configuration_specification ::= simple_configuration_specification | compound_configuration_specification
-- Case Type: Positive
-- Test Focus: Compound configuration_specification with multi-label + generic_map + multiple vunits — exercises the compound alternative of configuration_specification with a full binding_indication and three verification_unit_binding_indication clauses, demonstrating the or-choice at full complexity
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_nand is
  generic (DELAY : time := 1 ns);
  port (x1,x2 : in bit; z : out bit);
end entity gate_nand;

architecture rtl of gate_nand is
begin
end architecture rtl;

entity confspec_compound_full is
  port(a,b,c,d : in bit; y1,y2 : out bit);
end entity;

architecture bh of confspec_compound_full is
  component gate_nand is
    generic(DELAY : time := 1 ns);
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_nand1, u_nand2 : gate_nand use entity work.gate_nand(rtl)
    generic map(DELAY => 250 ps)
    port map(x1=>a, x2=>b, z=>y1);
    use vunit nand_safety;
    use vunit nand_fault;
    use vunit nand_coverage;
  end for;
begin
  u_nand1 : gate_nand port map(x1=>a, x2=>b, z=>y1);
  u_nand2 : gate_nand port map(x1=>c, x2=>d, z=>y2);
end architecture bh;
