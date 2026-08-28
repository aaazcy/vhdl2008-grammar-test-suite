-- =============================================================
-- Case ID: TC_ENTITY_NAME_LIST_SNN_005
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_ENTITY_NAME_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_name_list ::= entity_designator { , entity_designator } | others | all
-- Case Type: Negative
-- Test Focus: Space-separated entity_designators instead of comma-separated -- the BNF requires commas between entity_designator items; using bare whitespace as separator ("a b : signal") violates the grammar
-- Expected Result: Triggers syntax error (missing comma separator)
-- Dependencies: None
-- =============================================================
entity enl_snn5_no_comma is
  port(
    din  : in  bit;
    dout : out bit
  );
end entity;

architecture bh of enl_snn5_no_comma is
  attribute fanout_limit : integer;
  signal a_int, b_int : bit := '0';
  -- ERROR: space between entity_designators instead of comma
  attribute fanout_limit of a_int b_int : signal is 4;
begin
  a_int <= din;
  b_int <= din;
  dout <= a_int and b_int;
end architecture bh;
