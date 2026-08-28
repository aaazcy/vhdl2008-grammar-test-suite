-- =============================================================
-- Case ID: TC_ENTITY_NAME_LIST_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_NAME_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_name_list ::= entity_designator { , entity_designator } | others | all
-- Case Type: Negative
-- Test Focus: 'others' and 'all' combined in entity_name_list — the entity_name_list alternatives "others" and "all" are each standalone reserved-word alternatives; they cannot be combined with each other via comma in a single entity_name_list
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity enl_snn4_ent is
  port(
    din  : in  bit;
    dout : out bit
  );
end entity;

architecture bh of enl_snn4_ent is
  attribute max_fanout : integer;
  -- ERROR: 'others, all' combines two mutually exclusive entity_name_list alternatives
  attribute max_fanout of others, all : signal is 4;
  signal buf : bit := '0';
begin
  buf  <= din;
  dout <= buf;
end architecture bh;
