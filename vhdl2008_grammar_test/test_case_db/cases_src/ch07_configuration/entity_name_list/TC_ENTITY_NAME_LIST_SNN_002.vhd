-- =============================================================
-- Case ID: TC_ENTITY_NAME_LIST_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_NAME_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_name_list ::= entity_designator { , entity_designator } | others | all
-- Case Type: Negative
-- Test Focus: Trailing comma in entity_name_list — a trailing comma after the last entity_designator is invalid; the comma-separated list must end with an entity_designator, not a comma
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity enl_snn2_ent is port(r:out integer); end entity;
architecture bh of enl_snn2_ent is
  attribute tag : string;
  -- ERROR: trailing comma after last entity_designator
  attribute tag of r, : signal is "bad";
  signal s : integer := 0;
begin
  s <= 1; r <= s;
end architecture bh;
