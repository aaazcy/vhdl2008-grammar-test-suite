-- =============================================================
-- Case ID: TC_ENTITY_SPECIFICATION_SNN_005
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_ENTITY_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_specification ::= entity_name_list : entity_class
-- Case Type: Negative
-- Test Focus: entity_class keyword entirely missing after colon -- the entity_specification requires an entity_class keyword after the colon; an integer literal "1" after the colon is not a valid entity_class
-- Expected Result: Triggers syntax error (entity_class expected but integer literal found)
-- Dependencies: None
-- =============================================================
entity espec_snn5_no_class is
  port(
    din  : in  bit;
    dout : out bit
  );
end entity;

architecture bh of espec_snn5_no_class is
  attribute fanout : integer;
  signal mid : bit := '0';
  -- ERROR: "1" after the colon is not an entity_class keyword
  attribute fanout of din, mid : 1 is 3;
begin
  mid  <= din;
  dout <= mid;
end architecture bh;
