-- =============================================================
-- Case ID: TC_VERIFICATION_UNIT_LIST_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: BNF_VERIFICATION_UNIT_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.4
-- Production: verification_unit_list ::= verification_unit_name { , verification_unit_name }
-- Case Type: Negative
-- Test Focus: the verification unit name in verification_unit_list is the same as the configured component name — the list uses the identifier "gate_xor", exactly the same as component_name, as the verification unit name, syntactically correct but semantically producing a naming conflict between the component name and the verification unit name
-- Expected Result: Triggers semantic warning: verification unit name "gate_xor" conflicts with component name
-- Dependencies: None
-- =============================================================
entity gate_xor is
  port (x1, x2 : in bit; z : out bit);
end entity gate_xor;

architecture rtl of gate_xor is
begin
end architecture rtl;

entity vul_sem1_ent is
  port(a, b : in bit; y : out bit);
end entity vul_sem1_ent;

architecture rtl of vul_sem1_ent is
  component gate_xor is
    port(x1, x2 : in bit; z : out bit);
  end component gate_xor;
  for u_xor : gate_xor use entity work.gate_xor(rtl)
    port map(x1 => a, x2 => b, z => y);
    -- WARNING: VUnit name "gate_xor" matches the component name
    use vunit gate_xor, timing_assert;
  end for;
begin
  u_xor : gate_xor port map(x1 => a, x2 => b, z => y);
end architecture rtl;
