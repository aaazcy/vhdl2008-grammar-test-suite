-- =============================================================
-- Case ID: TC_ENTITY_DECLARATIVE_PART_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declarative_part ::= { entity_declarative_item }
-- Case Type: Positive
-- Test Focus: Empty entity declarative part: entity has no declarative_part (zero entity_declarative_items), going directly to end entity, verifying zero repetitions of { } are legal — most entities use this form
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity edp_empty is
  port(x:in bit; y:out bit);
end entity;
architecture bh of edp_empty is
begin y<=x; end architecture bh;
