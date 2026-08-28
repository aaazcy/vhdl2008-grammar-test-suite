-- =============================================================
-- Case ID: TC_COMPOUND_CONFIGURATION_SPECIFICATION_SYN_003
-- Rule Type: Syntax
-- BNF Production: COMPOUND_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: compound_configuration_specification ::= for component_specification binding_indication ; verification_unit_binding_indication ; { verification_unit_binding_indication ; } end for ;
-- Case Type: Positive
-- Test Focus: Compound configuration with multi-label component_specification and no binding_indication — exercises the optional "use entity_aspect" being omitted while still providing vunit bindings
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ccs_no_binding is
  port(a,b,c,d : in bit; y1,y2 : out bit);
end entity;

architecture bh of ccs_no_binding is
  component gate_or is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_or1, u_or2 : gate_or
    use vunit or_check;
    use vunit or_delay;
  end for;
begin
  u_or1 : gate_or port map(x1=>a, x2=>b, z=>y1);
  u_or2 : gate_or port map(x1=>c, x2=>d, z=>y2);
end architecture bh;
