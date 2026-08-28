-- =============================================================
-- Case ID: TC_COMPOUND_CONFIGURATION_SPECIFICATION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPOUND_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: compound_configuration_specification ::= for component_specification binding_indication ; verification_unit_binding_indication ; { verification_unit_binding_indication ; } end for ;
-- Case Type: Positive
-- Test Focus: Compound with "others" instantiation_list + open binding + two vunits — exercises the "others" keyword inside the compound form's component_specification, with 'use open' for the entity binding and two verification_unit_binding_indication clauses
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ccs_others_vunit is
  port(a,b,c,d : in bit; y1,y2 : out bit);
end entity;

architecture bh of ccs_others_vunit is
  component gate_or is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for others : gate_or use open
    use vunit or_safety;
    use vunit or_fault;
  end for;
begin
  u_or1 : gate_or port map(x1=>a, x2=>b, z=>y1);
  u_or2 : gate_or port map(x1=>c, x2=>d, z=>y2);
end architecture bh;
