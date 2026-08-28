-- =============================================================
-- Case ID: TC_COMPOUND_CONFIGURATION_SPECIFICATION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPOUND_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: compound_configuration_specification ::= for component_specification binding_indication ; verification_unit_binding_indication ; { verification_unit_binding_indication ; } end for ;
-- Case Type: Positive
-- Test Focus: Compound configuration with multiple verification_unit_binding_indication clauses — exercises repetition "{ verification_unit_binding_indication ; }" with three vunit bindings on one component
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_nor is
  port (x1,x2 : in bit; z : out bit);
end entity gate_nor;

architecture beh of gate_nor is
begin
end architecture beh;

entity ccs_multi_vunit is
  port(a,b : in bit; y : out bit);
end entity;

architecture bh of ccs_multi_vunit is
  component gate_nor is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_nor : gate_nor use entity work.gate_nor(beh)
    port map(x1=>a, x2=>b, z=>y);
    use vunit nor_check;
    use vunit nor_timing;
    use vunit nor_power;
  end for;
begin
  u_nor : gate_nor port map(x1=>a, x2=>b, z=>y);
end architecture bh;
