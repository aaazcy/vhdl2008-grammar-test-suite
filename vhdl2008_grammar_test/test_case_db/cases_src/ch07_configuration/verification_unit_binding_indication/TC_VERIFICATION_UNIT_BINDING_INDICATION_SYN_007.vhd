-- =============================================================
-- Case ID: TC_VERIFICATION_UNIT_BINDING_INDICATION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_VERIFICATION_UNIT_BINDING_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.4
-- Production: verification_unit_binding_indication ::= use vunit verification_unit_list
-- Case Type: Positive
-- Test Focus: VUnit binding combined with the "use configuration" binding form — binding_indication uses "use configuration" to reference a declared configuration instead of "use entity", with an additional VUnit verification binding, verifies verification_unit_binding_indication can coexist with a configuration-form binding_indication
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity vubi_syn7_ent is
  port(a, b : in bit; y : out bit);
end entity vubi_syn7_ent;

architecture rtl of vubi_syn7_ent is
  component gate_nand is
    port(x1, x2 : in bit; z : out bit);
  end component gate_nand;
  for u_nand : gate_nand use configuration work.nand_verif_cfg;
    use vunit nand_protocol_check;
  end for;
begin
  u_nand : gate_nand port map(x1 => a, x2 => b, z => y);
end architecture rtl;
