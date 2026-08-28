-- =============================================================
-- Case ID: TC_COMPOUND_CONFIGURATION_SPECIFICATION_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPOUND_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: compound_configuration_specification ::= for component_specification binding_indication ; verification_unit_binding_indication ; { verification_unit_binding_indication ; } end for ;
-- Test Focus: Compound configuration production-specific: "for all:comp use entity... use vunit... end for" with multiple vunit bindings — validates the compound form combining binding_indication with verification_unit_binding_indication repetition
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_nand is
  port (x1,x2 : in bit; z : out bit);
end entity gate_nand;

architecture rtl of gate_nand is
begin
end architecture rtl;

entity ccs_prod_specific is
  port(a,b : in bit; y : out bit);
end entity;

architecture bh of ccs_prod_specific is
  component gate_nand is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for all : gate_nand use entity work.gate_nand(rtl)
    port map(x1=>a, x2=>b, z=>y);
    use vunit nand_check;
    use vunit nand_formal;
  end for;
begin
  u_nand : gate_nand port map(x1=>a, x2=>b, z=>y);
end architecture bh;
