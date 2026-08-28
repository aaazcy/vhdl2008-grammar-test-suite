-- =============================================================
-- Case ID: TC_VERIFICATION_UNIT_LIST_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_VERIFICATION_UNIT_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.4
-- Production: verification_unit_list ::= verification_unit_name { , verification_unit_name }
-- Case Type: Positive
-- Test Focus: Two comma-separated verification unit names — exercises the comma separator between two names, demonstrating the { , verification_unit_name } repetition with a single extra element
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_or is
  port (x1, x2 : in bit; z : out bit);
end entity gate_or;

architecture rtl of gate_or is
begin
end architecture rtl;

entity vul_syn2_ent is
  port(a, b : in bit; y : out bit);
end entity vul_syn2_ent;

architecture rtl of vul_syn2_ent is
  component gate_or is
    port(x1, x2 : in bit; z : out bit);
  end component gate_or;
  for u_or : gate_or use entity work.gate_or(rtl);
    use vunit or_protocol_check, or_timing_assert;
  end for;
begin
  u_or : gate_or port map(x1 => a, x2 => b, z => y);
end architecture rtl;
