-- =============================================================
-- Case ID: TC_CONFIGURATION_SPECIFICATION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: configuration_specification ::= simple_configuration_specification | compound_configuration_specification
-- Case Type: Positive
-- Test Focus: Configuration specification using compound form — exercises the compound_configuration_specification alternative with "use vunit" clauses, verifying the or-choice between simple and compound
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_nand is
  port (x1,x2 : in bit; z : out bit);
end entity gate_nand;

architecture beh of gate_nand is
begin
end architecture beh;

entity confspec_compound is
  port(a,b : in bit; y : out bit);
end entity;

architecture bh of confspec_compound is
  component gate_nand is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_nand : gate_nand use entity work.gate_nand(beh)
    port map(x1=>a, x2=>b, z=>y);
    use vunit nand_verify;
  end for;
begin
  u_nand : gate_nand port map(x1=>a, x2=>b, z=>y);
end architecture bh;
