-- =============================================================
-- Case ID: TC_COMPOUND_CONFIGURATION_SPECIFICATION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPOUND_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: compound_configuration_specification ::= for component_specification binding_indication ; verification_unit_binding_indication ; { verification_unit_binding_indication ; } end for ;
-- Case Type: Positive
-- Test Focus: Compound with multi-label instantiation_list + no entity binding + multiple vunits — exercises the compound form where binding_indication is entirely absent (no "use" clause), only vunit bindings follow the component_specification with multiple labels
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ccs_multilabel_nobind is
  port(a,b,c,d,e,f : in bit; y1,y2,y3 : out bit);
end entity;

architecture bh of ccs_multilabel_nobind is
  component gate_nand is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_nand1, u_nand2, u_nand3 : gate_nand
    use vunit nand_formal;
    use vunit nand_timing;
    use vunit nand_power;
  end for;
begin
  u_nand1 : gate_nand port map(x1=>a, x2=>b, z=>y1);
  u_nand2 : gate_nand port map(x1=>c, x2=>d, z=>y2);
  u_nand3 : gate_nand port map(x1=>e, x2=>f, z=>y3);
end architecture bh;
