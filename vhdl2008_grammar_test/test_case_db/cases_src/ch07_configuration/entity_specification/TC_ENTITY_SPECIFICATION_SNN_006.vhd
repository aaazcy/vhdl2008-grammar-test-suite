-- =============================================================
-- Case ID: TC_ENTITY_SPECIFICATION_SNN_006
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_ENTITY_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_specification ::= entity_name_list : entity_class
-- Case Type: Negative
-- Test Focus: entity_name_list uses a keyword that conflicts with entity_class grammar -- using "signal" directly as if it were an entity_designator name instead of following the entity_specification structure; the parser expects entity_name_list then colon then entity_class, but here "signal" appears where entity_name_list belongs
-- Expected Result: Triggers syntax error (keyword in wrong position)
-- Dependencies: None
-- =============================================================
entity espec_snn6_misplaced is
  port(
    din  : in  bit;
    dout : out bit
  );
end entity;

architecture bh of espec_snn6_misplaced is
  attribute fanin : integer;
  -- ERROR: "signal" is an entity_class, not a valid entity_designator name
  attribute fanin of signal : signal is 5;
  signal mid : bit := '0';
begin
  mid  <= din;
  dout <= mid;
end architecture bh;
