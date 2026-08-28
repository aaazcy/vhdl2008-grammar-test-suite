-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATIVE_PART_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_declarative_part ::= { package_declarative_item }
-- Case Type: Positive
-- Test Focus: package_declarative_part: empty declarative part — exercises the zero-item case of '{...}' where a package declaration has no declarative items at all (valid for marker/empty packages)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pdp_empty_items is
  port (
    input  : in  bit;
    output : out bit
  );
end entity;

architecture test of pdp_empty_items is
  -- Zero declarative items — { package_declarative_item } can be empty
begin
  output <= input;
end architecture test;
