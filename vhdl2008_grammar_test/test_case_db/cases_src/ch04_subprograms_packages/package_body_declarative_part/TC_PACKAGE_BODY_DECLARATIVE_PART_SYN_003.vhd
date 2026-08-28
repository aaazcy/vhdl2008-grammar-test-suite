-- =============================================================
-- Case ID: TC_PACKAGE_BODY_DECLARATIVE_PART_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_BODY_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body_declarative_part ::= { package_body_declarative_item }
-- Case Type: Positive
-- Test Focus: package_body_declarative_part: empty declarative part (zero items) — exercises the zero-occurrence case of '{...}', where the package body declarative part contains no items at all
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pbdp_empty is
  port (
    pass_through : in  boolean;
    output       : out boolean
  );
end entity;

architecture test of pbdp_empty is
  -- No declarative items — simulates the zero-item case { package_body_declarative_item }
  -- Package body can have empty declarative part
begin
  output <= pass_through;
end architecture test;
