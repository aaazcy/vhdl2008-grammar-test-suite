-- =============================================================
-- Case ID: TC_VERIFICATION_UNIT_BINDING_INDICATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_VERIFICATION_UNIT_BINDING_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.4
-- Production: verification_unit_binding_indication ::= use vunit verification_unit_list
-- Case Type: Positive
-- Test Focus: Basic verification unit binding with a single verification unit name — exercises "use vunit name;" within a compound configuration specification, demonstrating the minimal form of VUnit binding
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_and is
  port (x1, x2 : in bit; z : out bit);
end entity gate_and;

architecture rtl of gate_and is
begin
end architecture rtl;

entity vubi_syn1_ent is
  port(a, b : in bit; y : out bit);
end entity vubi_syn1_ent;

architecture rtl of vubi_syn1_ent is
  component gate_and is
    port(x1, x2 : in bit; z : out bit);
  end component gate_and;
  for u_and : gate_and use entity work.gate_and(rtl);
    use vunit and_protocol_check;
  end for;
begin
  u_and : gate_and port map(x1 => a, x2 => b, z => y);
end architecture rtl;
