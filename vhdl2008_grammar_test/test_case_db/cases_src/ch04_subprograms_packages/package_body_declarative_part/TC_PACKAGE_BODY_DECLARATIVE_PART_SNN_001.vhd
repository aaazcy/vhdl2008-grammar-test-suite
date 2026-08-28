-- =============================================================
-- Case ID: TC_PACKAGE_BODY_DECLARATIVE_PART_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_BODY_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body_declarative_part ::= { package_body_declarative_item }
-- Case Type: Negative
-- Test Focus: SNN: concurrent_statement mixed into declarative_part - signal assignment appears in the body declarative region which allows only declaration items
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
package pkg_bad_body is
  constant C:integer:=1;
end package pkg_bad_body;
package body pkg_bad_body is
  -- ERROR: signal assignment is not a declarative_item, illegal in declarative_part
  signal s:integer:=0;
  s<=1;
end package body pkg_bad_body;
entity pbdp_bad_ent is port(r:out integer); end entity;
architecture bh of pbdp_bad_ent is begin r<=0; end architecture bh;
