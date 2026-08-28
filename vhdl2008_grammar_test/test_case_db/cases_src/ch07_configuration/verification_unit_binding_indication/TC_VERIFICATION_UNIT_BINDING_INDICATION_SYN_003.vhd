-- =============================================================
-- Case ID: TC_VERIFICATION_UNIT_BINDING_INDICATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_VERIFICATION_UNIT_BINDING_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.4
-- Production: verification_unit_binding_indication ::= use vunit verification_unit_list
-- Case Type: Positive
-- Test Focus: Multiple verification unit bindings on a single component — exercises repeated verification_unit_binding_indication clauses within the same compound configuration specification, with three distinct VUnit bindings each on its own line
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_xor is
  port (x1, x2 : in bit; z : out bit);
end entity gate_xor;

architecture rtl of gate_xor is
begin
end architecture rtl;

entity vubi_syn3_ent is
  port(a, b : in bit; y : out bit);
end entity vubi_syn3_ent;

architecture rtl of vubi_syn3_ent is
  component gate_xor is
    port(x1, x2 : in bit; z : out bit);
  end component gate_xor;
  for u_xor : gate_xor use entity work.gate_xor(rtl);
    use vunit xor_assertion;
    use vunit xor_coverage_check;
    use vunit xor_stimulus_gen, xor_monitor;
  end for;
begin
  u_xor : gate_xor port map(x1 => a, x2 => b, z => y);
end architecture rtl;
