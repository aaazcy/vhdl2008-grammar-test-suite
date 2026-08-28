-- =============================================================
-- Case ID: TC_ENTITY_NAME_LIST_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_NAME_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_name_list ::= entity_designator { , entity_designator } | others | all
-- Case Type: Negative
-- Test Focus: 'others' used in wrong position — 'others' must be the sole entity_name_list alternative (not mixed with entity_designators); 'others, a : signal' is invalid
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity enl_snn3_ent is port(r:out integer); end entity;
architecture bh of enl_snn3_ent is
  attribute tag : string;
  -- ERROR: 'others' cannot be mixed with entity_designator names
  attribute tag of others, r : signal is "bad";
  signal s : integer := 0;
begin
  s <= 1; r <= s;
end architecture bh;
