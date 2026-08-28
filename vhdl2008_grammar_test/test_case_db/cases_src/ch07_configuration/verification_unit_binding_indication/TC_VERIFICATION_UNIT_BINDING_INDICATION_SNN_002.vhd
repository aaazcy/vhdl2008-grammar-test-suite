-- =============================================================
-- Case ID: TC_VERIFICATION_UNIT_BINDING_INDICATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_VERIFICATION_UNIT_BINDING_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.4
-- Production: verification_unit_binding_indication ::= use vunit verification_unit_list
-- Case Type: Negative
-- Test Focus: Missing "vunit" keyword — the verification_unit_binding_indication is missing the required "vunit" token after "use", producing "use checker_name;" which is neither a valid VUnit binding nor a valid library use clause in this context
-- Expected Result: Triggers syntax error: expected "vunit" after "use" in verification unit binding indication
-- Dependencies: None
-- =============================================================
entity gate_nand is
  port (x1, x2 : in bit; z : out bit);
end entity gate_nand;

architecture rtl of gate_nand is
begin
end architecture rtl;

entity vubi_snn2_ent is
  port(a, b : in bit; y : out bit);
end entity vubi_snn2_ent;

architecture bh of vubi_snn2_ent is
  component gate_nand is
    port(x1, x2 : in bit; z : out bit);
  end component gate_nand;
  for u_nand : gate_nand use entity work.gate_nand(rtl);
    -- ERROR: missing "vunit" keyword in verification_unit_binding_indication
    use my_verification_check;
  end for;
begin
  u_nand : gate_nand port map(x1 => a, x2 => b, z => y);
end architecture bh;
