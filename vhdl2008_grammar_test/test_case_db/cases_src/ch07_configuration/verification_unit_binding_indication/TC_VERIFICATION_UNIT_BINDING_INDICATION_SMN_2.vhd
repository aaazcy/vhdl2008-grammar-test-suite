-- =============================================================
-- Case ID: TC_VERIFICATION_UNIT_BINDING_INDICATION_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: BNF_VERIFICATION_UNIT_BINDING_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.4
-- Production: verification_unit_binding_indication ::= use vunit verification_unit_list
-- Case Type: Negative
-- Test Focus: duplicate verification unit name appears in verification_unit_list — "use vunit checker, checker;" lists the same verification unit name "checker" twice in the same list, semantically a duplicate binding that may cause the verification unit to be instantiated multiple times
-- Expected Result: Triggers semantic warning or error: duplicate verification unit name "checker" in verification_unit_list
-- Dependencies: None
-- =============================================================
entity gate_xor is
  port (x1, x2 : in bit; z : out bit);
end entity gate_xor;

architecture rtl of gate_xor is
begin
end architecture rtl;

entity vubi_sem1_ent is
  port(a, b : in bit; y : out bit);
end entity vubi_sem1_ent;

architecture rtl of vubi_sem1_ent is
  component gate_xor is
    port(x1, x2 : in bit; z : out bit);
  end component gate_xor;
  for u_xor : gate_xor use entity work.gate_xor(rtl)
    port map(x1 => a, x2 => b, z => y);
    -- ERROR: duplicate verification unit name in same list
    use vunit checker, checker;
  end for;
begin
  u_xor : gate_xor port map(x1 => a, x2 => b, z => y);
end architecture rtl;
