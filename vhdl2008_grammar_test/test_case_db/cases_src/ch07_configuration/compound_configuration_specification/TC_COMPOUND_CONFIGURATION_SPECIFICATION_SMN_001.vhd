-- =============================================================
-- Case ID: TC_COMPOUND_CONFIGURATION_SPECIFICATION_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_COMPOUND_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: compound_configuration_specification ::= for component_specification binding_indication ; verification_unit_binding_indication ; { verification_unit_binding_indication ; } end for ;
-- Case Type: Negative (Semantic)
-- Test Focus: Compound form with instantiation label that does not exist — "for u_nonexist : comp_x" references a label 'u_nonexist' that is never instantiated; the compound_specification references an instance that has no corresponding instantiation statement
-- Expected Result: Triggers semantic error (unmatched instantiation label)
-- Dependencies: None
-- =============================================================
entity gate_and is
  port (x1,x2 : in bit; z : out bit);
end entity gate_and;

architecture rtl of gate_and is
begin
end architecture rtl;

entity ccs_smn1_ent is
  port(a,b : in bit; y : out bit);
end entity;

architecture bh of ccs_smn1_ent is
  component gate_and is
    port(x1,x2 : in bit; z : out bit);
  end component;
  -- ERROR: label 'u_nonexist' never instantiated below
  for u_nonexist : gate_and use entity work.gate_and(rtl)
    port map(x1=>a, x2=>b, z=>y);
    use vunit and_check;
  end for;
begin
  u_and : gate_and port map(x1=>a, x2=>b, z=>y);
end architecture bh;
