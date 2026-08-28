-- =============================================================
-- Case ID: TC_COMPOUND_CONFIGURATION_SPECIFICATION_SNN_003
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_COMPOUND_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: compound_configuration_specification ::= for component_specification binding_indication ; verification_unit_binding_indication ; { verification_unit_binding_indication ; } end for ;
-- Case Type: Negative
-- Test Focus: Missing semicolon after verification_unit_binding_indication — each vunit binding must be followed by ";", and the compound form requires semicolons between clauses
-- Expected Result: Triggers syntax error (missing semicolon after use vunit)
-- Dependencies: None
-- =============================================================
entity gate_nor is
  port (x1,x2 : in bit; z : out bit);
end entity gate_nor;

architecture beh of gate_nor is
begin
end architecture beh;

entity ccs_missing_semi is
  port(a,b : in bit; y : out bit);
end entity;

architecture bh of ccs_missing_semi is
  component gate_nor is
    port(x1,x2 : in bit; z : out bit);
  end component;
  -- ERROR: missing semicolon after "use vunit nor_check"
  for u_nor : gate_nor use entity work.gate_nor(beh)
    port map(x1=>a, x2=>b, z=>y);
    use vunit nor_check
    use vunit nor_timing;
  end for;
begin
  u_nor : gate_nor port map(x1=>a, x2=>b, z=>y);
end architecture bh;
