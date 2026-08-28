-- =============================================================
-- Case ID: TC_VERIFICATION_UNIT_BINDING_INDICATION_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_VERIFICATION_UNIT_BINDING_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.4
-- Production: verification_unit_binding_indication ::= use vunit verification_unit_list
-- Case Type: Negative
-- Test Focus: VUnit name conflicts with a signal name declared in the same architecture — the verification unit name "sig_check" used in verification_unit_binding_indication is exactly the same as the signal name "sig_check" already declared in the architecture, producing an identifier name conflict in the VUnit binding context
-- Expected Result: Triggers semantic error: verification unit name "sig_check" conflicts with signal "sig_check" in the same declarative region
-- Dependencies: None
-- =============================================================
entity gate_nor is
  port (x1, x2 : in bit; z : out bit);
end entity gate_nor;

architecture rtl of gate_nor is
begin
end architecture rtl;

entity vubi_smn1_ent is
  port(a, b : in bit; y : out bit);
end entity vubi_smn1_ent;

architecture rtl of vubi_smn1_ent is
  component gate_nor is
    port(x1, x2 : in bit; z : out bit);
  end component gate_nor;
  signal sig_check : bit;
  for u_nor : gate_nor use entity work.gate_nor(rtl)
    port map(x1 => a, x2 => b, z => y);
    -- ERROR: VUnit name "sig_check" shadows signal "sig_check"
    use vunit sig_check;
  end for;
begin
  sig_check <= a xor b;
  u_nor : gate_nor port map(x1 => a, x2 => b, z => y);
end architecture rtl;
