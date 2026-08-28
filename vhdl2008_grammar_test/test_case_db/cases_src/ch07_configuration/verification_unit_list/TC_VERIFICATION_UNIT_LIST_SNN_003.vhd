-- =============================================================
-- Case ID: TC_VERIFICATION_UNIT_LIST_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_VERIFICATION_UNIT_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.4
-- Production: verification_unit_list ::= verification_unit_name { , verification_unit_name }
-- Case Type: Negative
-- Test Focus: Empty verification_unit_list — the "use vunit" keyword pair is present but no verification unit names follow, producing an empty list where at least one verification_unit_name is required by the grammar
-- Expected Result: Triggers syntax error: expected verification_unit_name after "vunit"
-- Dependencies: None
-- =============================================================
entity gate_xor is
  port (x1, x2 : in bit; z : out bit);
end entity gate_xor;

architecture rtl of gate_xor is
begin
end architecture rtl;

entity vul_snn3_ent is
  port(a, b : in bit; y : out bit);
end entity vul_snn3_ent;

architecture bh of vul_snn3_ent is
  component gate_xor is
    port(x1, x2 : in bit; z : out bit);
  end component gate_xor;
  for u_xor : gate_xor use entity work.gate_xor(rtl);
    -- ERROR: empty verification_unit_list — no names after "vunit"
    use vunit;
  end for;
begin
  u_xor : gate_xor port map(x1 => a, x2 => b, z => y);
end architecture bh;
