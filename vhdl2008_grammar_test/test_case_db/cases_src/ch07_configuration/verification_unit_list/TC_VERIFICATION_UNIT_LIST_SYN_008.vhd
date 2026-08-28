-- =============================================================
-- Case ID: TC_VERIFICATION_UNIT_LIST_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_VERIFICATION_UNIT_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.4
-- Production: verification_unit_list ::= verification_unit_name { , verification_unit_name }
-- Case Type: Positive
-- Test Focus: verification_unit_list combined with "use open" binding — the component stays unbound via "use open", but a verification_unit_list containing two verification unit names is still attached, verifies the VUnit list can be applied to unbound components to reserve the verification framework
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity vul_syn8_ent is
  port(a, b : in bit; y : out bit);
end entity vul_syn8_ent;

architecture rtl of vul_syn8_ent is
  component gate_nand is
    port(x1, x2 : in bit; z : out bit);
  end component gate_nand;
  for u_nand : gate_nand use open;
    use vunit nand_stub_check, nand_bind_monitor;
  end for;
begin
  u_nand : gate_nand port map(x1 => a, x2 => b, z => y);
end architecture rtl;
