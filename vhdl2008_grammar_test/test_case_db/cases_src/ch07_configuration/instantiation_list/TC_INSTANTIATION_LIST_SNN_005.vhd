-- =============================================================
-- Case ID: TC_INSTANTIATION_LIST_SNN_005
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_INSTANTIATION_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: instantiation_list ::= instantiation_label { , instantiation_label } | others | all
-- Case Type: Negative
-- Test Focus: Using component name instead of instantiation label in instantiation_list -- the instantiation_list must contain instantiation_label identifiers (the labels used in component instantiation statements), not the component name itself; "gate_and" is a component name, not an instantiation label
-- Expected Result: Triggers syntax or semantic error (component name used as label)
-- Dependencies: None
-- =============================================================
entity il_snn5_comp_name is
  port(
    a, b : in  bit;
    y    : out bit
  );
end entity;

architecture bh of il_snn5_comp_name is
  component gate_and is
    port(x1, x2 : in bit; z : out bit);
  end component;

  -- ERROR: "gate_and" is a component name, not an instantiation label
  for gate_and : gate_and
    use entity work.il_snn5_comp_name(bh)
    port map(x1 => a, x2 => b, z => y);

  signal s : bit := '0';
begin
  u_and : gate_and
    port map(x1 => a, x2 => b, z => s);
  y <= s;
end architecture bh;
