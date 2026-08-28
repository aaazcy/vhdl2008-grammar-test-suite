-- =============================================================
-- Case ID: TC_VERIFICATION_UNIT_BINDING_INDICATION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_VERIFICATION_UNIT_BINDING_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.4
-- Production: verification_unit_binding_indication ::= use vunit verification_unit_list
-- Case Type: Negative
-- Test Focus: Missing semicolon after verification_unit_binding_indication — the VUnit binding clause is missing its terminating semicolon, which is required to separate it from subsequent configuration items within the compound configuration specification
-- Expected Result: Triggers syntax error: missing ";" after verification_unit_binding_indication
-- Dependencies: None
-- =============================================================
entity gate_xor is
  port (x1, x2 : in bit; z : out bit);
end entity gate_xor;

architecture rtl of gate_xor is
begin
end architecture rtl;

entity vubi_snn4_ent is
  port(a, b : in bit; y : out bit);
end entity vubi_snn4_ent;

architecture bh of vubi_snn4_ent is
  component gate_xor is
    port(x1, x2 : in bit; z : out bit);
  end component gate_xor;
  for u_xor : gate_xor use entity work.gate_xor(rtl);
    -- ERROR: missing semicolon after verification_unit_binding_indication
    use vunit xor_timing_check
  end for;
begin
  u_xor : gate_xor port map(x1 => a, x2 => b, z => y);
end architecture bh;
