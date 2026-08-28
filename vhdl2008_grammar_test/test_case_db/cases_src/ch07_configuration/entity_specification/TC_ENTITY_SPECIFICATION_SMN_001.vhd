-- =============================================================
-- Case ID: TC_ENTITY_SPECIFICATION_SMN_001
-- Rule Type: Semantic (Negative)
-- Related Rule ID: BNF_ENTITY_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_specification ::= entity_name_list : entity_class
-- Case Type: Negative (Semantic)
-- Test Focus: entity_class mismatch -- entity_designator "u_latch" is a component instantiation label (entity_class "label"), not a signal; using entity_class "signal" to attach an attribute to it creates a semantic type mismatch between the declared entity_class and the actual entity_class of the named item
-- Expected Result: Triggers semantic error (entity_class mismatch for entity_designator)
-- Dependencies: None
-- =============================================================
entity espec_smn_mismatch is
  port(
    din  : in  bit;
    dout : out bit
  );
end entity;

architecture bh of espec_smn_mismatch is
  component latch_d is
    port(d : in bit; q : out bit);
  end component;

  attribute keep_hierarchy : boolean;
  -- ERROR: u_latch is a label (entity_class "label"), not a signal
  attribute keep_hierarchy of u_latch : signal is true;

  signal mid : bit := '0';
begin
  u_latch : latch_d
    port map(d => din, q => mid);
  dout <= mid;
end architecture bh;
