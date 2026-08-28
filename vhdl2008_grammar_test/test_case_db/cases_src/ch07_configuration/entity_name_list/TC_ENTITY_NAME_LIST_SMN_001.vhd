-- =============================================================
-- Case ID: TC_ENTITY_NAME_LIST_SMN_001
-- Rule Type: Semantic (Negative)
-- Related Rule ID: BNF_ENTITY_NAME_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_name_list ::= entity_designator { , entity_designator } | others | all
-- Case Type: Negative (Semantic)
-- Test Focus: "others" in entity_name_list when no unnamed entities remain -- after explicitly naming all signals in attribute specifications, the "others" entity_name_list finds zero unnamed entities of class signal; this semantic condition should trigger a warning or error because "others" must designate at least one entity
-- Expected Result: Triggers semantic warning/error (no unnamed entities for "others")
-- Dependencies: None
-- =============================================================
entity enl_smn_no_others is
  port(
    din  : in  bit;
    dout : out bit
  );
end entity;

architecture bh of enl_smn_no_others is
  attribute max_fanout : integer;
  -- All signals in this architecture are already explicitly named
  attribute max_fanout of din, dout : signal is 4;
  signal buf : bit := '0';
  attribute max_fanout of buf : signal is 2;
  -- ERROR: no unnamed signals remain for "others" to target
  attribute max_fanout of others : signal is 8;
begin
  buf  <= din;
  dout <= buf;
end architecture bh;
