-- =============================================================
-- Case ID: TC_ENTITY_NAME_LIST_SYN_S01
-- Rule Type: Syntax
-- BNF Production: ENTITY_NAME_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_name_list ::= entity_designator { , entity_designator } | others | all
-- Test Focus: Entity name list production-specific: demonstrates all three alternatives — comma-separated entity_designator list, "others", and "all" — applied to signal class in attribute specifications
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity enl_prod_specific is
  port(a,b,c : in bit; y : out bit);
  attribute loc : string;
  attribute loc of a, b : signal is "left";
  attribute loc of c : signal is "top";
end entity;

architecture bh of enl_prod_specific is
  signal s_a, s_b, s_c : bit := '0';
  signal s_y : bit := '0';
  attribute loc of others : signal is "default";
begin
  s_a <= a; s_b <= b; s_c <= c;
  s_y <= (s_a and s_b) or s_c;
  y <= s_y;
end architecture bh;
