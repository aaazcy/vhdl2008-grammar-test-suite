-- =============================================================
-- Case ID: TC_VERIFICATION_UNIT_BINDING_INDICATION_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_VERIFICATION_UNIT_BINDING_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.4
-- Production: verification_unit_binding_indication ::= use vunit verification_unit_list
-- Case Type: Positive
-- Test Focus: multiple VUnit bindings listed on two lines with different numbers of verification unit names — the first "use vunit" lists two verification unit names, the second lists three, showing verification_unit_list lengths can differ within verification_unit_binding_indication and multiple VUnit bindings can all be parsed correctly
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity mux_gate is
  port (s, a, b : in bit; z : out bit);
end entity mux_gate;

architecture struct of mux_gate is
begin
end architecture struct;

entity vubi_syn8_ent is
  port(sel, d0, d1 : in bit; y : out bit);
end entity vubi_syn8_ent;

architecture rtl of vubi_syn8_ent is
  component mux_gate is
    port(s, a, b : in bit; z : out bit);
  end component mux_gate;
  for u_mux : mux_gate use entity work.mux_gate(struct)
    port map(s => sel, a => d0, b => d1, z => y);
    use vunit mux_coverage, mux_timing;
    use vunit mux_stimulus, mux_assert, mux_monitor;
  end for;
begin
  u_mux : mux_gate port map(s => sel, a => d0, b => d1, z => y);
end architecture rtl;
