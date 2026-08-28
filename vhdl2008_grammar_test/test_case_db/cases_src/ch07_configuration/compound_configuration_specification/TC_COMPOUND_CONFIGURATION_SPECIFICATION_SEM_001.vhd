-- =============================================================
-- Case ID: TC_COMPOUND_CONFIGURATION_SPECIFICATION_SEM_001
-- Related Rule ID: SEM_COMPOUND_001
-- Rule Type: Semantic
-- BNF Production: COMPOUND_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: compound_configuration_specification ::= for component_specification binding_indication ; verification_unit_binding_indication ; { verification_unit_binding_indication ; } end for ;
-- Case Type: Positive (Semantic)
-- Test Focus: Semantic verification of compound configuration binding — ensures the compound form correctly associates a component instance with both an entity binding and vunit bindings in a semantic unit
-- Expected Result: Compiles successfully; compound binding is semantically valid
-- Dependencies: None
-- =============================================================
entity gate_xnor is
  port (x1,x2 : in bit; z : out bit);
end entity gate_xnor;

architecture beh of gate_xnor is
begin
end architecture beh;

entity ccs_sem_compound is
  port(a,b : in bit; y : out bit);
end entity;

architecture bh of ccs_sem_compound is
  component gate_xnor is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_xnor : gate_xnor use entity work.gate_xnor(beh)
    port map(x1=>a, x2=>b, z=>y);
    use vunit xnor_property;
    use vunit xnor_coverage;
  end for;
  signal s_inv : bit := '0';
  function f_not(x : bit) return bit is
  begin return not x; end function;
begin
  u_xnor : gate_xnor port map(x1=>a, x2=>b, z=>y);
  s_inv <= f_not(a and b);
end architecture bh;
