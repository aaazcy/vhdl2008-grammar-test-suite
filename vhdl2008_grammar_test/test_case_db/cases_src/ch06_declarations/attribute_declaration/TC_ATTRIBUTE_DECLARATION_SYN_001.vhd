-- =============================================================
-- Case ID: TC_ATTRIBUTE_DECLARATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ATTRIBUTE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.7
-- Production: attribute_declaration ::= attribute identifier : type_mark ;
-- Case Type: Positive
-- Test Focus: Attribute declaration + specification pairing: declares string/integer/time attributes, then attaches attribute values to entity/architecture/signal/component/label via attribute specifications, verifying the complete syntax of attribute declaration and specification
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity attr_ent is
  port(a:in integer; y:out integer);
  attribute style:string;
  attribute style of attr_ent:entity is "rtl";
end entity;
architecture bh of attr_ent is
  attribute delay:time; attribute width:integer;
  attribute width of bh:architecture is 32;
  signal s_val:integer:=0;
  attribute width of s_val:signal is 8;
  attribute delay of s_val:signal is 1 ns;
begin s_val<=a; y<=s_val; end architecture bh;
