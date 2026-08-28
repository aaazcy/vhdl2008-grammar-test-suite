-- =============================================================
-- Case ID: TC_VERIFICATION_UNIT_BINDING_INDICATION_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_VERIFICATION_UNIT_BINDING_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.4
-- Production: verification_unit_binding_indication ::= use vunit verification_unit_list
-- Case Type: Negative
-- Test Focus: VUnit binding applied to a declared but never instantiated component — the configuration specification contains a VUnit binding, but the referenced component "unused_gate" is never instantiated in the concurrent statement region of the architecture, semantically the verification unit has no target instance to bind to
-- Expected Result: Triggers semantic warning: verification unit bound to component with no instances
-- Dependencies: None
-- =============================================================
entity gate_or is
  port (x1, x2 : in bit; z : out bit);
end entity gate_or;

architecture rtl of gate_or is
begin
end architecture rtl;

entity unused_gate is
  port (x1, x2 : in bit; z : out bit);
end entity unused_gate;

architecture rtl of unused_gate is
begin
end architecture rtl;

entity vubi_sem2_ent is
  port(a, b : in bit; y : out bit);
end entity vubi_sem2_ent;

architecture rtl of vubi_sem2_ent is
  component gate_or is
    port(x1, x2 : in bit; z : out bit);
  end component gate_or;
  component unused_gate is
    port(x1, x2 : in bit; z : out bit);
  end component unused_gate;
  for u_or : gate_or use entity work.gate_or(rtl)
    port map(x1 => a, x2 => b, z => y);
  end for;
  -- ERROR: VUnit bound to "unused_gate" which has no instances
  for u_unused : unused_gate use entity work.unused_gate(rtl);
    use vunit unused_validator;
  end for;
begin
  u_or : gate_or port map(x1 => a, x2 => b, z => y);
  -- "unused_gate" never instantiated
end architecture rtl;
