-- =============================================================
-- Case ID: TC_VERIFICATION_UNIT_BINDING_INDICATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_VERIFICATION_UNIT_BINDING_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.4
-- Production: verification_unit_binding_indication ::= use vunit verification_unit_list
-- Case Type: Negative
-- Test Focus: Missing verification_unit_list after "use vunit" — the binding indication contains the "use vunit" keyword pair but has no verification unit names following it, resulting in an empty verification_unit_binding_indication
-- Expected Result: Triggers syntax error: expected verification_unit_name after "vunit"
-- Dependencies: None
-- =============================================================
entity gate_nor is
  port (x1, x2 : in bit; z : out bit);
end entity gate_nor;

architecture beh of gate_nor is
begin
end architecture beh;

entity vubi_snn3_ent is
  port(a, b : in bit; y : out bit);
end entity vubi_snn3_ent;

architecture bh of vubi_snn3_ent is
  component gate_nor is
    port(x1, x2 : in bit; z : out bit);
  end component gate_nor;
  for u_nor : gate_nor use entity work.gate_nor(beh);
    -- ERROR: missing verification_unit_list after "use vunit"
    use vunit;
  end for;
begin
  u_nor : gate_nor port map(x1 => a, x2 => b, z => y);
end architecture bh;
