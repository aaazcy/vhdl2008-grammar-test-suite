-- =============================================================
-- Case ID: TC_PACKAGE_BODY_DECLARATIVE_PART_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_BODY_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body_declarative_part ::= { package_body_declarative_item }
-- Case Type: Negative
-- Test Focus: package_body_declarative_part: duplicate constant with same name — while { } allows repetitions, each item must be uniquely named; two constants with the same identifier violate the uniqueness rule within the declarative region
-- Expected Result: Triggers semantic error: duplicate declaration
-- Dependencies: None
-- =============================================================
entity pbdp_duplicate_const is
  port (
    val_a, val_b : out natural
  );
end entity;

architecture test of pbdp_duplicate_const is
  -- Item 1: valid constant
  constant C_SIZE : natural := 16;
  -- ERROR: duplicate constant with same name C_SIZE
  -- The BNF { package_body_declarative_item } allows multiple items
  -- but each item must have a unique identifier within the declarative region
  constant C_SIZE : natural := 32;  -- duplicate identifier

  signal s_a : natural := C_SIZE;
begin
  val_a <= s_a;
  val_b <= s_a;
end architecture test;
