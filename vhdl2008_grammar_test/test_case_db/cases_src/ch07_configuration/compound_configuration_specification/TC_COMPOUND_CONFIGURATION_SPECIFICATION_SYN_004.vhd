-- =============================================================
-- Case ID: TC_COMPOUND_CONFIGURATION_SPECIFICATION_SYN_004
-- Rule Type: Syntax
-- BNF Production: COMPOUND_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: compound_configuration_specification ::= for component_specification binding_indication ; verification_unit_binding_indication ; { verification_unit_binding_indication ; } end for ;
-- Case Type: Positive
-- Test Focus: Compound configuration with "all" instantiation_list and single vunit — exercises the "all" keyword inside component_specification within a compound form, using open entity_aspect
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ccs_all_with_open is
  port(a,b,c,d : in bit; y1,y2 : out bit);
end entity;

architecture bh of ccs_all_with_open is
  component gate_xor is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for all : gate_xor use open
    use vunit xor_protocol;
  end for;
begin
  u_xor1 : gate_xor port map(x1=>a, x2=>b, z=>y1);
  u_xor2 : gate_xor port map(x1=>c, x2=>d, z=>y2);
end architecture bh;
