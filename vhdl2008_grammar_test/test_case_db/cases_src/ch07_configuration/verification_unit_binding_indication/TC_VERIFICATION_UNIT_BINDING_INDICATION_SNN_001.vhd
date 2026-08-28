-- =============================================================
-- Case ID: TC_VERIFICATION_UNIT_BINDING_INDICATION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_VERIFICATION_UNIT_BINDING_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.4
-- Production: verification_unit_binding_indication ::= use vunit verification_unit_list
-- Case Type: Negative
-- Test Focus: "use vunit" appears outside a configuration specification — the "use vunit" clause is placed in the concurrent statement region of the architecture (after begin), rather than in the declarative region as part of a compound configuration specification, syntactically "use vunit" can only be used in a configuration specification
-- Expected Result: Triggers syntax error: "use vunit" binding indication not allowed in statement part
-- Dependencies: None
-- =============================================================
entity gate_and is
  port (x1, x2 : in bit; z : out bit);
end entity gate_and;

architecture rtl of gate_and is
begin
end architecture rtl;

entity vubi_snn1_ent is
  port(a, b : in bit; y : out bit);
end entity vubi_snn1_ent;

architecture rtl of vubi_snn1_ent is
  component gate_and is
    port(x1, x2 : in bit; z : out bit);
  end component gate_and;
  for u_and : gate_and use entity work.gate_and(rtl)
    port map(x1 => a, x2 => b, z => y);
  end for;
begin
  u_and : gate_and port map(x1 => a, x2 => b, z => y);
  -- ERROR: "use vunit" in statement part, not in config spec
  use vunit and_checker;
end architecture rtl;
