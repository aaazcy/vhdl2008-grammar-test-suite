-- =============================================================
-- Case ID: TC_VERIFICATION_UNIT_BINDING_INDICATION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_VERIFICATION_UNIT_BINDING_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.4
-- Production: verification_unit_binding_indication ::= use vunit verification_unit_list
-- Case Type: Positive
-- Test Focus: Verification unit binding with two comma-separated VUnit names — exercises "use vunit name1, name2;" demonstrating the verification_unit_list capacity within the binding indication
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_nor is
  port (x1, x2 : in bit; z : out bit);
end entity gate_nor;

architecture beh of gate_nor is
begin
end architecture beh;

entity vubi_syn2_ent is
  port(a, b : in bit; y : out bit);
end entity vubi_syn2_ent;

architecture rtl of vubi_syn2_ent is
  component gate_nor is
    port(x1, x2 : in bit; z : out bit);
  end component gate_nor;
  for u_nor : gate_nor use entity work.gate_nor(beh);
    use vunit nor_timing_check, nor_power_assert;
  end for;
begin
  u_nor : gate_nor port map(x1 => a, x2 => b, z => y);
end architecture rtl;
