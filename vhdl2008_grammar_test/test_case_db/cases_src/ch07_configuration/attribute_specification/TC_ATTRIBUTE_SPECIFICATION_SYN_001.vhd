-- =============================================================
-- Case ID: TC_ATTRIBUTE_SPECIFICATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ATTRIBUTE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: attribute_specification ::= attribute attribute_designator of entity_specification is expression ;
-- Case Type: Positive
-- Test Focus: Attribute specification with multiple entity classes: attribute values attached to various entity classes entity/architecture/signal/component/label/function, verifying the entity_name_list:entity_class syntax of entity_specification
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity as_ent is
  port(a:in integer; y:out integer);
  attribute note:string;
  attribute note of as_ent:entity is "attribute_spec_test";
end entity;
architecture bh of as_ent is
  attribute delay:integer; attribute width:integer;
  attribute delay of bh:architecture is 1;
  signal s_val:integer:=0;
  attribute width of s_val:signal is 32;
  function f_dbl(x:integer) return integer is begin return x*2; end function;
  attribute note of f_dbl[integer return integer]:function is "doubler";
begin s_val<=a; y<=f_dbl(s_val); end architecture bh;
