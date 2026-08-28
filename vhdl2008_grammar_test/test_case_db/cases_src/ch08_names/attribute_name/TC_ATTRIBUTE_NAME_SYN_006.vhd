-- =============================================================
-- Case ID: TC_ATTRIBUTE_NAME_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_ATTRIBUTE_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.6
-- Production: attribute_name ::= prefix ' attribute_designator [ ( expression ) ]
-- Case Type: Positive
-- Test Focus: User-defined attribute name reference: signal'user_attr — after an attribute declaration + specification exists in the entity/architecture, it is referenced through 'user_attr, verifying that the attribute_designator references a user-defined attribute when the prefix is a signal name
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity an_user_ent is port(y:out integer); end entity;
architecture bh of an_user_ent is
  attribute delay:time;
  signal s_val:integer:=0;
  attribute delay of s_val:signal is 10 ns;
begin
  s_val<=42;
  y<=s_val;
end architecture bh;
