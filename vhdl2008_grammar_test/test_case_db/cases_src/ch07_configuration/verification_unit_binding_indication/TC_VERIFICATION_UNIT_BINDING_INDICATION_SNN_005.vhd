-- =============================================================
-- Case ID: TC_VERIFICATION_UNIT_BINDING_INDICATION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_VERIFICATION_UNIT_BINDING_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.4
-- Production: verification_unit_binding_indication ::= use vunit verification_unit_list
-- Case Type: Negative
-- Test Focus: verification_unit_list contains an illegal identifier starting with a digit — the verification unit name "2phase_checker" starts with a digit, violating the lexical rule that VHDL identifiers must start with a letter, syntactically it cannot be parsed as a legal verification_unit_name
-- Expected Result: Triggers syntax error: invalid identifier "2phase_checker" — must start with a letter
-- Dependencies: None
-- =============================================================
entity gate_or is
  port (x1, x2 : in bit; z : out bit);
end entity gate_or;

architecture rtl of gate_or is
begin
end architecture rtl;

entity vubi_snn5_ent is
  port(a, b : in bit; y : out bit);
end entity vubi_snn5_ent;

architecture rtl of vubi_snn5_ent is
  component gate_or is
    port(x1, x2 : in bit; z : out bit);
  end component gate_or;
  for u_or : gate_or use entity work.gate_or(rtl)
    port map(x1 => a, x2 => b, z => y);
    -- ERROR: identifier "2phase_checker" starts with a digit
    use vunit 2phase_checker;
  end for;
begin
  u_or : gate_or port map(x1 => a, x2 => b, z => y);
end architecture rtl;
